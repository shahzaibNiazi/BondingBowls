import 'package:convo_hearts/app/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/utils/utils.dart';
import '../controllers/manually_verify_controller.dart';

class ManuallyVerifyView extends GetView<ManuallyVerifyController> {
  const ManuallyVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManuallyVerifyController>(
      init: ManuallyVerifyController(),
      builder: (controller) {
        return Scaffold(
          body: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),

                          Text(
                            'Document Capture',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Visibility(
                            visible: false,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                "assets/icon/svg/back_arrow.svg",
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      // Instructions
                      Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                          children: [
                            Text(
                              'Only your details written below will be recorded down,',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'all documents and pictures will be deleted after verification.',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 12, 12, 12),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      // Information Lists
                      Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '(not shown to others)',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(height: 8),
                            _buildInfoItem('• Full Name'),
                            _buildInfoItem(
                              '• IC number',
                              subtitle:
                                  '(Please cover all the numbers except only last 3 digits)',
                            ),
                            // SizedBox(height: 16),
                            Text(
                              '(shown to others)',
                              style: TextStyle(
                                color: Colors.red[400],
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 8),
                            _buildInfoItem('• Age'),
                            _buildInfoItem('• Race'),
                            _buildInfoItem('• Gender'),
                            _buildInfoItem('• Nationality'),
                          ],
                        ),
                      ),

                      // Camera/Document Area
                      controller.capturedImage.value != null
                          ? Obx(
                              () => Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    controller.capturedImage.value!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/nic.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      SizedBox(height: 12.h),

                      _buildInfoItem(
                        "• Please centre your NRIC in the centre of the photo as shown in the example",
                      ),

                      _buildInfoItem(
                        "• Make sure the image is clear and easily readable for easier verification",
                      ),
                      SizedBox(height: 12.h),
                      if (controller.capturedImage.value != null)
                        CustomButton(
                          text: 'Retry',
                          fontSize: 16.sp,
                          onPress: () {
                            controller.clear();
                          },
                          textColor: Colors.white,
                          boxColor: Colors.red,
                        ).paddingOnly(bottom: 12.h),
                      if (controller.capturedImage.value != null)
                        CustomButton(
                          text: 'Submit and proceed to face verification',
                          fontSize: 16.sp,
                          onPress: () async {
                            await controller.uploadFile();
                          },
                          textColor: Colors.white,
                          boxColor: Color(0xffEB953A),
                        ),

                      // Action Buttons
                      if (controller.capturedImage.value == null)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await controller.captureImage();
                                },
                                child: Image.asset(
                                  Utils.getImagePath('camera'),
                                  scale: 3.5,
                                ),
                              ),
                              Text(
                                'Camera',
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
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null)
            Padding(
              padding: EdgeInsets.only(left: 16, top: 2),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
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
              style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
