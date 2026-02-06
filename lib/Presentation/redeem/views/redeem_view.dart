import 'dart:developer';

import 'package:convo_hearts/Presentation/redeem/views/slide_show.dart';
import 'package:convo_hearts/data/provider/network/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../controllers/redeem_controller.dart';

class RedeemView extends GetView<RedeemController> {
  const RedeemView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RedeemController(),
      builder: (controller) {
        log(
          '${ApiEndPoints.imageUrl}${controller.voucherDetailModel?.displayInfo?.images?.mainImage}',
        );
        return Scaffold(
          backgroundColor: Color(0xffFFEEDA),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                            ),
                          ),

                          Expanded(
                            child: Text(
                              controller
                                      .voucherDetailModel
                                      ?.displayInfo
                                      ?.outletDetails
                                      ?.name ??
                                  '',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: "Playfair",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: false,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back),
                            ),
                          ),
                        ],
                      ),

                      controller.isLoading.value
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: Get.height / 4),
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            )
                          : controller.voucherDetailModel != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '#01-2 Bukit batok cresent (638498)',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    decorationColor:
                                        Colors.blueAccent, // 👈 underline color

                                    color: Color(0xff1255FF),
                                  ),
                                ),

                                Divider(
                                  color: Color(
                                    0xffFB4B16,
                                  ).withValues(alpha: 0.5),
                                  thickness: 3,
                                ).paddingSymmetric(vertical: 12.h),

                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ), // Optional, for rounded corners
                                    child: Image.network(
                                      '${ApiEndPoints.imageUrl}${controller.voucherDetailModel?.displayInfo?.images?.mainImage}' ??
                                          '', // Replace with your actual URL
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                                size: 50,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),

                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Buy 1 get 1 Free!',
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Buy any coffee/latte and get one free drink on us!',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(height: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      (controller
                                                  .voucherDetailModel
                                                  ?.displayInfo
                                                  ?.conditionsList ??
                                              [])
                                          .map((condition) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 3.h,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '•',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.black
                                                          .withValues(
                                                            alpha: 0.7,
                                                          ),
                                                      height: 1.4,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  Expanded(
                                                    child: Text(
                                                      condition,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors.black
                                                            .withValues(
                                                              alpha: 0.7,
                                                            ),
                                                        height: 1.4,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                          .toList(),
                                ).paddingOnly(left: 6),

                                Divider(color: Colors.redAccent),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Terms and Conditions',
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      (controller
                                                  .voucherDetailModel
                                                  ?.displayInfo
                                                  ?.termsList ??
                                              [])
                                          .map(
                                            (term) => _buildBulletPoint(term),
                                          )
                                          .toList(),
                                ),

                                SizedBox(height: 16),

                                Obx(
                                  () => SlideShow(
                                    redeemed: controller.isRedeem.value,
                                    onRedeem: () {
                                      // Call API
                                      controller.redeemVoucher(
                                        controller.voucherDetailModel?.id ?? '',
                                        controller
                                                .voucherDetailModel
                                                ?.voucherCode ??
                                            '',
                                      ); // GetX example
                                    },
                                  ),
                                ),

                                SizedBox(height: 20.h),
                              ],
                            )
                          : SizedBox.shrink(),
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

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red, // Bullet color
              height: 1.5,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black.withValues(alpha: 0.7),
                height: 1.5, // Better line spacing for long text
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildBulletPoint(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black.withValues(alpha: 0.7),
            height: 1.5,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black.withValues(alpha: 0.7),
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}
