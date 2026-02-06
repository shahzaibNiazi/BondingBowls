import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/config/global_var.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/cafeconnect_messages.dart';
import '../../../data/repositories/profile_creation_repository.dart';
import '../../chat/views/report.dart';

class CafeconnectConversationController extends GetxController {
  final messages = <CafeconnectMessageModel>[].obs;

  final RxBool isLoading = false.obs;
  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();

  final ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  String? conversationId;
  String? receiverId;

  bool enabled = false;

  @override
  void onInit() {
    super.onInit();
    conversationId = Get.arguments['conversationId'];
    receiverId = Get.arguments['receiverId'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchMessages(
        myUserId: Globals.user?.id ?? '',
        chatUserId: receiverId ?? '',
      );
    });

    log(receiverId.toString());

    inputController.addListener(() {
      enabled = inputController.text.trim().isNotEmpty;
      update();
    });
  }

  /// ✅ SINGLE sendMessage (UI + API merged)
  Future<void> sendMessage({required String myUserId}) async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    /// 1️⃣ Optimistic message
    final tempMessage = CafeconnectMessageModel(
      message: text,
      messageType: 'text',
      conversationId: conversationId,
      createdAt: DateTime.now(),
      isMe: true,
      isSending: true,
      isFailed: false,
    );

    messages.add(tempMessage);
    inputController.clear();
    update();
    _scrollToBottom();

    final payload = {
      "receiverId": receiverId,
      "message": text,
      "messageType": "text",
    };

    try {
      final response = await profileCreationRepository.sendMessage(payload);

      if (response != null && response['success'] == true) {
        final apiMessage = CafeconnectMessageModel.fromJson(
          response['data'],
          myUserId,
        );

        // Ensure sent message stays on the right side
        final finalMessage = apiMessage.copyWith(isMe: true, isSending: false);

        final index = messages.indexOf(tempMessage);
        if (index != -1) {
          messages[index] = finalMessage;
        }
      } else {
        _markFailed(tempMessage);
      }
    } catch (e) {
      _markFailed(tempMessage);
    } finally {
      update();
      _scrollToBottom();
    }
  }

  Future<void> fetchMessages({
    required String myUserId,
    required String chatUserId,
  }) async {
    try {
      final response = await profileCreationRepository.getMessages(chatUserId);

      if (response != null && response['success'] == true) {
        final data = response['data'] as List<dynamic>;

        messages.value = data
            .map(
              (json) => CafeconnectMessageModel.fromJson(
                json as Map<String, dynamic>,
                myUserId,
              ),
            )
            .toList();

        // Sort messages by creation date
        messages.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

        update();
        _scrollToBottom();
      }
    } catch (e) {
      debugPrint("Failed to fetch messages: $e");
    }
  }

  void _markFailed(CafeconnectMessageModel msg) {
    final index = messages.indexOf(msg);
    if (index != -1) {
      messages[index] = msg.copyWith(isSending: false, isFailed: true);
    }

    Utils.showSnackBar('Error', 'Message not sent', Colors.red);
  }

  Future<void> sendImage({required ImageSource source}) async {
    try {
      final picked = await picker.pickImage(source: source, imageQuality: 70);
      if (picked != null) {
        messages.add(
          CafeconnectMessageModel(
            imagePath: picked.path,
            createdAt: DateTime.now(),
            isMe: true,
          ),
        );
        _scrollToBottom();
      }
    } catch (e) {
      Get.snackbar('Error', 'Image pick failed');
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 80,
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
  }

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
