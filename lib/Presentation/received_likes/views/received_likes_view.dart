import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Presentation/payment_system/views/payment_system_view.dart';
import '../../../app/routes/app_pages.dart';
import '../../../src/feature/BottomBar/chat/detail_profile.dart';
import '../controllers/received_likes_controller.dart';

class ReceivedLikesView extends GetView<ReceivedLikesController> {
  const ReceivedLikesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceivedLikesController>(
      init: ReceivedLikesController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFEEDA),
          body: SafeArea(
            child: Column(
              children: [
                // Header with back button, title, and settings
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: SvgPicture.asset(
                          "assets/icon/svg/back_arrow.svg",
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Received Likes",
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
                              Get.to(() => PaymentSystemView());
                            },
                            child: SvgPicture.asset(
                              "assets/icon/svg/bowl.svg",
                              height: 33,
                              width: 33,
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${controller.userBalance.value}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Slideshow ads space
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Center(
                    child: Text(
                      '~Slideshow Ads Space',
                      style: TextStyle(
                        color: Color(0xffC672A5),
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),

                // Locked profiles with overlay
                Expanded(
                  child: Obx(() {
                    if (controller.receivedLikes.isEmpty) {
                      return Center(
                        child: Text(
                          'No received likes yet',
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      );
                    }

                    // Get first profile and remaining count
                    final firstProfile = controller.receivedLikes.first;
                    final remainingCount = controller.receivedLikes.length - 1;

                    return Stack(
                      children: [
                        // Profile cards list
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              // First profile card (always visible)
                              _buildProfileCard(
                                profile: firstProfile,
                                isFirst: true,
                                isUnlocked: true,
                              ),

                              // Remaining profile cards (visible based on unlock status)
                              if (controller.receivedLikes.length > 1)
                                ...controller.receivedLikes
                                    .skip(1)
                                    .map(
                                      (profile) => _buildProfileCard(
                                        profile: profile,
                                        isFirst: false,
                                        isUnlocked: controller.isUnlocked.value,
                                      ),
                                    ),
                            ],
                          ),
                        ),

                        // Unlock overlay (shown only when locked and there are more profiles)
                        if (!controller.isUnlocked.value && remainingCount > 0)
                          Positioned.fill(
                            child: Column(
                              children: [
                                // Space for the first visible profile card
                                SizedBox(
                                  height: 190,
                                ), // Adjust based on your card height
                                // Lock overlay that covers remaining profiles
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      _showUnlockDialog(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFFFFFFFF,
                                        ).withOpacity(0.95),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: const Color(
                                              0xFFBC0072,
                                            ).withOpacity(0.2),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0,
                                          ),
                                          child: Text(
                                            "$remainingCount more likes to review~ Click to Unlock all received likes at one go",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFBC0072),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileCard({
    required dynamic profile,
    required bool isFirst,
    required bool isUnlocked,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffBCBCBC), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Profile image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300], // Background color for the icon
                ),
                clipBehavior: Clip.hardEdge,
                child:
                    profile.profilePhoto != null &&
                        profile.profilePhoto!.isNotEmpty
                    ? Image.network(
                        profile.profilePhoto!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.grey,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    : const Center(
                        child: Icon(Icons.person, size: 40, color: Colors.grey),
                      ),
              ),
              const SizedBox(width: 16),

              // User info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and age
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              profile.nickname ?? profile.fullName ?? 'Unknown',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${profile.age ?? '--'} Years Old',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        // Show match logo only on first card or when unlocked
                        if (isFirst || isUnlocked)
                          InkWell(
                            onTap: () {
                              Get.to(() => DetailProfile());
                            },
                            child: Image.asset(
                              "assets/images/match_logo.png",
                              height: 55,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Status
                    Text(
                      '${profile.maritalStatus ?? 'N/A'} ${profile.preferredGender ?? ''}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // Relationship type
                    Text(
                      profile.datingIntentions ?? 'Serious',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Tags
                    Text(
                      _buildTags(profile),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFFBC0072),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Show "Click to view" only on first card or when unlocked
          if (isFirst || isUnlocked)
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.MATCH_PROFILE,
                  arguments: {'profile': profile},
                );
              },
              child: Text(
                'Click to view!',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _buildTags(dynamic profile) {
    List<String> tags = [];

    if (profile.occupation != null && profile.occupation!.isNotEmpty) {
      tags.add(profile.occupation!);
    }

    if (profile.hobbies != null && profile.hobbies!.isNotEmpty) {
      tags.add(profile.hobbies!);
    }

    if (profile.lifestyleInterests != null &&
        profile.lifestyleInterests!.isNotEmpty) {
      tags.add(profile.lifestyleInterests!);
    }

    return tags.isNotEmpty
        ? tags.join(' | ')
        : 'Software Engineer | Coffee Enthusiast | Yoga Lover';
  }

  void _showUnlockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmPurchaseDialog(controller: controller),
    );
  }
}

class ConfirmPurchaseDialog extends StatelessWidget {
  final ReceivedLikesController controller;

  const ConfirmPurchaseDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffFFEEDA),
            border: Border.all(color: Color(0xffBC0072), width: 2),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(color: Color(0xffBC0072), width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Section
                Text(
                  "Confirm Purchase of",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Product Info Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/svg/icon_message.svg",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Received Likes Unlocker +1 Month",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "= ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBC0072),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icon/svg/color_bowl.svg",
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Obx(
                            () => Text(
                              " ${controller.unlockCost.value}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffBC0072),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  "This will unlock all your received likes Immediately",
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Calculation Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Available", style: TextStyle(fontSize: 10.sp)),
                    Text("Deductibles", style: TextStyle(fontSize: 10.sp)),
                    Text("Balance", style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffC672A5),
                      width: 2,
                    ),
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icon/svg/color_bowl.svg",
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${controller.userBalance.value}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("-", style: TextStyle(fontSize: 16.sp)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icon/svg/color_bowl.svg",
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${controller.unlockCost.value}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFF0000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("=", style: TextStyle(fontSize: 16.sp)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icon/svg/color_bowl.svg",
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${controller.remainingBalance}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Terms Text
                Text(
                  "Purchase made are non refundable as per TOS",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 5,
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffDA4747),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                        ),
                        onPressed: () {
                          controller.unlockReceivedLikes();
                          Get.back();
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
