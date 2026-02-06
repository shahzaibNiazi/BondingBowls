import 'dart:io';

import 'package:convo_hearts/Presentation/chat/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/config/global_var.dart';
import '../../cafeconnect_conversation/views/report_bottom.dart';
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
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Center(
                    child: Text(
                      '~Slideshow Ads Space',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),

                // Top header with soft background, back arrow and avatar
                Container(
                  color: const Color(0xFFF8EBDD), // soft peach like screenshot
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_ios_new, size: 26),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(UserView());
                        },
                        child: Center(
                          child: Text(
                            'Alex Supra',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showReportBottom(
                            context,
                            items: [
                              "Unmatch",
                              'Report for inappropriate/offensive behaviour',
                              'Spam , Selling something (including financial product)',
                              'Others',
                            ],
                            onTap: [
                              () {
                                showMatchRatingDialog(context);
                              },

                              () async {
                                Navigator.pop(context);

                                showConfirmReportBottomSheet(context, () async {
                                  Navigator.pop(context);
                                  // await controller.reportUser(
                                  //   id: '',
                                  //   reportReason: "Inappropriate Behaviour",
                                  //   reasonDetail:
                                  //   "Report for inappropriate/offensive behaviour",
                                  // );
                                }); // 👈 open confirm report sheet
                              },
                              () async {
                                Navigator.pop(context);

                                showConfirmReportBottomSheet(context, () async {
                                  Navigator.pop(context);
                                  // await controller.reportUser(
                                  //   id: '',
                                  //   reportReason: "Spam",
                                  //   reasonDetail:
                                  //   "Spam , Selling something (including financial product)",
                                  // );
                                });
                              },
                              () {
                                Navigator.pop(context);

                                showOtherBottomSheet(
                                  context,
                                ); // 👈 open second bottom sheet
                              },
                            ],
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            "assets/icon/svg/tri_info.svg",
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 68,
                      //   height: 68,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(6),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withValues(alpha: 0.03),
                      //         blurRadius: 6,
                      //         offset: const Offset(0, 2),
                      //       ),
                      //     ],
                      //   ),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(6),
                      //     child: Image.asset(
                      //       'assets/images/AI-AVATAR.jpg',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ],
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
                                  // Padding(
                                  //   padding: EdgeInsets.only(
                                  //     left: m.isMe ? 0 : 8,
                                  //     right: m.isMe ? 8 : 0,
                                  //   ),
                                  //   child: Text(
                                  //     _formatTime(m.createdAt),
                                  //     style: TextStyle(
                                  //       fontSize: 11,
                                  //       color: Colors.black54,
                                  //     ),
                                  //   ),
                                  // ),
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
                                  onSubmitted: (_) => controller.sendMessage(
                                    myUserId: Globals.user!.id ?? '',
                                  ),
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
                            ? () {
                                controller.sendMessage(
                                  myUserId: "myUserId_here",
                                );
                              }
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

  void showMatchRatingDialog(BuildContext context) {
    String? selectedOption;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "How would you rate your match?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Radio Item Builder
                    _ratingOption(
                      title: "Decent",
                      value: "Decent",
                      selected: selectedOption,
                      onChanged: (value) {
                        setState(() => selectedOption = value);
                      },
                    ),

                    _ratingOption(
                      title: "Engaging",
                      value: "Engaging",
                      selected: selectedOption,
                      onChanged: (value) {
                        setState(() => selectedOption = value);
                      },
                    ),

                    _ratingOption(
                      title: "Dry texter",
                      value: "Dry texter",
                      selected: selectedOption,
                      onChanged: (value) {
                        setState(() => selectedOption = value);
                      },
                    ),

                    _ratingOption(
                      title: "Just not my type",
                      value: "Not my type",
                      selected: selectedOption,
                      onChanged: (value) {
                        setState(() => selectedOption = value);
                      },
                    ),

                    const SizedBox(height: 20),

                    // Confirm Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3D6AFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: selectedOption == null
                                ? null
                                : () {
                                    Navigator.pop(context);
                                    print("Selected: $selectedOption");
                                  },
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _ratingOption({
    required String title,
    required String value,
    required String? selected,
    required Function(String) onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: selected,
            onChanged: (v) => onChanged(v!),
            visualDensity: VisualDensity.compact,
          ),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
