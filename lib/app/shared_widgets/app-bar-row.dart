import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import 'my_text.dart';

class AppBarRow extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool? showTitle;
  final bool? showBack;
  final Color boxColor;
  final Color iconColor;
  const AppBarRow({
    super.key,
    this.boxColor = AppColors.primary,
    this.iconColor = AppColors.white,
    required this.onTap,
    required this.title,
    this.showTitle = true,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: showBack == true,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: boxColor,
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: iconColor,
              ),
            ),
          ),
        ),
        Visibility(
          visible: showTitle == true,
          child: MyText(
            title: title,
            weight: FontWeight.bold,
            clr: AppColors.black,
            size: 12.sp,
          ),
        ),
        Container(),
      ],
    ).paddingOnly(top: 2.5.h);
  }
}
