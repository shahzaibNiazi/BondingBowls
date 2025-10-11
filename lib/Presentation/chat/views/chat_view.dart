import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // Top header with soft background, back arrow and avatar
                Container(
                  color: const Color(0xFFF8EBDD), // soft peach like screenshot
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_ios_new, size: 26),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            'assets/images/AI-AVATAR.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Slideshow Ads placeholder
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '*Slideshow Ads Space',
                      style: TextStyle(
                        color: Colors.pink[300],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // main chat area - flexible
                Expanded(
                  child: Stack(
                    children: [
                      // white background (messages appear above)
                      Container(color: Colors.white),

                      // big faded logo centered near lower-middle
                      IgnorePointer(
                        ignoring: true,
                        child: Center(
                          child: Opacity(
                            opacity: 0.12,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/image_splash2.jpg',
                                  scale: 1,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'BONDING BOWLS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withValues(alpha: 0.15),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // messages list
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 86,
                        ), // leave space for input bar
                        child: Obx(() {
                          final msgs = controller.messages;
                          if (msgs.isEmpty) {
                            // when empty, show just background (no messages)
                            return Container();
                          }
                          return ListView.builder(
                            controller: controller.scrollController,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            itemCount: msgs.length,
                            itemBuilder: (context, index) {
                              final m = msgs[index];
                              final alignment = m.isMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start;
                              final bg = m.isMe
                                  ? Colors.black
                                  : Colors.grey[200];
                              final txtColor = m.isMe
                                  ? Colors.white
                                  : Colors.black87;
                              final radius = BorderRadius.only(
                                topLeft: const Radius.circular(12),
                                topRight: const Radius.circular(12),
                                bottomLeft: Radius.circular(m.isMe ? 12 : 2),
                                bottomRight: Radius.circular(m.isMe ? 2 : 12),
                              );
                              return Column(
                                crossAxisAlignment: alignment,
                                children: [
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: m.isMe
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.75,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: bg,
                                            borderRadius: radius,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(
                                                  alpha: 0.03,
                                                ),
                                                blurRadius: 2,
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: (m.imagePath != null)
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.file(
                                                    File(m.imagePath!),
                                                    width:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width *
                                                        0.6,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Text(
                                                  m.text ?? '',
                                                  style: TextStyle(
                                                    color: txtColor,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  // small timestamp
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: m.isMe ? 0 : 8,
                                      right: m.isMe ? 8 : 0,
                                    ),
                                    child: Text(
                                      _formatTime(m.createdAt),
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                // Bottom chat input bar
                Container(
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFF3EDEE,
                    ), // subtle background like screenshot
                    border: Border(
                      top: BorderSide(
                        color: Colors.black.withValues(alpha: 0.04),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      // plus button
                      GestureDetector(
                        onTap: () => _openAttachmentSheet(context, controller),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // text field container
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                              color: Colors.black.withValues(alpha: 0.12),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.inputController,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: const InputDecoration(
                                    hintText: 'Write a message',
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (_) => controller..sendMessage(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // mic pressed - implement voice recording if needed
                                  Get.snackbar(
                                    'Mic',
                                    'Microphone pressed (not implemented)',
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Icon(Icons.mic, size: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // send button (only enabled visually when text present)
                      GestureDetector(
                        onTap: controller.enabled
                            ? controller.sendMessage
                            : null,
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: controller.enabled
                                ? Colors.black
                                : Colors.black.withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void _openAttachmentSheet(BuildContext context, ChatController c) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.photo)),
                  title: const Text('Photo (Gallery)'),
                  onTap: () {
                    Get.back();
                    c.sendImage(source: ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.camera_alt)),
                  title: const Text('Camera'),
                  onTap: () {
                    Get.back();
                    c.sendImage(source: ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
