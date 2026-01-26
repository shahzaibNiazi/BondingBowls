import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/utils/utils.dart';
import '../../../data/model/conversation_model.dart';

class CafeconnectChatController extends GetxController {
  // ChatsScreen ke exact variables
  final isReligionUnlocked = false.obs;
  RxBool isLoading = false.obs;

  List<ConversationModel> conversations = [];

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  void showSnackBar(String message) {
    Get.snackbar(
      "",
      message,
      backgroundColor: Colors.green.shade100,
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }

  void onReligionUnlocked() {
    isReligionUnlocked.value = true;
    showSnackBar("Religion filter unlocked successfully!");
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getConversations(userId) async {
    isLoading.value = true;

    Map<String, dynamic> json = {"targetUserId": userId};

    try {
      final response = await profileCreationRepository.getConversation();

      log('Reject response: $response');

      if (response != null && response['success'] == true) {
        conversations = response['data'].map(
          (e) => ConversationModel.fromJson(e),
        );

        update();
      } else {
        Utils.showSnackBar(
          'Error',
          response?['message']?.toString() ??
              'Booking failed. Please try again.',
          Colors.red,
        );
      }
    } catch (e, s) {
      log('Reject error: $e');
      log(s.toString());

      Utils.showSnackBar('Error', 'Something went wrong', Colors.red);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
