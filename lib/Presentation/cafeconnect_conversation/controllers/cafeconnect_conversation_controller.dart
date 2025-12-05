import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/config/global_var.dart';
import '../../../data/model/message_model.dart';
import '../../matches/views/bottom_sheet.dart';

class CafeconnectConversationController extends GetxController {
  final messages = <Message>[].obs;
  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  bool get canSend => inputController.text.trim().isNotEmpty;

  bool enabled = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    inputController.addListener(buttonEnabled);
  }

  buttonEnabled() {
    enabled = inputController.text.trim().isNotEmpty;
    update();
  }

  void sendMessage() {
    final text = inputController.text.trim();
    if (text.isEmpty) return;
    messages.add(Message(text: text, createdAt: DateTime.now(), isMe: true));
    inputController.clear();
    _scrollToBottom();
  }

  Future<void> sendImage({required ImageSource source}) async {
    try {
      final picked = await picker.pickImage(source: source, imageQuality: 70);
      if (picked != null) {
        messages.add(
          Message(
            imagePath: picked.path,
            createdAt: DateTime.now(),
            isMe: true,
          ),
        );
        _scrollToBottom();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
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

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
