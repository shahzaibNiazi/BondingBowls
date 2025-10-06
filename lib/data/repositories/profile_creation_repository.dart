import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../app/config/global_var.dart';
import '../provider/network/api_endpoint.dart';
import '../provider/network/api_provider.dart';

class ProfileCreationRepository {
  late APIProvider apiClient;

  ProfileCreationRepository() {
    apiClient = APIProvider();
  }

  Future profileCreation(json) async {
    Map<String, dynamic>? data = await apiClient.basePutAPI(
      '${ApiEndPoints.profileCreation}${Globals.user!.id.toString()}',
      json,
      true,
      loading: false,
      Get.context,
    );
    return data;
  }

  Future uploadVideo(String videoPath) async {
    Map<String, dynamic>? data = await apiClient.basePostFormAPI(
      "ApiEndPoints.uploadVideo",
      {
        "video": await dio.MultipartFile.fromFile(
          videoPath,
          filename: 'video.mp4',
        ),
      },
      true,
      loading: true,
      Get.context!,
    );

    return data;
  }

  Future getUser() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      "ApiEndPoints.getUser",
      query,
      true,
      loading: false,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }
}
