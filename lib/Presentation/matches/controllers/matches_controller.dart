import 'dart:developer';

import 'package:convo_hearts/app/config/global_var.dart';
import 'package:convo_hearts/data/model/matching_profile_model.dart';
import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:get/get.dart';

import '../views/bottom_sheet.dart';

class MatchesController extends GetxController {
  //TODO: Implement MatchesController

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  RxBool isLoading = false.obs;

  List<MatchingProfileModel> matchingProfileModel = [];

  @override
  void onInit() {
    super.onInit();
    getMatchingProfiles();
  }

  Future<void> getMatchingProfiles() async {
    isLoading.value = true;
    try {
      final response = await profileCreationRepository.getMatchingProfile();

      if (response != null && response['success'] == true) {
        final responseData = response['data'] as List<dynamic>;

        final List<MatchingProfileModel> data = responseData
            .where((e) => e['role'] != 'Admin') // Filter out Admin profiles
            .map((e) => MatchingProfileModel.fromJson(e))
            .toList();

        log('Filtered response data ------- $data');

        matchingProfileModel = data;
        update();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> reportUser({
    required String id,
    required String reportReason,
    required String reasonDetail,
  }) async {
    Map<String, dynamic> json = {
      "reporterId": Globals.user?.id,
      "accusedId": id,
      "reportType": "Main Chat",
      "reportReason": reportReason,
      "reportReasonDetails": reasonDetail,
    };

    try {
      final response = await profileCreationRepository.userReport(json);

      if (response != null && response['success'] == true) {
        log(response.toString());
        update();
        showReportSuccessDialog(Get.context!);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());

      return false;
    }
    return false;
  }

  Future<void> likeProfile(id) async {
    try {
      final response = await profileCreationRepository.likeProfile(id);

      if (response != null && response['success'] == true) {
        log(response.toString());
        nextProfile();
        update();
      }

      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> disLikeProfile(id) async {
    try {
      final response = await profileCreationRepository.disLikeProfile(id);

      if (response != null && response['success'] == true) {
        log(response.toString());
        nextProfile();

        update();
      }

      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> superLikeProfile(id) async {
    try {
      final response = await profileCreationRepository.superLikeProfile(id);

      if (response != null && response['success'] == true) {
        log(response.toString());
        nextProfile();

        update();
      }

      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  RxInt currentIndex = 0.obs;

  void nextProfile() {
    if (currentIndex.value < matchingProfileModel.length - 1) {
      currentIndex++;
    } else {
      // Optional: When finished
      matchingProfileModel.clear();
      update();
    }
  }
}
