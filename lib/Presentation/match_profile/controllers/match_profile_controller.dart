import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/global_var.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/matching_profile_model.dart';
import '../../cafeconnect_booking_details/views/cafeconnect_booking_details_view.dart';
import '../../cafeconnect_conversation/views/report_bottom.dart';

class MatchProfileController extends GetxController {
  RxBool isLoading = false.obs;

  //TODO: Implement MatchProfileController

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  final count = 0.obs;
  MatchingProfileModel? profileModel;

  void onInit() {
    profileModel = Get.arguments['profile'];
    super.onInit();
  }

  Future<void> createConversation(userId) async {
    /// ---- API CALL ----
    Map<String, dynamic> json = {'type': 'match', 'otherUserId': userId};

    try {
      final response = await profileCreationRepository.createConversation(json);

      log(response.toString());
      if (response != null && response['success'] == true) {
        showMatchDialog(Get.context!);
        Get.back();

        update();

        // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
      } else {
        Utils.showSnackBar(
          'Error',
          'Booking Failed Please Try again ',
          Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
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

  void increment() => count.value++;
}
