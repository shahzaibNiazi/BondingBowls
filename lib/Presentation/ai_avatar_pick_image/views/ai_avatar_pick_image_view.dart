import 'dart:developer';

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
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.capturedImage.value = null;
                            controller.isCameraInitialized.value = false;
                            if (controller.cameraController != null) {
                              controller.cameraController!.dispose();
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                            ),
                          ),
                        ),
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
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          'Feel free to create this at a later step',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey.shade600,
                            height: 1.4,
                          ),
                        ),
                        Text(
                          'Your image will be AI generated in a cartoon theme',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),

                  // Circle camera area
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        // Obx(() {
                        // if (!controller.isCameraInitialized.value) {
                        //   return
                        Container(
                          width: 300,
                          height: 300,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            Utils.getImagePath('camer_avatar', format: 'jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        //   }
                        //   return Container(
                        //     width: 400,
                        //     height: 400,
                        //     decoration: const BoxDecoration(
                        //       shape: BoxShape.circle,
                        //     ),
                        //     clipBehavior: Clip.antiAlias,
                        //     child: ClipOval(
                        //       child: CameraPreview(
                        //         controller.cameraController!,
                        //       ),
                        //     ),
                        //   );
                        // }),

                        // Capture Button
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                controller.pickImage1();
                                // if (!controller.isCameraInitialized.value) {
                                //   // Step 1: Open camera preview
                                //   await controller.initCamera();
                                // } else {
                                //   // Step 2: Capture photo
                                //   await controller.captureImage();
                                // }
                              },
                              child: Image.asset(
                                "assets/images/camera.jpg",
                                width: 100,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () async {
                                final file = await controller.generateImage1(
                                  "Anime portrait of this person, highly detailed, vibrant colors",
                                );

                                if (file != null) {
                                  controller.outputImage = file
                                      .path; // display with Image.file(_outputImage)
                                  log(controller.outputImage.toString());
                                  controller.update();
                                }
                              },
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
