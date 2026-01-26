import 'package:convo_hearts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Presentation/payment_system/views/payment_system_view.dart';
import '../../received_likes/views/received_likes_view.dart';
import '../controllers/cafeconnect_chat_controller.dart';

class CafeconnectChatView extends GetView<CafeconnectChatController> {
  const CafeconnectChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CafeconnectChatController>(
      init: CafeconnectChatController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFEEDA),
          body: Column(
            children: [
              // -------------------- FIXED TOP AREA --------------------
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: false,
                            maintainState: true,
                            maintainSize: true,
                            maintainAnimation: true,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentSystemView(),
                                      ),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icon/svg/bowl.svg",
                                    height: 33,
                                    width: 33,
                                  ),
                                ),
                                Text(
                                  "300",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Chats",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentSystemView(),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/icon/svg/bowl.svg",
                                  height: 33,
                                  width: 33,
                                ),
                              ),
                              Text(
                                "300",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Slideshow banner
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReceivedLikesView(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xffBC0072)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 8.0,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Received Likes (70)",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // -------------- SCROLLABLE CONTENT BELOW ONLY ----------------
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ----------------- MAIN SCROLL AREA -----------------
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 25,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text(
                                  "CaféConnect matches",
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFF9500),
                                  ),
                                ),
                              ),
                            ),

                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.cafeConnectConversations.length,
                              itemBuilder: (context, index) {
                                final chat =
                                    controller.cafeConnectConversations[index];

                                final profilePhoto =
                                    chat.otherUser?.profilePhoto;
                                final imagePath =
                                    (profilePhoto != null &&
                                        profilePhoto.isNotEmpty &&
                                        profilePhoto != 'default-profile.png')
                                    ? profilePhoto // must be full URL if backend provides
                                    : 'assets/images/AI-AVATAR.jpg';

                                return _buildChatItem(
                                  context: context,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          ConfirmPurchaseDialog(
                                            receiverId:
                                                chat.otherUser?.id ?? '',
                                            conversationId: chat.id ?? '',
                                            onPurchaseConfirmed:
                                                controller.onReligionUnlocked,
                                          ),
                                    );
                                  },
                                  name:
                                      chat
                                          .otherUser
                                          ?.nickname
                                          ?.capitalizeFirst ??
                                      '',
                                  location: '25F, Chinese', // map later
                                  isOnline: true,
                                  isMainMatch: chat.type == 'match',
                                  assetimage: imagePath,
                                  top_text: chat.type?.toUpperCase() ?? '',
                                );
                              },
                            ),

                            SizedBox(height: 40),

                            _divider("Main Matches", const Color(0xffBD5FCC)),

                            SizedBox(height: 20),

                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.mainMatches.length,
                              itemBuilder: (context, index) {
                                final chat = controller.mainMatches[index];

                                final profilePhoto =
                                    chat.otherUser?.profilePhoto;
                                final imagePath =
                                    (profilePhoto != null &&
                                        profilePhoto.isNotEmpty &&
                                        profilePhoto != 'default-profile.png')
                                    ? profilePhoto // must be full URL if backend provides
                                    : 'assets/images/AI-AVATAR.jpg';

                                return _buildChatItem(
                                  context: context,
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.CHAT,
                                      arguments: {
                                        'conversationId': chat.id ?? '',
                                        'receiverId': chat.otherUser?.id ?? '',
                                      },
                                    );
                                  },
                                  name:
                                      chat
                                          .otherUser
                                          ?.nickname
                                          ?.capitalizeFirst ??
                                      '',
                                  location: '25F, Chinese', // map later
                                  isOnline: true,
                                  isMainMatch: chat.type == 'match',
                                  assetimage: imagePath,
                                  hasNewMessage: true,
                                  color1: Color(0xffFF0000),
                                  top_text: chat.type?.toUpperCase() ?? '',
                                );
                              },
                            ),

                            // _buildChatItem(
                            //   context: context,
                            //   onTap: () {
                            //     Get.toNamed(Routes.CHAT);
                            //   },
                            //   name: "Alex supatra",
                            //   location: "25F, Chinese",
                            //   isOnline: true,
                            //   hasNewMessage: true,
                            //   assetimage: 'assets/images/AI-AVATAR.jpg',
                            //   top_text: 'Singpass',
                            //   color1: Color(0xffFF0000),
                            // ),
                            SizedBox(height: 40),

                            _divider("System message", Color(0xff6C495E)),

                            SizedBox(height: 20),

                            ChatItemTaco(
                              onTap: () {
                                Get.toNamed(Routes.SYSTEM_CHAT);
                              },
                              name: "SysTaco",
                              details: "1M/F, Taco",
                              badgeText: "TacoPass",
                              imagePath: "assets/images/robot_taco.jpg",
                              messageCount: "13",
                            ),

                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ----------------- Helper Widgets -----------------

  Widget _divider(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: color)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: color)),
        ],
      ),
    );
  }

  Widget _buildChatItem({
    required BuildContext context,
    required String name,
    required String location,
    required String assetimage,
    required String top_text,
    required void Function()? onTap,
    Color color1 = const Color(0xffE39898),
    bool isOnline = false,
    bool hasNewMessage = false,
    bool isMainMatch = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border.all(color: Color.fromARGB(73, 0, 0, 0)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 97,
                  width: 92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: assetimage.startsWith('http')
                      ? Image.network(
                          assetimage,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/AI-AVATAR.jpg',
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(assetimage, fit: BoxFit.cover),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: color1,
                          border: Border.all(
                            color: Color(0xffC672A5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          top_text,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (hasNewMessage)
            Positioned(
              top: -2,
              right: 9,
              child: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ------------------ Taco Item ------------------

class ChatItemTaco extends StatelessWidget {
  final String name;
  final String details;
  final String badgeText;
  final String imagePath;
  final String messageCount;
  final void Function() onTap;

  const ChatItemTaco({
    super.key,
    required this.name,
    required this.onTap,
    required this.details,
    required this.badgeText,
    required this.imagePath,
    required this.messageCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            padding: const EdgeInsets.fromLTRB(80, 12, 16, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Image.asset("assets/images/verify.png", scale: 2),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    details,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -5,
            left: 60,
            child: Image.asset(imagePath, height: 110),
          ),

          Positioned(
            top: -2,
            right: 9,
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmPurchaseDialog extends StatelessWidget {
  final VoidCallback onPurchaseConfirmed;
  final String conversationId;
  final String receiverId;

  const ConfirmPurchaseDialog({
    super.key,
    required this.onPurchaseConfirmed,
    required this.conversationId,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 35.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/cafeconnect.png", scale: 4),
              Text(
                "Congrats on finding a match on CaféConnect!",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                "Do make sure all interactions are legal and safe!",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                "Reported users will be handled to authorities",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.toNamed(
                          Routes.CAFECONNECT_CONVERSATION,
                          arguments: {
                            'conversationId': conversationId,
                            'receiverId': receiverId,
                          },
                        );
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ).paddingSymmetric(horizontal: 70.w),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
