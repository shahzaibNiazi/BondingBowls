import 'package:camera/camera.dart';
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
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Header
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icon/svg/back_arrow.svg",
                          ),
                          onPressed: () {
                            controller.capturedImage.value = null;
                            controller.isCameraInitialized.value = false;
                            if (controller.cameraController != null) {
                              controller.cameraController!.dispose();
                            }
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: Text(
                            'AI Avatar Creation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 48), // Balance for back button
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // Instructions
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Text(
                            'Feel free to create this at a later step',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade600,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Your image will be AI generated in a cartoon theme',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Circular Camera Preview with Face Detection Border
                    Center(
                      child: Obx(() {
                        if (controller.capturedImage.value != null) {
                          // Show captured image
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: SizedBox(
                                width: 320,
                                height: 320,
                                child: Image.file(
                                  controller.capturedImage.value!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else if (controller.isCameraInitialized.value) {
                          // Show camera with face detection overlay
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  height: 320,
                                  width: 320,
                                  child: CameraPreview(
                                    controller.cameraController!,
                                  ),
                                ),
                              ),
                              // Face detection overlay
                              _buildFaceDetectionOverlay(controller),
                            ],
                          );
                        } else {
                          // Show placeholder
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: SizedBox(
                                width: 320,
                                height: 320,
                                child: Image.asset(
                                  Utils.getImagePath(
                                    'camer_avatar',
                                    format: 'jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                    ),

                    SizedBox(height: 20.h),

                    // Dynamic face detection message
                    Center(
                      child: Obx(() {
                        if (controller.isCameraInitialized.value &&
                            controller.capturedImage.value == null) {
                          return Text(
                            controller.faceDetectionMessage.value,
                            style: TextStyle(
                              color: controller.isFaceValid.value
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          );
                        }
                        return SizedBox.shrink();
                      }),
                    ).paddingOnly(bottom: 12.h),

                    // Instructions for camera
                    Obx(() {
                      if (controller.capturedImage.value == null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoItem(
                              "• Make sure you're in a brightly lit space",
                            ),
                            _buildInfoItem(
                              "• Position your face in the center of the circle",
                            ),
                            _buildInfoItem(
                              "• Keep a neutral expression for best results",
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 30);
                      }
                      return SizedBox.shrink();
                    }),

                    SizedBox(height: 30.h),

                    // Capture Button
                    Center(
                      child: Obx(() {
                        if (controller.capturedImage.value != null) {
                          // Show Retry button
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.resetCapture();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.4),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Retake',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Show Camera button
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (!controller.isCameraInitialized.value) {
                                    // Step 1: Open camera preview
                                    await controller.initCamera();
                                  } else {
                                    // Step 2: Check if face is valid before capture
                                    if (controller.isFaceValid.value) {
                                      await controller.captureImage();
                                    } else {
                                      Get.snackbar(
                                        'Face Not Detected',
                                        'Please position your face properly before capturing',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.isCameraInitialized.value
                                        ? (controller.isFaceValid.value
                                              ? Color(0xff1D73BC)
                                              : Colors.grey)
                                        : Colors.grey.shade600,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            (controller
                                                        .isCameraInitialized
                                                        .value
                                                    ? (controller
                                                              .isFaceValid
                                                              .value
                                                          ? Color(0xff1D73BC)
                                                          : Colors.grey)
                                                    : Colors.grey.shade600)
                                                .withOpacity(0.4),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    controller.isCameraInitialized.value
                                        ? Icons.camera_alt
                                        : Icons.videocam,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                controller.isCameraInitialized.value
                                    ? 'Capture'
                                    : 'Camera',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFaceDetectionOverlay(ProfileCreationController controller) {
    return Obx(() {
      return Container(
        height: 320,
        width: 320,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: controller.isFaceValid.value ? Colors.green : Colors.red,
            width: 4,
          ),
        ),
        child: CustomPaint(
          painter: FaceOvalPainter(isValid: controller.isFaceValid.value),
        ),
      );
    });
  }

  Widget _buildInfoItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

// Custom painter for face oval guide - SAME AS ManuallyVerifySecondView
class FaceOvalPainter extends CustomPainter {
  final bool isValid;

  FaceOvalPainter({required this.isValid});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (isValid ? Colors.green : Colors.red).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final dashedPaint = Paint()
      ..color = isValid ? Colors.green : Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw inner oval guide for face
    final center = Offset(size.width / 2, size.height / 2);
    final ovalRect = Rect.fromCenter(
      center: center,
      width: size.width * 0.7,
      height: size.height * 0.85,
    );

    // Draw dashed oval
    _drawDashedOval(canvas, ovalRect, dashedPaint);
  }

  void _drawDashedOval(Canvas canvas, Rect rect, Paint paint) {
    const dashWidth = 10.0;
    const dashSpace = 5.0;
    double startAngle = 0.0;

    while (startAngle < 360) {
      canvas.drawArc(
        rect,
        _degreesToRadians(startAngle),
        _degreesToRadians(dashWidth),
        false,
        paint,
      );
      startAngle += dashWidth + dashSpace;
    }
  }

  double _degreesToRadians(double degrees) {
    return degrees * (3.141592653589793 / 180.0);
  }

  @override
  bool shouldRepaint(FaceOvalPainter oldDelegate) {
    return oldDelegate.isValid != isValid;
  }
}
