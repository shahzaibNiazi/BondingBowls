import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:get/get.dart';

import '../../../app/config/global_var.dart';
import '../../cafeconnect_conversation/views/report_bottom.dart';

class MatchProfileController extends GetxController {
  //TODO: Implement MatchProfileController

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  final count = 0.obs;

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
