import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/matching_profile_model.dart';

class ReceivedLikesController extends GetxController {
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  List<MatchingProfileModel> receivedLikes = <MatchingProfileModel>[].obs;

  // User balance
  final userBalance = 300.obs;

  // Unlock cost
  final unlockCost = 200.obs;

  // Is unlocked
  final isUnlocked = false.obs;

  // Remaining balance after purchase
  int get remainingBalance => userBalance.value - unlockCost.value;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchReceiveLikes();
    });
  }

  // Fetch received likes from API/Database
  Future<void> fetchReceiveLikes() async {
    try {
      final response = await profileCreationRepository.fetchReceiveLikes();

      if (response != null && response['success'] == true) {
        final data = response['data']
            .map<MatchingProfileModel>((e) => MatchingProfileModel.fromJson(e))
            .toList();
        receivedLikes = data;
        update();
      } else {
        debugPrint("Failed to fetch messages: $response");
      }
    } catch (e) {
      debugPrint("Failed to fetch messages: $e");
    }
  }

  // Unlock received likes
  void unlockReceivedLikes() {
    if (userBalance.value >= unlockCost.value) {
      userBalance.value -= unlockCost.value;
      isUnlocked.value = true;

      Get.snackbar(
        "Success",
        "Received likes unlocked successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Get.theme.colorScheme.onPrimary,
      );
    } else {
      Get.snackbar(
        "Insufficient Balance",
        "You don't have enough balance to unlock",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
