import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../app/shared_widgets/custom_button.dart';
import '../../../app/utils/utils.dart';
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
                          'Your Video will be deleted after Verification \n Please remain in frame throughout the duration',
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

                    // Camera/Document Area
                    Obx(() {
                      if (controller.capturedVideo.value != null &&
                          controller.videoPlayerController != null &&
                          controller
                              .videoPlayerController!
                              .value
                              .isInitialized) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                              aspectRatio: controller
                                  .videoPlayerController!
                                  .value
                                  .aspectRatio,
                              child: VideoPlayer(
                                controller.videoPlayerController!,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/video_men.png",
                              height: 320, // same height & width
                              width: 320,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    }),

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

                    if (controller.capturedVideo.value != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            radius: 20,
                            width: 100.w,
                            text: 'Retry',
                            fontSize: 16.sp,
                            onPress: () {
                              controller.clear();
                            },
                            textColor: Colors.white,
                            boxColor: Colors.red,
                          ),

                          if (controller.capturedVideo.value != null)
                            CustomButton(
                              radius: 20,
                              width: 100.w,
                              text: 'Submit',
                              fontSize: 16.sp,
                              onPress: () async {
                                await controller.uploadFile();
                              },
                              textColor: Colors.white,
                              boxColor: Color(0xffEB953A),
                            ),
                        ],
                      ).paddingOnly(bottom: 12.h, right: 24, left: 24),

                    if (controller.capturedVideo.value == null)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await controller.captureVideo();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff1D73BC),
                                ),
                                child: Image.asset(
                                  Utils.getImagePath('video'),
                                  scale: 5,
                                ),
                              ),
                            ),
                            Text(
                              'Video',
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

  Widget _buildSampleIdCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red[600]!, Colors.red[700]!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              'REPUBLIC OF SINGAPORE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // ID Card Content
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                // Photo placeholder
                Container(
                  width: 50,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 12),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIdRow('NAME:', '████████'),
                      _buildIdRow('CHINESE:', '██'),
                      _buildIdRow('DOB:', '██/██/████'),
                      _buildIdRow('RACE:', 'CHINESE'),
                      _buildIdRow('SEX:', 'F'),
                    ],
                  ),
                ),

                // Chip placeholder
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),

          // Footer
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text(
              'MALAYSIA',
              style: TextStyle(color: Colors.grey[500], fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
            ),
          ),
          Text(value, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
