import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/message_model.dart';

class ChatController extends GetxController {
  final messages = <Message>[].obs;
  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();

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

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
