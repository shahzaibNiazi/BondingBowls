import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../utils/utils.dart';
import 'my_text.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final String title;
  final String subTitle;
  final String? img;
  final bool? back;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const AuthBackground({
    super.key,
    required this.child,
    this.img,
    this.onTap,
    this.back = false,
    required this.title,
    required this.subTitle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage(Utils.getImagePath(img.toString())),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: padding ?? EdgeInsets.only(top: 24.h),
            child: child,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (back == true)
                GestureDetector(
                  onTap:
                      onTap ??
                      () {
                        Get.back();
                      },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 12.sp,
                    ),
                  ),
                ).paddingOnly(top: 0, bottom: 1.h),
              SizedBox(
                width: 60.w,
                child: MyText(
                  title: title,
                  weight: FontWeight.w500,
                  size: 22.sp,
                  clr: AppColors.white,
                  isSatoshi: true,
                ),
              ),
              SizedBox(
                width: 60.w,
                child: MyText(
                  title: subTitle,
                  weight: FontWeight.w500,
                  size: 11.25.sp,
                  clr: AppColors.white,
                  isSatoshi: true,
                ),
              ),
            ],
          ),
        ],
      ).paddingOnly(left: 24, top: back == true ? 4.h : 8.h),
    );
  }
}

// class AuthBackground extends StatelessWidget {
//   final Widget child;
//   final String title;
//   final String subTitle;
//   final String? img;
//   final bool? back;
//   final void Function()? onTap;

//   const AuthBackground(
//       {super.key,
//       required this.child,
//       this.img,
//       this.back = false,
//       required this.title,
//       required this.subTitle,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: Get.height,
//       decoration: BoxDecoration(
//           color: AppColors.white,
//           image: DecorationImage(
//               image: AssetImage(Utils.getImagePath(img.toString())),
//               fit: BoxFit.fill)),
//       child: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (back == true)
//                 GestureDetector(
//                   onTap: onTap ??
//                       () {
//                         Get.back();
//                       },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     decoration: const BoxDecoration(
//                       color: AppColors.secondary,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.arrow_back,
//                       color: AppColors.white,
//                       size: 18,
//                     ),
//                   ),
//                 ).paddingOnly(top: 0),
//               SizedBox(
//                 width: 60.w,
//                 child: MyText(
//                   title: title,
//                   weight: FontWeight.w500,
//                   size: 22.sp,
//                   clr: AppColors.white,
//                   isUrbanist: true,
//                 ),
//               ),
//               SizedBox(
//                 width: 60.w,
//                 child: MyText(
//                   title: subTitle,
//                   weight: FontWeight.w500,
//                   size: 11.25.sp,
//                   clr: AppColors.white,
//                   isUrbanist: true,
//                 ),
//               ),
//             ],
//           ),
//           child
//         ],
//       ).paddingOnly(left: 24, top: back == true ? 4.h : 8.h),
//     );
//   }
// }
