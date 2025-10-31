import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/utils/utils.dart';
import '../../profile_creation/controllers/profile_creation_controller.dart';

class AiAvatarPickImageView extends GetView<ProfileCreationController> {
  const AiAvatarPickImageView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCreationController>(
      init: ProfileCreationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Custom Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        // Back Button
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                            ), // Replace with SVG if needed
                          ),
                        ),

                        // Title
                        Expanded(
                          child: Text(
                            'AI avatar creation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // Spacer for alignment
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Instruction Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Feel free to create this at a later step',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Your image will be AI generated in a cartoon theme',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        height: 1.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),

                  // Main Content Area
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image Container
                        Container(
                          width: 400, // Make sure width == height
                          height: 400,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: ClipOval(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Avatar Image
                                Image.asset(
                                  Utils.getImagePath(
                                    'camer_avatar',
                                    format: 'jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),

                                // Subtle gradient overlay for better contrast
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.1),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Camera Button
                        InkWell(
                          onTap: () async {
                            await controller.captureImage();

                            // Get.to(() => ProfileCreation4());
                          },
                          child: Image.asset("assets/images/camera.jpg"),
                        ),

                        // Camera Label
                        Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
