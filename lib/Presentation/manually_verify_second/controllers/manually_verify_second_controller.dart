import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:video_player/video_player.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/global_var.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/local_storage/local_db.dart';
import '../../../data/provider/network/api_endpoint.dart';
import '../../../data/repositories/profile_creation_repository.dart';
import '../../../src/feature/BottomBar/bottom_bar.dart';

class ManuallyVerifySecondController extends GetxController {
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();
  SimpleFontelicoProgressDialog? dialog;

  final Rx<File?> capturedVideo = Rx<File?>(null);
  VideoPlayerController? videoPlayerController;

  CameraController? cameraController;
  RxBool isRecording = false.obs;
  List<CameraDescription>? cameras;

  String? videoUrl;

  // Face Detection variables
  FaceDetector? faceDetector;
  Timer? _faceDetectionTimer;
  bool _isProcessing = false;
  RxBool isFaceValid = false.obs;
  RxString faceDetectionMessage = 'Position your face in the frame'.obs;

  @override
  void onInit() async {
    super.onInit();
    log('🟢 ManuallyVerifySecondController onInit started');
    _initializeFaceDetector();
    await initCamera();
    dialog = SimpleFontelicoProgressDialog(context: Get.context!);
  }

  void _initializeFaceDetector() {
    log('🟡 Initializing face detector...');
    try {
      final options = FaceDetectorOptions(
        enableContours: false,
        enableClassification: false,
        minFaceSize: 0.15,
        performanceMode: FaceDetectorMode.fast,
      );
      faceDetector = FaceDetector(options: options);
      log('✅ Face detector initialized successfully');
    } catch (e) {
      log('❌ Face detector initialization error: $e');
    }
  }

