import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import 'my_text.dart';

class CustomLogoutDialog extends StatelessWidget {
  final String title;
  final String content;
  final String yesButtonText;
  final String noButtonText;
  final VoidCallback onYesTap;
  final VoidCallback onNoTap;

  const CustomLogoutDialog({
    super.key,
    required this.title,
    required this.content,
    required this.yesButtonText,
    required this.noButtonText,
    required this.onYesTap,
    required this.onNoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(
              title: title,
              size: 18.sp,
              weight: FontWeight.w600,
              clr: AppColors.black,
            ).paddingOnly(bottom: 8),
            MyText(
              title: content,
              size: 15.sp,
              weight: FontWeight.w400,
              textAlign: TextAlign.center,
              clr: AppColors.black.withOpacity(0.8),
            ).paddingOnly(bottom: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onNoTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.inputfield,
                      foregroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: MyText(
                      title: noButtonText,
                      size: 16.sp,
                      weight: FontWeight.w500,
                      clr: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onYesTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: MyText(
                      title: yesButtonText,
                      size: 16.sp,
                      weight: FontWeight.w500,
                      clr: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
