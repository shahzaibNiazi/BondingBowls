import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle regular = const TextStyle();
  static TextStyle headingExtraLarge = TextStyle(
    fontSize: 26.sp,
    fontFamily: 'Poppins-800',
    color: AppColors.primary,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle primaryClrHeading = TextStyle(
    fontSize: 15.sp,
    fontFamily: 'Poppins-600',
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle heading = TextStyle(
    fontSize: 17.sp,
    fontFamily: 'Poppins-600',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle semiBold = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Poppins-600',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyText = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Poppins-400',
    color: AppColors.white,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle bodyTextBold = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins-500',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle mediumHeading = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Poppins-500',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle twentySemiBoldText = TextStyle(
    fontSize: 15.sp,
    fontFamily: 'Poppins-600',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle twentyNormalText = TextStyle(
    fontSize: 15.sp,
    fontFamily: 'Poppins-400',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle hintText = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins-400',
    color: AppColors.hint,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle normalText = const TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins-400',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle small = TextStyle(
    fontSize: 9.sp,
    fontFamily: 'Poppins-500',
    color: AppColors.white,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle dashboardHeading = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Poppins-700',
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
}
