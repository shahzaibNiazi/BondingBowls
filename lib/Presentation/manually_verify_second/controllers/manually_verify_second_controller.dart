import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() async {
    super.onInit();
    await initCamera();
    dialog = SimpleFontelicoProgressDialog(context: Get.context!);
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras!.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
      ),
      ResolutionPreset.medium,
      enableAudio: true,
    );
    await cameraController!.initialize();
    update();
  }

  Future<void> startRecording() async {
    if (cameraController != null && !isRecording.value) {
      try {
        final tempDir = Directory.systemTemp;
        final filePath =
            '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

        await cameraController!.startVideoRecording();
        isRecording.value = true;
        update();
      } catch (e) {
        log("Start recording error: $e");
      }
    }
  }

  Future<void> stopRecording() async {
    if (cameraController != null && isRecording.value) {
      try {
        final XFile file = await cameraController!.stopVideoRecording();
        isRecording.value = false;

        capturedVideo.value = File(file.path);
        videoPlayerController = VideoPlayerController.file(capturedVideo.value!)
          ..initialize().then((_) {
            videoPlayerController!.play();
            update();
          });
      } catch (e) {
        log("Stop recording error: $e");
      }
    }
  }

  void clear() {
    capturedVideo.value = null;
    videoPlayerController?.dispose();
    videoPlayerController = null;
    update();
  }

  Future<void> uploadFile() async {
    if (capturedVideo.value == null) return;

    dialog?.show(
      indicatorColor: AppColors.lightBlack,
      message: 'Loading...',
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
        if (videoUrl != null) await updateProfileCreation();
        update();
      } else {
        throw Exception("Upload failed");
      }
    } catch (e) {
      dialog?.hide();
      log("Upload error: $e");
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
      log('Error: ${e.toString()}');
      dialog?.hide();
    } finally {
      dialog?.hide();
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    videoPlayerController?.dispose();
    super.onClose();
  }
}
