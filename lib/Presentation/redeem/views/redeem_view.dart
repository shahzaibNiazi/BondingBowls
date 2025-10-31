import 'package:flutter/cupertino.dart';
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

                      Text(
                        'McDonalds',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontFamily: "Playfair",
                          fontWeight: FontWeight.w700,
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

                  Text(
                    '#01-2 Bukit batok cresent (638498)',
                    style: TextStyle(
                      fontSize: 18.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.blueAccent, // 👈 underline color

                      color: Color(0xff1255FF),
                    ),
                  ),

                  Divider(
                    color: Color(0xffFB4B16).withValues(alpha: 0.5),
                    thickness: 3,
                  ).paddingSymmetric(vertical: 12.h),

                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/food.png',
                        ), // Replace with actual image asset
                        fit: BoxFit.cover,
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
                    children: [
                      Text(
                        '• Applicable to all McCafé drinks',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withValues(alpha: 0.7),
                        ),
                      ),
                      Text(
                        '• Not claimable at VivoCity, Jewel & SunMall Outlets',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withValues(alpha: 0.7),
                        ),
                      ),

                      Text(
                        '• Only Available from 8am - 11am',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withValues(alpha: 0.7),
                        ),
                      ),
                      Text(
                        '• First 50 Users per outlet',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withValues(alpha: 0.7),
                        ),
                      ),
                      Text(
                        '• Available for Dine - In or Takeaway',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 12),

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
                    children: [
                      _buildBulletPoint(
                        'Bonding Bowls and participating outlets may at any time in its sole and absolute discretion withdraw, amend and/or alter any applicable terms and conditions of the voucher, deals or promotions, exclude, void, discontinue or disqualify you from any voucher, deal or promotion without prior notice.',
                      ),
                      _buildBulletPoint(
                        'Participating store can choose to void voucher if user did not present screen to cashier/staff before swiping to claim on the voucher.',
                      ),
                      _buildBulletPoint(
                        'Bonding Bowls and participating outlet reserve the right to amend, update, or modify these Terms of Use at any time, at our sole discretion.',
                      ),
                      _buildBulletPoint(
                        ' Only one promotion may be applied per order. Voucher codes cannot be used in conjunction with other discounts.',
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Color(0xff000000).withValues(alpha: 0.5),
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(color: Color(0xffFB4B16)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffE7E7E7),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/bowls_remove.png',
                            scale: 15,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.forward,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                        Text(
                          'ONLY SLIDE WHEN PRESENTING TO CASHIER!',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
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
