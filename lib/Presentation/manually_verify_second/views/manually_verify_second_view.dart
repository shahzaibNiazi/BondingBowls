import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../app/shared_widgets/custom_button.dart';
import '../controllers/manually_verify_second_controller.dart';

class ManuallyVerifySecondView extends GetView<ManuallyVerifySecondController> {
  const ManuallyVerifySecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManuallyVerifySecondController>(
      init: ManuallyVerifySecondController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icon/svg/back_arrow.svg",
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            'Selfie Verification',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Instructions
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Text(
                          'Your Video will be deleted after Verification \nPlease remain in frame throughout the duration',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Circular Camera / Video Preview
                    Center(
                      child: Obx(() {
                        if (controller.capturedVideo.value != null &&
                            controller.videoPlayerController != null &&
                            controller
                                .videoPlayerController!
                                .value
                                .isInitialized) {
                          // Play recorded video in circle
                          return GestureDetector(
                            onTap: () {
                              if (controller
                                  .videoPlayerController!
                                  .value
                                  .isPlaying) {
                                controller.videoPlayerController!.pause();
                              } else {
                                controller.videoPlayerController!.play();
                              }
                            },
                            child: ClipOval(
                              child: SizedBox(
                                height: 320,
                                width: 320,
                                child: VideoPlayer(
                                  controller.videoPlayerController!,
                                ),
                              ),
                            ),
                          );
                        } else if (controller.cameraController != null &&
                            controller.cameraController!.value.isInitialized) {
                          // Show live camera preview in circle
                          return ClipOval(
                            child: SizedBox(
                              height: 320,
                              width: 320,
                              child: CameraPreview(
                                controller.cameraController!,
                              ),
                            ),
                          );
                        } else {
                          return ClipOval(
                            child: Container(
                              height: 320,
                              width: 320,
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.videocam,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                      }),
                    ),

                    SizedBox(height: 20.h),

                    Center(
                      child: Text(
                        'Please make sure your face can be seen clearly',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ).paddingOnly(bottom: 12.h),

                    // Info list
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoItem(
                          "• Make sure you’re in a brightly lited space",
                        ),
                        _buildInfoItem(
                          "• Make sure your expressions are neutral",
                        ),
                        _buildInfoItem(
                          "• Nobody else must be in the frame but you for throughout the duration",
                        ),
                      ],
                    ).paddingOnly(left: 30, bottom: 34.h),

                    // Buttons
                    Obx(() {
                      if (controller.capturedVideo.value != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              radius: 20,
                              width: 100.w,
                              text: 'Retry',
                              fontSize: 16.sp,
                              onPress: controller.clear,
                              textColor: Colors.white,
                              boxColor: Colors.red,
                            ),
                            CustomButton(
                              radius: 20,
                              width: 100.w,
                              text: 'Submit',
                              fontSize: 16.sp,
                              onPress: controller.uploadFile,
                              textColor: Colors.white,
                              boxColor: Color(0xffEB953A),
                            ),
                          ],
                        ).paddingOnly(bottom: 12.h, right: 24, left: 24);
                      } else {
                        return Center(
                          child: Obx(
                            () => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.isRecording.value) {
                                      controller.stopRecording();
                                    } else {
                                      controller.startRecording();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.isRecording.value
                                          ? Colors.red
                                          : Color(0xff1D73BC),
                                    ),
                                    child: Icon(
                                      controller.isRecording.value
                                          ? Icons.stop
                                          : Icons.videocam,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  controller.isRecording.value
                                      ? 'Recording...'
                                      : 'Video',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoItem(String text, {String? subtitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          if (subtitle != null)
            Padding(
              padding: EdgeInsets.only(left: 16, top: 2),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
