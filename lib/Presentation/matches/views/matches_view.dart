import 'package:convo_hearts/data/model/matching_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../src/feature/BottomBar/speakable_prompt.dart';
import '../../../src/feature/settings/notification.dart';
import '../../payment_system/views/payment_system_view.dart';
import '../controllers/matches_controller.dart';
import '../no_matches.dart';
import 'animated_buttom.dart';
import 'bottom_sheet.dart';

class MatchesView extends GetView<MatchesController> {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchesController>(
      init: MatchesController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5E6D3),
          body: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icon/svg/notification.svg",
                        ),
                      ),
                      Image.asset("assets/images/bowls_remove.png", scale: 5),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.to(() => GetBowlsScreen());
                              Get.to(() => PaymentSystemView());
                            },
                            child: SvgPicture.asset(
                              "assets/icon/svg/bowl.svg",
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text(
                            "300",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ).paddingOnly(right: 12),
                    ],
                  ),
                ),

                // Slideshow Banner
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Center(
                    child: Text(
                      '~Slideshow Ads Spaces',
                      style: TextStyle(
                        color: Color(0xffC672A5),
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ).paddingOnly(bottom: 14.h),

                Obx(() {
                  if (controller.isLoading.value) {
                    return CupertinoActivityIndicator().paddingOnly(top: 200.h);
                  }

                  if (controller.matchingProfileModel.isEmpty) {
                    return Expanded(child: NoMatchesWidget());
                  }

                  return Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            // Slide from bottom to top with fade
                            return SlideTransition(
                              position:
                                  Tween<Offset>(
                                    begin: const Offset(
                                      0,
                                      1,
                                    ), // Start from bottom
                                    end:
                                        Offset.zero, // End at original position
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOutCubic,
                                    ),
                                  ),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                      child: ProfileCard(
                        key: ValueKey(controller.currentIndex.value),
                        matching:
                            controller.matchingProfileModel[controller
                                .currentIndex
                                .value],
                        controller: controller,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Separate ProfileCard widget for better performance
class ProfileCard extends StatelessWidget {
  final MatchingProfileModel matching;
  final MatchesController controller;

  const ProfileCard({
    super.key,
    required this.matching,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffC672A5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // Avatar Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset("assets/icon/svg/tri_info.svg"),
                  ),
                ),
                // Replace your avatar widget with this:
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // circular avatar
                  child: Image.network(
                    matching.profilePhoto ?? '', // network image URL
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ).paddingOnly(top: 30.h),
                GestureDetector(
                  onTap: () {
                    showTextBottomSheet(
                      context,
                      items: [
                        'Report for inappropriate/offensive behaviour',
                        'Spam , Selling something (including financial product)',
                        'Others',
                      ],
                      onTap: [
                        () async {
                          Navigator.pop(context);

                          showConfirmReportBottomSheet(context, () async {
                            Navigator.pop(context);
                            await controller.reportUser(
                              id: matching.id ?? '',
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
                              id: matching.id ?? '',
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
                    child: SvgPicture.asset("assets/icon/svg/tri_info.svg"),
                  ),
                ),
              ],
            ),

            // Name
            Text(
              matching.nickname ?? '',
              style: TextStyle(
                color: AppColors.black,
                fontStyle: FontStyle.italic,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xffFF0000),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xffC672A5), width: 2),
              ),
              child: Text(
                "SingPass",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Software Engineer | Coffee Enthusiast | Yoga lover',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xFFBC0072),
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 15),

            // Profile Details
            Column(
              children: [
                _buildProfileRow('Nationality', matching.location ?? ''),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildProfileDetail(
                        'Age',
                        '${matching.age ?? ''}',
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildProfileDetail(
                        'Gender',
                        matching.preferredGender ?? '',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildProfileDetail('Race', 'Chinese')),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildProfileDetail(
                        'Status',
                        matching.maritalStatus ?? '',
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30),

            // Bowls Row Dynamic
            LayoutBuilder(
              builder: (context, constraints) {
                double iconWidth = 15;
                int iconCount = (constraints.maxWidth / iconWidth).floor();

                return Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  children: List.generate(
                    iconCount,
                    (index) => SvgPicture.asset(
                      "assets/icon/svg/bowl.svg",
                      width: iconWidth,
                    ),
                  ),
                );
              },
            ),

            Center(
              child: Text(
                "Nitty - Gritty",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 16),

            // Two Column Icon Text
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIconText(
                        "assets/icon/svg/smoke.svg",
                        "Non - Smoker",
                      ),
                      _buildIconText(
                        "assets/icon/svg/ocasstional.svg",
                        "Occasional Drinker",
                      ),
                      _buildIconText("assets/icon/svg/pet.svg", "No Pets"),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIconText(
                        "assets/icon/svg/fre.svg",
                        "Frequent Clubber",
                      ),
                      _buildIconText("assets/icon/svg/serious.svg", "Serious"),
                      _buildIconText(
                        "assets/icon/svg/location1.svg",
                        "North - East",
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 14),

            Text(
              "Religion: Hinduism",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 20),

            // Voice Prompt Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xfff2dede),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "Voice Prompts :",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),

            SpeakablePrompt(text: "What do I think of first dates?"),

            SizedBox(height: 20),

            // Bio
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xfff2dede),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Bio :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      matching.bio ?? '',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Green Flags
            if (matching.greenFlags != null &&
                matching.greenFlags!.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Green Flags",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 15.sp,
                  ),
                ),
              ),

              SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: matching.greenFlags!
                          .map(
                            (flag) => _FlagChip(
                              label: flag,
                              backgroundColor: Colors.green,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
            ],

            SizedBox(height: 20),

            if (matching.redFlags != null && matching.redFlags!.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Red Flags",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15.sp,
                  ),
                ),
              ),

              SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 10,
                      children: matching.redFlags!
                          .map(
                            (flag) => _FlagChip(
                              label: flag,
                              backgroundColor: Colors.red,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
            ],

            Text(
              "Bowl Crush remaining : 6",
              style: TextStyle(
                color: Color(0xffEB5230),
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedIconButton(
                  imagePath: "assets/images/thumbs.png",
                  onTap: () {
                    controller.likeProfile(matching.id);
                  },
                ),
                AnimatedIconButton(
                  imagePath: "assets/images/match_logo.png",
                  onTap: () => controller.likeProfile(matching.id),
                ).paddingSymmetric(horizontal: 3.w),
                AnimatedIconButton(
                  imagePath: "assets/images/thumbs_down.png",
                  onTap: () => controller.disLikeProfile(matching.id),
                ),
              ],
            ),

            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}

class _FlagChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const _FlagChip({required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 10.sp),
      ),
    );
  }
}

Widget _buildProfileRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$label : ',
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
      ),
      Text(
        value,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
      ),
    ],
  );
}

Widget _buildProfileDetail(String label, String value) {
  return Row(
    children: [
      Text(
        '$label : ',
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
      ),
      Text(
        value,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
      ),
    ],
  );
}

Widget _buildIconText(String iconPath, String text, {bool underline = false}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(iconPath, width: 18, height: 18),
      SizedBox(width: 6),
      Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            decoration: underline
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    ],
  );
}