  Future<void> initCamera() async {
    log('🟡 Initializing camera...');
    try {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras!.firstWhere(
          (cam) => cam.lensDirection == CameraLensDirection.front,
        ),
        ResolutionPreset.medium,
        enableAudio: true,
      );

      await cameraController!.initialize();
      log('✅ Camera initialized successfully');

      // Add a small delay before starting face detection
      await Future.delayed(Duration(milliseconds: 500));

      update();

      // Start face detection after camera is fully initialized
      _startFaceDetection();
    } catch (e) {
      log("❌ Camera initialization error: $e");
    }
  }

  void _startFaceDetection() {
    log('🟡 Starting face detection...');

    if (faceDetector == null) {
      log('❌ Cannot start face detection - detector is null');
      return;
    }

    _faceDetectionTimer?.cancel();
    _faceDetectionTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (!_isProcessing &&
          cameraController != null &&
          cameraController!.value.isInitialized &&
          capturedVideo.value == null &&
          !isRecording.value) {
        _detectFace();
      }
    });
    log('✅ Face detection timer started');
  }

  Future<void> _detectFace() async {
    if (_isProcessing ||
        faceDetector == null ||
        cameraController == null ||
        !cameraController!.value.isInitialized ||
        isRecording.value) {
      return;
    }

    _isProcessing = true;
    log('🔍 Detecting face...');

    try {
      final image = await cameraController!.takePicture();
      log('📸 Picture taken: ${image.path}');

      final inputImage = InputImage.fromFilePath(image.path);
      final faces = await faceDetector!.processImage(inputImage);

      log('👤 Faces detected: ${faces.length}');

      // Delete the temporary image
      try {
        await File(image.path).delete();
      } catch (e) {
        log('⚠️ Error deleting temp image: $e');
      }

      if (faces.isEmpty) {
        isFaceValid.value = false;
        faceDetectionMessage.value =
            '📱 No face detected\nPlease look at the camera';
        log('❌ No face detected');
      } else if (faces.length > 1) {
        isFaceValid.value = false;
        faceDetectionMessage.value =
            '⚠️ Multiple faces detected\nOnly one person allowed';
        log('⚠️ Multiple faces: ${faces.length}');
      } else {
        log('✅ One face detected, validating position...');
        final face = faces.first;
        _validateFacePosition(face);
      }
    } catch (e) {
      log('❌ Error detecting face: $e');
    } finally {
      _isProcessing = false;
    }
  }

  void _validateFacePosition(Face face) {
    try {
      final boundingBox = face.boundingBox;

      // Calculate face size relative to image
      final faceWidth = boundingBox.width;

      // Get camera preview size (swapped for portrait mode)
      final imageWidth = cameraController!.value.previewSize!.height;
      final imageHeight = cameraController!.value.previewSize!.width;

      final faceWidthRatio = faceWidth / imageWidth;

      log('📏 Face width ratio: ${faceWidthRatio.toStringAsFixed(2)}');

      // Check if face is centered
      final faceCenterX = boundingBox.left + (boundingBox.width / 2);
      final faceCenterY = boundingBox.top + (boundingBox.height / 2);
      final imageCenterX = imageWidth / 2;
      final imageCenterY = imageHeight / 2;

      final isHorizontallyCentered =
          (faceCenterX - imageCenterX).abs() < imageWidth * 0.25;
      final isVerticallyCentered =
          (faceCenterY - imageCenterY).abs() < imageHeight * 0.25;

      // Validation logic
      if (faceWidthRatio < 0.20) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Please move closer\nZoom in your face';
        log('❌ Face too far');
      } else if (faceWidthRatio > 0.75) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Too close\nMove back a bit';
        log('❌ Face too close');
      } else if (!isHorizontallyCentered) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Center your face\nMove horizontally';
        log('❌ Not centered horizontally');
      } else if (!isVerticallyCentered) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Center your face\nMove vertically';
        log('❌ Not centered vertically');
      } else {
        isFaceValid.value = true;
        faceDetectionMessage.value = '✅ Perfect!\nReady to record';
        log('✅ Face position perfect!');
      }
    } catch (e) {
      print('❌ Error validating face position: $e');
    }
  }

  Future<void> startRecording() async {
    if (cameraController != null && !isRecording.value) {
      // Check if face is valid before starting recording
      if (!isFaceValid.value) {
        Utils.showSnackBar(
          'Face Not Detected',
          'Please position your face properly before recording',
          Colors.red,
        );
        return;
      }

      try {
        // Stop face detection during recording
        _faceDetectionTimer?.cancel();
        log('✅ Face detection stopped for recording');

        final tempDir = Directory.systemTemp;
        final filePath =
            '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

        await cameraController!.startVideoRecording();
        isRecording.value = true;
        log('✅ Recording started');
        update();
      } catch (e) {
        log("❌ Start recording error: $e");
        Utils.showSnackBar('Error', 'Failed to start recording', Colors.red);
      }
    }
  }

  Future<void> stopRecording() async {
    if (cameraController != null && isRecording.value) {
      try {
        final XFile file = await cameraController!.stopVideoRecording();
        isRecording.value = false;

        capturedVideo.value = File(file.path);
        log('✅ Recording stopped: ${file.path}');

        videoPlayerController = VideoPlayerController.file(capturedVideo.value!)
          ..initialize().then((_) {
            videoPlayerController!.play();
            update();
          });
      } catch (e) {
        log("❌ Stop recording error: $e");
        Utils.showSnackBar('Error', 'Failed to stop recording', Colors.red);
      }
    }
  }

  void clear() {
    capturedVideo.value = null;
    videoPlayerController?.dispose();
    videoPlayerController = null;

    // Restart face detection when clearing
    if (cameraController != null && cameraController!.value.isInitialized) {
      _startFaceDetection();
      log('✅ Face detection restarted after clear');
    }

    update();
  }

  Future<void> uploadFile() async {
    if (capturedVideo.value == null) return;

    dialog?.show(
      indicatorColor: AppColors.lightBlack,
      message: 'Uploading video...',
      textStyle: TextStyle(color: AppColors.lightBlack),
      type: SimpleFontelicoProgressDialogType.normal,
    );

    try {
      final dio.Dio dioClient = dio.Dio();
      final fileName = capturedVideo.value?.path.split('/').last;

      final formData = dio.FormData.fromMap({
        'video': await dio.MultipartFile.fromFile(
          capturedVideo.value!.path,
          filename: fileName,
        ),
      });

      final response = await dioClient.post(
        ApiEndPoints.multiBaseUrl + ApiEndPoints.uploadVideo,
        data: formData,
        options: dio.Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer ${Globals.authToken}',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        videoUrl = response.data['data']["fileUrl"].toString();
        log('✅ Video uploaded: $videoUrl');
        if (videoUrl != null) await updateProfileCreation();
        update();
      } else {
        throw Exception("Upload failed");
      }
    } catch (e) {
      dialog?.hide();
      log("❌ Upload error: $e");
      Utils.showSnackBar('Error', 'Failed to upload video', Colors.red);
    }
  }

  Future<void> updateProfileCreation() async {
    try {
      Map<String, dynamic> json = {"video": videoUrl};
      final response = await profileCreationRepository.profileCreation(json);

      if (response != null && response['profile'] != null) {
        UserModel user = UserModel.fromJson(response['profile']);
        await LocalDB.setData('user_data', user.toJson());
        Globals.user = UserModel.fromJson(
          jsonDecode(await LocalDB.getData('user_data')),
        );

        dialog?.hide();
        Get.to(
          () => BottomNavBar(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 800),
        );

        Utils.showSnackBar('Success', "Wait for admin approval", Colors.green);
        update();
      }
    } catch (e) {
      log('❌ Error: ${e.toString()}');
      dialog?.hide();
      Utils.showSnackBar('Error', 'Failed to update profile', Colors.red);
    } finally {
      dialog?.hide();
    }
  }

  @override
  void onClose() {
    log('🔴 Disposing controller...');

    // Cancel timer first
    try {
      _faceDetectionTimer?.cancel();
      _faceDetectionTimer = null;
      log('✅ Timer cancelled');
    } catch (e) {
      log('⚠️ Error cancelling timer: $e');
    }

    // Close face detector
    try {
      faceDetector?.close();
      faceDetector = null;
      log('✅ Face detector closed');
    } catch (e) {
      log('⚠️ Error closing face detector: $e');
    }

    // Dispose camera controller
    try {
      cameraController?.dispose();
      cameraController = null;
      log('✅ Camera disposed');
    } catch (e) {
      log('⚠️ Error disposing camera: $e');
    }

    // Dispose video player controller
    try {
      videoPlayerController?.dispose();
      videoPlayerController = null;
      log('✅ Video player disposed');
    } catch (e) {
      log('⚠️ Error disposing video player: $e');
    }

    log('✅ Controller disposed successfully');
    super.onClose();
  }
}
