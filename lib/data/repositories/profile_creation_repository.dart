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
  // final String apiKey =
  //     'sk-lFyi1AeDR10BYNrjAFH8WdgMc7nLWcOKZIA0dd9xq8FYBaQE'; // 🔒 Don't expose in client builds

  ProfileCreationRepository() {
    apiClient = APIProvider();
  }

  Future<File?> convertToAnimeStyle(File inputImage) async {
    const apiKey = "sk-WkYhugVsBSqexuJZFvWx5RdHi6aswrf2MNlIASAy0XekAbGH";
    // Replace with your real key
    const url = "https://api.stability.ai/v2beta/stable-image/image-to-image";

    final formData = dio.FormData.fromMap({
      // Describe the output style you want
      'prompt': 'Anime-style portrait of the uploaded person',
      'image': await dio.MultipartFile.fromFile(
        inputImage.path,
        filename: 'input.jpg',
      ),
      'output_format': 'webp',
      // Optional: you can add strength or other params
      // 'strength': 0.5,
    });

    try {
      final response = await dio.Dio().post(
        url,
        data: formData,
        options: dio.Options(
          headers: {'Authorization': 'Bearer $apiKey', 'Accept': 'image/*'},
          responseType: dio.ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        final outputFile = File('${inputImage.parent.path}/anime_output.webp');
        await outputFile.writeAsBytes(response.data);
        return outputFile;
      } else {
        print('Failed: ${response.statusCode}');
      }
    } catch (e) {
      if (e is dio.DioException) {
        print('Dio error: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
    }
    return null;
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

  Future getNewsLetter() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl: '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.getNewsLetter}',
      "ApiEndPoints.getUser",
      {},
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

  Future getCafe(String type, String location, String category) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl:
          '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.getCafe}?$type=true&location=$location&category=$category',
      "ApiEndPoints.getUser",
      {},
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future makeABooking(json) async {
    Map<String, dynamic> data = {};
    final response = await apiClient.basePostAPI(
      fullUrl: '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.bookings}',
      "ApiEndPoints.getUser",
      json,
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future getBooking(cafeId) async {
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl: '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.getBooking}/$cafeId',
      "ApiEndPoints.getUser",
      {},
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

  Future likeYou() async {
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl: '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.likeYou}',
      "ApiEndPoints.getUser",
      {},
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future available(cafeId) async {
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl:
          '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.available}?cafeId=$cafeId',
      "ApiEndPoints.getUser",
      {},
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future getVouchers(String filter) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl:
          '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.getVouchers}?sortBy=$filter',
      "ApiEndPoints.getUser",
      {},
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

  Future getVoucherDetails(id) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl:
          '${ApiEndPoints.otherBaseUrl}${ApiEndPoints.getVouchers}/$id/detailed',
      "ApiEndPoints.getUser",
      {},
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

  Future getMatchingProfile() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      fullUrl:
          'https://bonding-bowls.projectco.space/api/v1/${ApiEndPoints.getMatchingProfile}',
      "ApiEndPoints.getUser",
      {},
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

  Future redeemVoucher(json) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.basePostAPI(
      fullUrl:
          'https://bonding-bowls.projectco.space/api/v1/${ApiEndPoints.redeemVouchers}',
      "ApiEndPoints.getUser",
      json,
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future likeProfile(id) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.basePostAPI(
      fullUrl:
          'https://bonding-bowls.projectco.space/api/v1/${ApiEndPoints.likeProfile}',
      "ApiEndPoints.getUser",
      {"targetUserId": id},
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future userReport(json) async {
    Map<String, dynamic> data = {};
    final response = await apiClient.basePostAPI(
      fullUrl:
          'https://bonding-bowls.projectco.space/api/v1/${ApiEndPoints.report}',
      "ApiEndPoints.getUser",
      json,
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future disLikeProfile(id) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.basePostAPI(
      fullUrl:
          'https://bonding-bowls.projectco.space/api/v1/${ApiEndPoints.disLikeProfile}',
      "ApiEndPoints.getUser",
      {"targetUserId": id},
      true,
      loading: true,
      Get.context,
    );
    if (response is String) {
      log('getUser api data: $response');
    } else {
      data = response;
    }
    return data;
  }

  Future superLikeProfile(id) async {
    Map<String, dynamic> data = {};
    final response = await apiClient.basePostAPI(
      fullUrl:
          'https://bonding-bowls.projectco.space/api/v1/${ApiEndPoints.superLikeProfile}',
      "ApiEndPoints.getUser",
      {"targetUserId": id},
      true,
      loading: true,
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
