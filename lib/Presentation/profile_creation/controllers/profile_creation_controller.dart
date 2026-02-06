import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:convo_hearts/data/provider/network/api_endpoint.dart';
import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/global_var.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/local_storage/local_db.dart';
import '../../../src/feature/Profile-Creation/profile_creation4.dart';
import '../../../verify-dating-profile/dating_verification.dart';

class ProfileCreationController extends GetxController {
  //TODO: Implement ProfileCreationController
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> capturedImage = Rx<File?>(null);
  CameraController? cameraController;
  var isCameraInitialized = false.obs;
  final count = 0.obs;
  var question = ''.obs;
  final AudioRecorder record = AudioRecorder(); // ✅ FIXED
  final player = AudioPlayer();

  FaceDetector? faceDetector;
  Timer? _faceDetectionTimer;
  bool _isProcessing = false;
  RxBool isFaceValid = false.obs;
  RxString faceDetectionMessage = 'Position your face in the frame'.obs;

  final ImagePicker picker = ImagePicker();
  SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
    context: Get.context!,
  );
  // Store picked images
  var images = <dynamic>[].obs;

  String? audioUrl;

  List<String> imagesUrl = [];

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  String? recordedFilePath;

  List<String> locations = [
    'East',
    'North',
    'North-East',
    'North-West',
    'South',
    'South-East',
    'South-West',
    'West',
    'Central',
  ];

  List<String> religions = [
    'Atheist',
    'Buddhism',
    'Christianity',
    'Islam',
    'Taoism',
    'Hinduism',
    'Other',
  ];

  List<String> greenFlags = [
    'Likes to Call',
    'Open Communication',
    'Trustworthy & Honest',
    'Accountability',
    'Supportive Behavior',
    'Conflict Resolver',
    'Flexibility',
    'Sharing Responsibilities',
  ];

  List<String> redFlags = [
    'Dry Texter',
    'Lack Communication',
    'Bad Anger Management',
    'Bad Time Management',
    'Avoids Conflict',
    'Controlling',
    'Unflexible',
    'Inconsistent Behavior',
  ];

  RxInt seconds = 0.obs;
  Timer? _timer;
  // Form fields
  final TextEditingController nickname = TextEditingController();
  final TextEditingController jobInterests = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController university = TextEditingController();
  final TextEditingController hobbies = TextEditingController();
  final TextEditingController lifestyleInterests = TextEditingController();
  final TextEditingController bio = TextEditingController();
  // Dropdown selections
  String selectedLocation = 'Location';
  String selectedReligion = 'Religion';

  // Dating Intentions - only one can be selected at a time
  String selectedDatingIntention = '';

  // Checkboxes
  bool isStudent = false;
  bool isWorking = false;
  bool isOther = false;

  // Selected languages
  List<String> selectedGreenFlags = [];
  List<String> selectedRedFlags = [];

  // Status selection
  String selectedStatus = '';

  // Lifestyle questions
  String selectedSmoking = '';
  String selectedDrinking = '';
  String selectedClubs = '';

  // Pet ownership
  String ownsPet = ''; // 'yes', 'no', or ''

  @override
  void onInit() {
    super.onInit();
    _initializeFaceDetector();
    initCamera();

    reloadData();
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
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await cameraController!.initialize();
      isCameraInitialized.value = true;

      // ADD THESE LINES
      await Future.delayed(Duration(milliseconds: 500));
      _startFaceDetection(); // START FACE DETECTION
      update();
    } catch (e) {
      log('Camera init error: $e');
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
          capturedImage.value == null) {
        _detectFace();
      }
    });
    log('✅ Face detection timer started');
  }

  Future<void> _detectFace() async {
    if (_isProcessing ||
        faceDetector == null ||
        cameraController == null ||
        !cameraController!.value.isInitialized) {
      return;
    }

    _isProcessing = true;

    try {
      final image = await cameraController!.takePicture();
      final inputImage = InputImage.fromFilePath(image.path);
      final faces = await faceDetector!.processImage(inputImage);

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
      } else if (faces.length > 1) {
        isFaceValid.value = false;
        faceDetectionMessage.value =
            '⚠️ Multiple faces detected\nOnly one person allowed';
      } else {
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
      final faceWidth = boundingBox.width;

      // Get camera preview size (swapped for portrait mode)
      final imageWidth = cameraController!.value.previewSize!.height;
      final imageHeight = cameraController!.value.previewSize!.width;

      final faceWidthRatio = faceWidth / imageWidth;

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
      } else if (faceWidthRatio > 0.75) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Too close\nMove back a bit';
      } else if (!isHorizontallyCentered) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Center your face\nMove horizontally';
      } else if (!isVerticallyCentered) {
        isFaceValid.value = false;
        faceDetectionMessage.value = '📱 Center your face\nMove vertically';
      } else {
        isFaceValid.value = true;
        faceDetectionMessage.value = '✅ Perfect!\nReady to capture';
      }
    } catch (e) {
      log('❌ Error validating face position: $e');
    }
  }

  Future<void> captureImage() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }
    XFile image = await cameraController!.takePicture();

    // Copy the file to a permanent directory
    final tempDir = await getTemporaryDirectory();
    final savedImage = await File(image.path).copy(
      '${tempDir.path}/captured_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    capturedImage.value = savedImage;

    if (capturedImage.value != null) {
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) => ProfileCreation4()),
      );
    }
    // await generateImage(savedImage);

    log("Captured image: $capturedImage");
  }

  void reloadData() async {
    if (Globals.user!.profileImages != null &&
        Globals.user!.profileImages!.isNotEmpty) {
      images.addAll(Globals.user!.profileImages ?? []);
    }

    updateNickname(Globals.user?.nickname ?? '');
    updateBio(Globals.user?.bio ?? '');
    updateJobInterests(Globals.user?.lifestyleInterests ?? '');
    selectDatingIntention(Globals.user?.datingIntentions ?? '');
    updateHobbies(Globals.user?.hobbies ?? '');
    updateLifestyleInterests(Globals.user?.lifestyleInterests ?? '');
    occupation.text = Globals.user?.occupation ?? '';
    selectedLocation = Globals.user?.location ?? '';
    selectedReligion = Globals.user?.religion ?? '';
    selectedStatus = Globals.user?.userStatus ?? '';
    selectedSmoking = Globals.user?.smoking ?? '';
    selectedDrinking = Globals.user?.drinking ?? '';
    selectedClubs = Globals.user?.clubbing ?? '';
    ownsPet = Globals.user?.pets == true ? 'yes' : 'no';

    selectedGreenFlags = List<String>.from(Globals.user?.greenFlags ?? []);
    selectedRedFlags = List<String>.from(
      Globals.user?.redFlags ?? [],
    ); // ✅ FIX HERE

    audioUrl = Globals.user?.voicePrompt ?? '';
    log(audioUrl.toString());
  }

  // Methods
  void updateNickname(String value) {
    nickname.text = value;
    update();
  }

  File? _image;
  String? outputImage;
  final dio.Dio _dio = dio.Dio();
  final String _apiKey = 'sk-WkYhugVsBSqexuJZFvWx5RdHi6aswrf2MNlIASAy0XekAbGH';

  Future pickImage1() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      log(_image!.path);
      outputImage = null;
    }
  }

  Future<File?> generateImage1(String prompt) async {
    try {
      final response = await _dio.post(
        'https://api.stability.ai/v2beta/stable-image/generate/sd3',
        options: dio.Options(
          headers: {'Authorization': 'Bearer $_apiKey', 'Accept': 'image/jpeg'},
          responseType: dio.ResponseType.bytes,
        ),
        data: {"prompt": prompt, "output_format": "jpeg"},
      );

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/generated_image.jpeg');
      await file.writeAsBytes(response.data);
      log('Image saved at ${file.path}');
      return file;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }

  Future generateImage(originalImage) async {
    final animeImage = await profileCreationRepository.convertToAnimeStyle(
      originalImage,
    );
    if (animeImage != null) {
      log('Anime Image ${animeImage.path}');
      Image.file(animeImage);
    }
  }

  void updateJobInterests(String value) {
    jobInterests.text = value;
    update();
  }

  void updateOccupation(String value) {
    occupation.text = value;
    update();
  }

  void updateHobbies(String value) {
    hobbies.text = value;
    update();
  }

  void updateLifestyleInterests(String value) {
    lifestyleInterests.text = value;
    update();
  }

  void updateBio(String value) {
    bio.text = value;
    update();
  }

  // Dating Intentions methods
  void selectDatingIntention(String intention) {
    selectedDatingIntention = intention;
    log(selectedDatingIntention);
    update();
  }

  // Language selection methods
  void toggleRedFlag(String language) {
    if (selectedRedFlags.contains(language)) {
      selectedRedFlags.remove(language);
    } else {
      selectedRedFlags.add(language);
    }
    update();
  }

  void toggleGreenFlag(String language) {
    log(language);
    if (selectedGreenFlags.contains(language)) {
      selectedGreenFlags.remove(language);
      log(selectedGreenFlags.toString());
    } else {
      log(language);
      selectedGreenFlags.add(language);
      log(selectedGreenFlags.toString());
    }
    update();
  }

  bool isGreenFlagSelected(String language) {
    return selectedGreenFlags.contains(language);
  }

  bool isRedFlagSelected(String language) {
    return selectedRedFlags.contains(language);
  }

  // Methods for status and lifestyle
  void selectStatus(String status) {
    selectedStatus = status;
    update();
  }

  void selectSmoking(String smoking) {
    selectedSmoking = smoking;
    update();
  }

  void selectDrinking(String drinking) {
    selectedDrinking = drinking;
    update();
  }

  void selectClubs(String clubs) {
    selectedClubs = clubs;
    update();
  }

  void selectPetOwnership(String pet) {
    ownsPet = pet;
    update();
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileSize = await file.length();
      const int maxFileSize = 5 * 1024 * 1024; // 1 MB in bytes
      final sizeInMb = (fileSize / (1024 * 1024)).toStringAsFixed(2);

      if (fileSize > maxFileSize) {
        // ⚠️ File too large — show toast and don't add to list
        Get.snackbar(
          'File Too Large',
          'Image size ($sizeInMb MB) exceeds 5 MB limit',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(12),
          duration: const Duration(seconds: 3),
        );
        return;
      }

      // ✅ Add only if under 1 MB
      images.add(file);
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
  }

  void updateQuestion(String value) {
    if (value.length <= 40) {
      question.value = value;
    }
  }

  // Future<void> captureImage() async {
  //   final XFile? image = await _picker.pickImage(
  //     source: ImageSource.camera,
  //     preferredCameraDevice: CameraDevice.front,
  //     imageQuality: 80,
  //   );
  //
  //   if (image != null) {
  //     // Copy the file to a permanent directory
  //     final tempDir = await getTemporaryDirectory();
  //     final savedImage = await File(image.path).copy(
  //       '${tempDir.path}/captured_${DateTime.now().millisecondsSinceEpoch}.jpg',
  //     );
  //
  //     capturedImage.value = savedImage;
  //     await generateImage(savedImage);
  //   }
  //
  //   update();
  // }
  RxBool isRecording = false.obs; // 🔥 Instant UI feedback

  /// Called instantly from UI
  Future<void> startRecording() async {
    isRecording.value = true; // 🔥 UI changes immediately
    _startMic(); // Mic starts in background (no delay felt)
  }

  /// Real mic start (takes ~0.5–1 sec)
  Future<void> _startMic() async {
    if (!await record.hasPermission()) {
      log("🚫 Recording permission denied");
      isRecording.value = false;
      return;
    }

    final dir = await getTemporaryDirectory();
    recordedFilePath =
        '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.wav';

    log("🎙️ Recording to: $recordedFilePath");

    // Mic start → MAY TAKE TIME
    await record.start(
      const RecordConfig(
        encoder: AudioEncoder.wav,
        sampleRate: 44100,
        numChannels: 1,
        bitRate: 128000,
      ),
      path: recordedFilePath!,
    );

    // Timer start (after recording actually starts)
    seconds.value = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value >= 30) {
        stopRecording();
      } else {
        seconds.value++;
      }
    });
  }

  // /// Start recording with 30s limit
  // Future<void> startRecording() async {
  //   if (await record.hasPermission()) {
  //     final dir = await getTemporaryDirectory();
  //     recordedFilePath =
  //         '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.wav';
  //
  //     log("🎙️ Recording to: $recordedFilePath");
  //
  //     await record.start(
  //       const RecordConfig(
  //         encoder: AudioEncoder.wav, // ✅ WAV (PCM 16-bit under the hood)
  //         sampleRate: 44100, // ✅ Standard rate, iOS-safe
  //         numChannels: 1, // ✅ Mono - widely supported
  //         bitRate: 128000, // Optional - ignored for PCM but okay to include
  //       ),
  //       path: recordedFilePath!,
  //     );
  //
  //     // Start timer (max 30 sec)
  //     seconds.value = 0;
  //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //       if (seconds.value >= 30) {
  //         stopRecording();
  //       } else {
  //         seconds.value++;
  //       }
  //     });
  //   } else {
  //     log("🚫 Recording permission denied");
  //   }
  // }

  /// Stop recording
  Future<void> stopRecording() async {
    await record.stop();
    _timer?.cancel();
    _timer = null;
    isRecording.value = false;
    log(recordedFilePath.toString());

    update();
    // if (recordedFilePath != null) {
    //   Get.toNamed(Routes.VOICE_PROMPT_SECOND); // navigate to 2nd screen
    // }
  }

  /// Redo recording
  void redoRecording() {
    log("Shahzaib");
    if (recordedFilePath != null) {
      File(recordedFilePath!).delete();
    }
    recordedFilePath = null;
    seconds.value = 0;
    isRecording.value = false;
    log("Shahzaib");
    update();
    // Get.back();
  }

  Future<void> updateProfileCreation() async {
    if (nickname.text.isEmpty) {
      Utils.showSnackBar('Validation', "Enter a nickname", Colors.red);
      return;
    }
    if (selectedDatingIntention.isEmpty) {
      Utils.showSnackBar('Validation', "Please select intention", Colors.red);
      return;
    }
    if (occupation.text.isEmpty) {
      Utils.showSnackBar('Validation', "Enter a occupation", Colors.red);
      return;
    }
    if (hobbies.text.isEmpty) {
      Utils.showSnackBar('Validation', "Enter a hobbies", Colors.red);
      return;
    }
    if (lifestyleInterests.text.isEmpty) {
      Utils.showSnackBar(
        'Validation',
        "Enter a lifestyle/interests",
        Colors.red,
      );
      return;
    }
    if (bio.text.isEmpty) {
      Utils.showSnackBar(
        'Validation',
        "Please write about yourself",
        Colors.red,
      );
      return;
    }
    if (selectedLocation.isEmpty) {
      Utils.showSnackBar('Validation', "Enter a location", Colors.red);
      return;
    }
    if (selectedReligion.isEmpty) {
      Utils.showSnackBar('Validation', "Enter a religion", Colors.red);
      return;
    }

    if (selectedStatus.isEmpty) {
      Utils.showSnackBar('Validation', "Enter a status", Colors.red);
      return;
    }
    if (selectedSmoking.isEmpty) {
      Utils.showSnackBar('Validation', "Do you smoke?", Colors.red);
      return;
    }
    if (selectedDrinking.isEmpty) {
      Utils.showSnackBar('Validation', "Do you drink?", Colors.red);
      return;
    }
    if (selectedClubs.isEmpty) {
      Utils.showSnackBar('Validation', "Do you go to club?", Colors.red);
      return;
    }
    if (selectedClubs.isEmpty) {
      Utils.showSnackBar('Validation', "Do you own pets?", Colors.red);
      return;
    }

    try {
      Map<String, dynamic> json = {
        "nickname": nickname.text,
        "bio": bio.text,
        "occupation": occupation.text,
        "profileImages": imagesUrl,
        "hobbies": hobbies.text,
        "lifestyleInterests": lifestyleInterests.text,
        "datingIntentions": selectedDatingIntention,
        "location": selectedLocation,
        "religion": selectedReligion,
        "userStatus": selectedStatus,
        "smoking": selectedSmoking,
        "drinking": selectedDrinking,
        "clubbing": selectedClubs,
        "pets": ownsPet == 'yes' ? true : false,
        "voicePrompt": audioUrl ?? '',
        "greenFlags": selectedGreenFlags,
        "redFlags": selectedRedFlags,
        "profileSetup": true,
      };

      dialog.show(
        indicatorColor: AppColors.lightBlack,
        message: 'Loading...',
        textStyle: TextStyle(color: AppColors.lightBlack),
        type: SimpleFontelicoProgressDialogType.normal,
      );

      if (images.isNotEmpty) {
        await processImages();
      }

      final response = await profileCreationRepository.profileCreation(json);

      log(response.toString());

      if (response != null) {
        if (response['profile'] != null) {
          UserModel user = UserModel.fromJson(response['profile']);
          await LocalDB.setData('user_data', user.toJson());
          Globals.user = UserModel.fromJson(
            jsonDecode(await LocalDB.getData('user_data')),
          );

          Utils.showSnackBar(
            'Success',
            "User profile updated successfully",
            Colors.green,
          );
          dialog.hide();
          update();
          Get.to(() => VerificationDatingScreen());
        }
      }
    } catch (e) {
      log('-----Strings----${e.toString()}');
      dialog.hide();
    } finally {
      dialog.hide();
    }
  }

  int getCurrentLength(String label) {
    switch (label) {
      case 'Nickname':
        return nickname.text.length;
      case 'Occupation':
        return occupation.text.length;
      case 'Hobbies':
        return hobbies.text.length;
      case 'Lifestyle / Interests':
        return lifestyleInterests.text.length;
      default:
        return 0;
    }
  }

  Future<String?> uploadFile(File file) async {
    try {
      final dio.Dio dioClient = dio.Dio();
      final fileName = file.path.split('/').last;

      final formData = dio.FormData.fromMap({
        'image': await dio.MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      log(ApiEndPoints.multiBaseUrl + ApiEndPoints.uploadImage);
      final response = await dioClient.post(
        ApiEndPoints.multiBaseUrl + ApiEndPoints.uploadImage,
        data: formData,
        options: dio.Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer ${Globals.authToken}',
          },
        ),
      );
      log(response.data['data'].toString());
      log(response.data['data']["fileUrl"].toString());
      if (response.statusCode == 200 && response.data != null) {
        log(response.data["fileUrl"].toString());
        return response.data['data']["fileUrl"].toString();
      } else {
        throw Exception("Upload failed");
      }
    } catch (e) {
      log("Upload error: $e");
      return null;
    }
  }

  /// Process all images (upload local files, keep http links as is)
  Future<void> processImages() async {
    try {
      imagesUrl.clear();

      for (var img in images) {
        if (img is File) {
          try {
            final url = await uploadFile(img);
            if (url != null) {
              imagesUrl.add(url);
            }
          } catch (e, stackTrace) {
            log("Error uploading file: $e");
            log("StackTrace: $stackTrace");
          }
        } else if (img is String && img.startsWith("http")) {
          imagesUrl.add(img); // already hosted, just keep it
        }
      }

      log("✅ Final Images: $imagesUrl");
    } catch (e, stackTrace) {
      log("❌ Error in processImages: $e");
      log("StackTrace: $stackTrace");
    }
  }

  Future uploadAudio(String file) async {
    dialog.show(
      indicatorColor: AppColors.lightBlack,
      message: 'Loading...',
      textStyle: TextStyle(color: AppColors.lightBlack),
      type: SimpleFontelicoProgressDialogType.normal,
    );

    try {
      final dio.Dio dioClient = dio.Dio();
      final fileName = file.split('/').last;

      final formData = dio.FormData.fromMap({
        'audio': await dio.MultipartFile.fromFile(file, filename: fileName),
      });

      log(ApiEndPoints.multiBaseUrl + ApiEndPoints.uploadAudio);
      final response = await dioClient.post(
        ApiEndPoints.multiBaseUrl + ApiEndPoints.uploadAudio,
        data: formData,
        options: dio.Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer ${Globals.authToken}',
          },
        ),
      );

      log('Status code: ${response.statusCode}');
      log('Response: ${response.data}');

      // assuming API returns uploaded image url inside response.data["url"]
      if (response.statusCode == 200 &&
          response.data['data']["fileUrl"] != null) {
        dialog.hide();
        var url = response.data['data']["fileUrl"].toString();
        log('https://bonding-bowls.projectco.space$url');
        audioUrl = 'https://bonding-bowls.projectco.space$url';
        Get.back();
        Get.back();
        update();
      } else {
        dialog.hide();
        throw Exception("Upload failed");
      }
    } catch (e) {
      dialog.hide();
      log("Upload error: $e");
    }
  }

  Future<String> downloadToLocal(String url) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/temp_audio.wav';

    log("🔗 Downloading from: $url");

    try {
      final dioClient = dio.Dio();

      final response = await dioClient.download(url, filePath);

      log("✅ Downloaded to: $filePath | Status: ${response.statusCode}");
    } catch (e) {
      log("❌ Download failed: $e");
      rethrow;
    }

    return filePath;
  }

  // MODIFY YOUR resetCapture METHOD
  void resetCapture() async {
    capturedImage.value = null;
    cameraController?.dispose();
    await initCamera(); // This will restart face detection automatically
  }

  // MODIFY YOUR onClose METHOD - ADD cleanup for face detection
  @override
  void onClose() {
    // Cancel timer
    _faceDetectionTimer?.cancel();
    _faceDetectionTimer = null;

    // Close face detector
    faceDetector?.close();
    faceDetector = null;

    // Dispose camera
    cameraController?.dispose();

    super.onClose();
  }
}
