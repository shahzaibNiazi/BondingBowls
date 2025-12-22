import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/global_var.dart';
import '../../../app/routes/app_pages.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/local_storage/local_db.dart';
import '../../../data/provider/network/api_endpoint.dart';

class ManuallyVerifyController extends GetxController {
  //TODO: Implement ManuallyVerifyController

  final Rx<File?> capturedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();
  SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
    context: Get.context!,
  );
  String? imageUrl;

  Future<void> captureImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      capturedImage.value = File(image.path);
    }
    update();
  }

  clear() {
    capturedImage.value = null;
    update();
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      capturedImage.value = File(image.path);
    }
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
      final fileName = capturedImage.value?.path.split('/').last;

      final formData = dio.FormData.fromMap({
        'image': await dio.MultipartFile.fromFile(
          capturedImage.value!.path,
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
        imageUrl = response.data['data']["fileUrl"].toString();

        if (imageUrl != null) {
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
      Map<String, dynamic> json = {
        "verificationDocuments": [imageUrl],
        "verificationMethod": "Manual",
      };

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

          update();
        }
      }
      dialog.hide();
      Get.toNamed(Routes.MANUALLY_VERIFY_SECOND);
    } catch (e) {
      log('-----Strings----${e.toString()}');
      dialog.hide();
    } finally {
      dialog.hide();
    }
  }
}
