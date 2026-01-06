import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';

class VoucherCard extends StatelessWidget {
  final String id;
  final String title;
  final String discount;
  final String badge;
  final String expiryText;
  final String buttonText;
  final Color badgeColor;
  final Color buttonBorderColor;
  final Color buttonTextColor;
  final Color expiryTextColor;
  final bool isExpired;

  const VoucherCard({
    super.key,
    required this.title,
    required this.id,
    required this.discount,
    required this.badge,
    required this.expiryText,
    this.buttonText = 'Redeem',
    this.badgeColor = const Color(0xFFAF0000),
    this.buttonBorderColor = const Color(0xffFB0000),
    this.buttonTextColor = Colors.red,
    this.expiryTextColor = const Color(0xff003366),
    this.isExpired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        boxShadow: [
          // Only bottom shadow
          BoxShadow(
            offset: Offset(0, 4.h), // pushes shadow downward
            blurRadius: 6.r,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          // Main card containerXX
          Container(
            height: 135.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[300]!, width: 1.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Middle row with discount and badge
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      // Voucher icon
                      SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: SvgPicture.asset("assets/icon/svg/voucher.svg"),
                      ),

                      SizedBox(width: 12.w),

                      // Title and discount text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            SizedBox(height: 2.h),

                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '$discount% OFF',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                SizedBox(width: 10.w),

                                // Badge
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 1.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isExpired ? Colors.grey : badgeColor,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    '$badge left',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
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

                // Divider line
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),

                SizedBox(height: 5.h),

                // Bottom row with expiry and redeem button
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      // Timer icon and expiry text
                      SvgPicture.asset(
                        "assets/icon/svg/timer.svg",
                        height: 13,
                        width: 13,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          'Used By $expiryText',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: isExpired ? Colors.red : expiryTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      SizedBox(width: 8.w),

                      // Redeem button
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REDEEM, arguments: {'id': id});
                        },
                        child: Container(
                          height: 30.h,
                          width: 92.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isExpired ? Colors.grey[300] : Colors.white,
                            border: Border.all(
                              color: isExpired
                                  ? Colors.grey
                                  : buttonBorderColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              isExpired ? 'Expired' : buttonText,
                              style: TextStyle(
                                color: isExpired
                                    ? Colors.grey
                                    : buttonTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Left semi-circle cutout
          Positioned(
            left: 0,
            top: 0,
            bottom: -25,
            child: Center(
              child: Container(
                height: 30.h,
                width: 15.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),

          // Right semi-circle cutout
          Positioned(
            right: 0,
            top: 0,
            bottom: -25,
            child: Center(
              child: Container(
                height: 30.h,
                width: 15.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),

          // Info icon
          Positioned(
            top: 10.h,
            right: 10.w,
            child: SvgPicture.asset("assets/icon/svg/info1.svg"),
          ),
        ],
      ),
    );
  }
}
