import 'dart:io';

import 'package:convo_hearts/Presentation/cafeconnect_conversation/views/report_bottom.dart'
    hide showConfirmReportBottomSheet, showOtherBottomSheet;
import 'package:convo_hearts/Presentation/cafeconnect_conversation/views/voucher_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../matches/views/bottom_sheet.dart';
import '../controllers/cafeconnect_conversation_controller.dart';

class CafeconnectConversationView
    extends GetView<CafeconnectConversationController> {
  const CafeconnectConversationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CafeconnectConversationController>(
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
                      Text(
                        'Alex Supra',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).paddingOnly(left: 12),

                      Spacer(),
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
                              () {},

                              () async {
                                Navigator.pop(context);

                                showConfirmReportBottomSheet(context, () async {
                                  Navigator.pop(context);
                                  await controller.reportUser(
                                    id: '',
                                    reportReason: "Inappropriate Behaviour",
                                    reasonDetail:
                                        "Report for inappropriate/offensive behaviour",
                                  );
                                }); // 👈 open confirm report sheet
                              },
                              () async {
                                Navigator.pop(context);

                                showConfirmReportBottomSheet(context, () async {
                                  Navigator.pop(context);
                                  await controller.reportUser(
                                    id: '',
                                    reportReason: "Spam",
                                    reasonDetail:
                                        "Spam , Selling something (including financial product)",
                                  );
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
                    ],
                  ),
                ),

                // Slideshow Ads placeholder
                GestureDetector(
                  onTap: () {
                    showVoucherDetailsBottomSheet(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC672A5), width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Briyani House',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Promo code: 1 FOR 1 BRIYANI',
                          style: TextStyle(
                            color: Color(0xff950AFF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 12),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFFF3F3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'This conversation will end at 12pm',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 12),
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
                                  'assets/images/bowls_color.png',
                                  scale: 4,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
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
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.inputController,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: InputDecoration(
                                    hintText: 'Write a message',
                                    hintStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (_) => controller..sendMessage(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            'assets/images/mic.png',
                            scale: 1.6,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // send button (only enabled visually when text present)
                      GestureDetector(
                        onTap: controller.enabled
                            ? controller.sendMessage
                            : null,
                        child: Image.asset(
                          'assets/images/send.png',
                          scale: 5,
                          fit: BoxFit.contain,
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

  static void _openAttachmentSheet(
    BuildContext context,
    CafeconnectConversationController c,
  ) {
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
