import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import 'my_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final FontWeight? weight;
  final double? fontSize;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.weight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyText(
        size: fontSize ?? 12.sp,
        title: text,
        clr: textColor ?? AppColors.black,
        line: 3,
        overFLow: TextOverflow.ellipsis,
        weight: weight ?? FontWeight.w500,
      ).paddingOnly(bottom: 1.h),
    );
  }
}
