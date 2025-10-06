import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget buildRedFlagChip(
  String language,
  void Function()? onTap,
  bool isLanguageSelected,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF0000)),
        color: isLanguageSelected ? Color(0xffFF0000) : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        language,
        style: TextStyle(
          color: isLanguageSelected ? Colors.white : Colors.black,
          fontSize: 14.sp,
        ),
      ),
    ).paddingOnly(right: 3, bottom: 3),
  );
}
