import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/system_chat_controller.dart';

class SystemChatView extends GetView<SystemChatController> {
  const SystemChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemChatController>(
      init: SystemChatController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white, // background color as per Figma
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70), // 👈 change height here
            child: AppBar(
              backgroundColor: const Color(0xFFFFF3E6),
              elevation: 0,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new, size: 26),
              ),
              centerTitle: true,
              title: Row(
                children: [
                  Image.asset('assets/images/system.png', scale: 1.3),
                  SizedBox(width: 50.w),
                  const Text(
                    "SysTaco",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Center(
                    child: Opacity(
                      opacity: 0.12,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/image_splash2.jpg',
                            scale: 1,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'BONDING BOWLS',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withValues(alpha: 0.15),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,

                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            final msg = controller.messages[index];
                            return Text(
                              '${msg["sender"]}: "${msg["text"]}"',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.black),
                        ),

                        Text(
                          'Yesterday',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingSymmetric(horizontal: 12),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.black),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 60),
                    SizedBox(height: 16),
                    Obx(
                      () => Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text(
                              controller.deals['title']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Column(
                              children: [
                                Text(
                                  "Enjoy Everything 20%",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                Text(
                                  "@ Macdonalds",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "Expires Until shop closes for today.\nMatch in cafeconnect to get the deals",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                // handle link tap
                              },
                              child: Text(
                                "Click here for more info!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff4F04FF),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "T&C applies",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                controller.deals['time']!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "SysTaco sends you good discounts, updates and stuff.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
