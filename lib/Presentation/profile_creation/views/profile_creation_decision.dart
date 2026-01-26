import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/config/global_var.dart';
import '../../../app/routes/app_pages.dart';
import '../../../src/feature/BottomBar/bottom_bar.dart';
import '../controllers/profile_creation_controller.dart';

class ProfileCreationDecisionView extends GetView<ProfileCreationController> {
  const ProfileCreationDecisionView({super.key});
  @override
  Widget build(BuildContext context) {
    log(Globals.authToken);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 20,
                  ),
                  child: Center(
                    child: Text(
                      "How would you like to use the Bonding Bowls App?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0087A7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Food Discounts Section
                _buildSectionTitle(
                  "I'm just looking for ",
                  "Food discounts 🤑",
                ),

                Text(
                  "(free for all users without any further verification)",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16.sp,
                    color: Color(0xff505050),
                  ),
                ),
                const SizedBox(height: 18),

                _buildFeatureList([
                  " Newsletter",
                  " Last minute food discounts from food vendors (notifications)",
                ]),

                const SizedBox(height: 23),

                _buildActionButton(
                  text: "Just food discounts!",
                  color: Colors.orange,
                  onPressed: () => Get.offAll(
                    () => BottomNavBar(
                      initialIndex: 0, // Profile tab index
                      showDiscountProfile:
                          (Globals.user != null &&
                              Globals.user!.profileSetup == true)
                          ? false
                          : true, // Flag to show discount profile
                    ),
                  ),
                  borderRadius: 20,
                ),

                const SizedBox(height: 72),

                // Dating/Friends Section
                _buildSectionTitle("I'm looking for ", "Dating/friends 🕺💃"),

                Text(
                  "(further verification needed after profile setup 🔐)",
                  style: TextStyle(color: Color(0xff505050), fontSize: 16.sp),
                ),
                const SizedBox(height: 14),

                _buildDescriptionText([
                  "Try our unique dating feature which eliminates all toxicity from the local dating scene.",
                  "We believe in matching people through their inner beauty, while ensuring every interaction is safe and secure.",
                  "Once you're in, you'll explore and connect through avatars, pseudonyms, and authentic conversations.",
                  "Ready to get started?",
                ]),

                const SizedBox(height: 60),

                _buildActionButton(
                  text: "Dating & friends!",
                  color: Color(0xffC672A5),
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE_CREATION);
                  },

                  borderRadius: 12,
                ),

                const SizedBox(height: 40),

                // Footer Note
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "P.S.",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text:
                              " Fear not, You can always change your mind later!",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String prefix, String highlight) {
    return RichText(
      text: TextSpan(
        text: prefix,
        style: TextStyle(
          color: Color(0xFF505050),
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        children: [
          TextSpan(
            text: highlight,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 26, 26),
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build feature lists
  Widget _buildFeatureList(List<String> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "• $feature",
                style: TextStyle(color: Color(0xff505050), fontSize: 16.sp),
              ),
            ),
          )
          .toList(),
    );
  }

  // Helper method to build description text blocks
  Widget _buildDescriptionText(List<String> descriptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: descriptions
          .map(
            (description) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                description,
                style: TextStyle(color: Color(0xff505050), fontSize: 16),
              ),
            ),
          )
          .toList(),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
    required double borderRadius,
  }) {
    return Center(
      child: SizedBox(
        width: 370,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: 2,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
