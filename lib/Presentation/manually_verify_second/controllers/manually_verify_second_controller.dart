import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  //TODO: Implement ManuallyVerifySecondController

  final count = 0.obs;

  final ImagePicker _picker = ImagePicker();

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();
  SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
    context: Get.context!,
  );
  String? videoUrl;

  final Rx<File?> capturedVideo = Rx<File?>(null);
  VideoPlayerController? videoPlayerController;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> captureVideo() async {
    final XFile? video = await _picker.pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (video != null) {
      capturedVideo.value = File(video.path);
      videoPlayerController = VideoPlayerController.file(capturedVideo.value!)
        ..initialize().then((_) {
          videoPlayerController!.play();
          update();
        });
    }
  }

  clear() {
    capturedVideo.value = null;
    update();
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      capturedVideo.value = File(image.path);
    }
  }

  void removeImage() {
    capturedVideo.value = null;
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

  Future uploadFile() async {
    dialog.show(
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

      log(ApiEndPoints.multiBaseUrl + ApiEndPoints.uploadVideo);
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
      log(response.data['data'].toString());
      log(response.data['data']["fileUrl"].toString());
      if (response.statusCode == 200 && response.data != null) {
        log(response.data["fileUrl"].toString());
        videoUrl = response.data['data']["fileUrl"].toString();

        if (videoUrl != null) {
          await updateProfileCreation();
        }
        update();
      } else {
        dialog.hide();
        throw Exception("Upload failed");
      }
    } catch (e) {
      dialog.hide();
      log("Upload error: $e");
      return null;
    }
  }

  Future<void> updateProfileCreation() async {
    try {
      Map<String, dynamic> json = {"video": videoUrl};

      final response = await profileCreationRepository.profileCreation(json);

      log(response.toString());

      if (response != null) {
        if (response['profile'] != null) {
          UserModel user = UserModel.fromJson(response['profile']);
          await LocalDB.setData('user_data', user.toJson());
          Globals.user = UserModel.fromJson(
            jsonDecode(await LocalDB.getData('user_data')),
          );

          dialog.hide();
          Get.to(
            () => BottomNavBar(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 800),
          );

          Utils.showSnackBar(
            'Success',
            "Wait for admin approval",
            Colors.green,
          );

          update();
        }
      }
    } catch (e) {
      log('-----Strings----${e.toString()}');
      dialog.hide();
    } finally {
      dialog.hide();
    }
  }
}
