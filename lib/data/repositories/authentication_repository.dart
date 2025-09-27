import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../app/config/global_var.dart';
import '../provider/network/api_endpoint.dart';
import '../provider/network/api_provider.dart';

class ProfileRepository {
  late APIProvider apiClient;

  ProfileRepository() {
    apiClient = APIProvider();
  }

  Future signInAccount({String? email, String? password}) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.login,
      {
        "email": email,
        "password": password,
        "fcm_token": Globals.fcmToken,
        "device_id": Globals.deviceId,
        "device_name": Globals.deviceName,
        "login_device": Globals.loginDevice,
        "app_version": Globals.appVersion,
        "build_number": Globals.buildNumber,
      },
      false,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future registerAccount({
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.register,
      {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "fcm_token": Globals.fcmToken,
        "device_id": Globals.deviceId,
        "device_name": Globals.deviceName,
        "login_device": Globals.loginDevice,
        "app_version": Globals.appVersion,
        "build_number": Globals.buildNumber,
      },
      false,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future otpVerification({String? email, String? otp}) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.otpVerification,
      {"email": email, "otp": otp},
      false,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future updateEmployee({int? id, String? designation}) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.updateEmployeeProfile,
      {"business_profile": id, "designation": designation},
      true,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future setPassword({String? password}) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.setPassword,
      {"password": password},
      true,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future updateAccount(json, {isAuthLoading = true}) async {
    Map<String, dynamic>? data = await apiClient.basePutAPI(
      ApiEndPoints.updateUser,
      json,
      true,
      loading: isAuthLoading,
      Get.context,
    );
    return data;
  }

  Future updateBusinessAccount(json, {isAuthLoading = true}) async {
    Map<String, dynamic>? data = await apiClient.basePutAPI(
      ApiEndPoints.updateBusinessProfile,
      json,
      true,
      loading: isAuthLoading,
      Get.context,
    );
    return data;
  }

  Future forgetPasswordEmail({String? email, String? password}) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.forgetPasswordEmail,
      {"email": email},
      false,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future externalLoginCallBack({
    String? name,
    String? num,
    String? accessToken,
    String? idToken,
    String? fcmToken,
    String? provider,
    String? email,
    String? photo,
  }) async {
    Map<String, dynamic> data = await apiClient.basePostAPI(
      ApiEndPoints.externalLoginCallBack,
      {
        "token": idToken ?? "",
        "fcm_token": Globals.fcmToken,
        "device_id": Globals.deviceId,
        "device_name": Globals.deviceName,
        "login_device": Globals.loginDevice,
        "app_version": Globals.appVersion,
        "build_number": Globals.buildNumber,
      },
      false,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future appleLogin({String? name, String? idToken}) async {
    log('inside appleLogin function');
    Map<String, dynamic> data = await apiClient.basePostAPI(
      ApiEndPoints.customerAppleLogin,
      {
        "token": idToken ?? "",
        "name": name ?? "",
        "fcm_token": Globals.fcmToken,
        "device_id": Globals.deviceId,
        "device_name": Globals.deviceName,
        "login_device": Globals.loginDevice,
        "app_version": Globals.appVersion,
        "build_number": Globals.buildNumber,
      },
      false,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future uploadImage(List<String> baseImages) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.uploadImage,
      {"base64": baseImages},
      true,
      loading: true,
      Get.context,
    );

    return data;
  }

  Future uploadVideo(String videoPath) async {
    Map<String, dynamic>? data = await apiClient.basePostFormAPI(
      ApiEndPoints.uploadVideo,
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

  Future getBusinessIndustries() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.businessIndustries,
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

  Future getTags() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getTags,
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

  Future getBusinessNames() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.businessNames,
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

  Future getSkills() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getSkills,
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

  Future getServices() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getServices,
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

  Future getBusiness() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getBusiness,
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

  Future getUser() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getUser,
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

  Future getUpcomingEvents(int page) async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      '${ApiEndPoints.getUpcomingEvents}?page=$page&page_size=10',
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

  Future getCoins() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getCoins,
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

  Future getRole() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getRole,
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

  Future getAds() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getAds,
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

  Future getLeaderBoard() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getLeaderBoard,
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

  Future getBusinessCategories() async {
    Map<String, dynamic> query = {};
    Map<String, dynamic> data = {};
    final response = await apiClient.baseGetAPI(
      ApiEndPoints.getBusinessCategories,
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

  Future addContact(Map<String, dynamic> json) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.addContact,
      json,
      true,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future selectRole(String role) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.selectRole,
      {"role": role},
      true,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future scanCard(res) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.scanCard,
      {"base64": res},
      true,
      loading: true,
      Get.context,
    );
    return data;
  }

  Future getContacts() async {
    Map<String, dynamic>? data = await apiClient.baseGetAPI(
      ApiEndPoints.getContacts,
      {},
      true,
      loading: false,
      Get.context,
    );
    return data;
  }

  Future getHistory(String type, int id) async {
    Map<String, dynamic>? data = await apiClient.baseGetAPI(
      '${ApiEndPoints.getHistory}?$type=$id',
      {},
      true,
      loading: false,
      Get.context,
    );
    return data;
  }

  Future getSubscriptions() async {
    Map<String, dynamic>? data = await apiClient.baseGetAPI(
      ApiEndPoints.getSubscriptions,
      {},
      true,
      loading: false,
      Get.context,
    );
    return data;
  }

  Future postSubscribe(int id) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      '${ApiEndPoints.postSubscribe}$id/',
      {},
      true,
      loading: false,
      Get.context,
    );
    return data;
  }

  Future getMessages(int id) async {
    Map<String, dynamic>? data = await apiClient.baseGetAPI(
      '${ApiEndPoints.getMessages}?user_id=$id',
      {},
      true,
      loading: false,
      Get.context,
    );
    return data;
  }

  Future sendMessage(json) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.sendMessage,
      json,
      true,
      loading: false,
      Get.context,
    );
    return data;
  }
}
