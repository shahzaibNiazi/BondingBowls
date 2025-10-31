import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../app/config/global_var.dart';
import '../provider/network/api_endpoint.dart';
import '../provider/network/api_provider.dart';

class ProfileCreationRepository {
  late APIProvider apiClient;
  final dioClient = dio.Dio(); // ✅ create Dio instance
  final String apiKey =
      'sk-lFyi1AeDR10BYNrjAFH8WdgMc7nLWcOKZIA0dd9xq8FYBaQE'; // 🔒 Don't expose in client builds

  ProfileCreationRepository() {
    apiClient = APIProvider();
  }

  Future<File?> convertToAnimeStyle(File inputImage) async {
    final url = "https://api.stability.ai/v2beta/stable-image/generate/ultra";

    final formData = dio.FormData.fromMap({
      'prompt': 'Lighthouse on a cliff overlooking the ocean',
      'output_format': 'webp',
      'image': await dio.MultipartFile.fromFile(inputImage.path),
    });

    final response = await dioClient.post(
      url,
      data: formData,
      options: dio.Options(
        headers: {'Authorization': 'Bearer YOUR_API_KEY', 'Accept': 'image/*'},
        responseType: dio.ResponseType.bytes,
      ),
    );

    if (response.statusCode == 200) {
      final outputFile = File('${inputImage.parent.path}/output.webp');
      await outputFile.writeAsBytes(response.data);
      return outputFile;
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
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
