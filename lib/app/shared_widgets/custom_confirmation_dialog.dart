import 'package:convo_hearts/app/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_colors.dart';
import '../utils/utils.dart';
import 'custom_button.dart';
import 'my_text.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback yesOnTap;
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.yesOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.black, size: 18),
                onPressed: () {
                  Get.back(); // Closes the dialog
                },
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(title: title, weight: FontWeight.w600, size: 11.25.sp),
                .5.h.height,
                MyText(
                  title: subTitle,
                  weight: FontWeight.w500,
                  size: 9.25.sp,
                  clr: AppColors.hint,
                ),
                4.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 65,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: MyText(
                          title: 'Cancel'.tr,
                          weight: FontWeight.w500,
                          size: 12.sp,
                          clr: AppColors.inputfield,
                        ),
                      ),
                    ),
                    3.w.width,
                    GestureDetector(
                      onTap: yesOnTap,
                      child: Container(
                        width: 65,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: MyText(
                          title: 'Yes'.tr,
                          weight: FontWeight.w500,
                          size: 12.sp,
                          clr: AppColors.inputfield,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            5.h.height,
            // const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? btnText;
  final bool needOboCoinsText;
  final VoidCallback yesOnTap;

  const CustomDialog({
    super.key,
    this.title,
    this.btnText,
    this.needOboCoinsText = true,
    this.subTitle,
    required this.yesOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      backgroundColor: AppColors.trans,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white.withOpacity(0.3)),
                color: AppColors.lightBackgroundColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Utils.getIconPath('unlock'), scale: 4),
                  ),
                  // Close Button
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: IconButton(
                  //     icon: const Icon(
                  //       Icons.close,
                  //       color: AppColors.black,
                  //       size: 18,
                  //     ),
                  //     onPressed: () {
                  //       Get.back(); // Closes the dialog
                  //     },
                  //   ),
                  // ),
                  3.h.height,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        title: (title == null || title!.isEmpty)
                            ? 'Add 3 more social links'
                            : title,
                        weight: FontWeight.w700,
                        size: 16.sp,
                      ),
                      1.h.height,
                      MyText(
                        title: (subTitle == null || subTitle!.isEmpty)
                            ? 'Upgrade your plan to access for'
                            : subTitle,
                        weight: FontWeight.w400,
                        size: 10.sp,
                        clr: AppColors.white,
                      ),
                      1.h.height,
                      if (needOboCoinsText)
                        MyText(
                          title: '5 OBO coins',
                          weight: FontWeight.w700,
                          size: 10.sp,
                          clr: AppColors.white,
                        ),
                      2.h.height,
                      CustomButton(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        radius: 30,
                        text: btnText ?? 'Upgrade Now',
                        onPress: yesOnTap,
                        textColor: AppColors.black,
                        boxColor: AppColors.white,
                        isGradient: true,
                        gradient: AppColors.primaryGradient,
                      ),
                    ],
                  ),
                  1.h.height,
                  // const SizedBox(height: 15),
                ],
              ),
            ).paddingAll(8),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inputBorder.withOpacity(0.9),
                ),
                child: Icon(
                  CupertinoIcons.multiply,
                  color: AppColors.lightGolden,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialogNew extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? oboCoinsText;
  final String buttonText;
  final String? iconPath;
  final bool? isCancelButton;
  final void Function()? onClick;
  final bool? isButtonRow;

  const CustomDialogNew({
    super.key,
    this.title,
    this.subTitle,
    this.onClick,
    this.oboCoinsText,
    required this.buttonText,
    this.iconPath,
    this.isCancelButton,
    this.isButtonRow,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      backgroundColor: AppColors.trans,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white.withOpacity(0.3)),
                color: AppColors.lightBackgroundColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Utils.getIconPath(iconPath!), scale: 4),
                  ),
                  // Close Button
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: IconButton(
                  //     icon: const Icon(
                  //       Icons.close,
                  //       color: AppColors.black,
                  //       size: 18,
                  //     ),
                  //     onPressed: () {
                  //       Get.back(); // Closes the dialog
                  //     },
                  //   ),
                  // ),
                  3.h.height,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        title: (title == null || title!.isEmpty)
                            ? 'Add 3 more social links'
                            : title,
                        weight: FontWeight.w700,
                        size: 16.sp,
                      ),
                      1.h.height,
                      MyText(
                        title: (subTitle == null || subTitle!.isEmpty)
                            ? 'Upgrade your plan to access for'
                            : subTitle,
                        weight: FontWeight.w400,
                        size: 10.sp,
                        clr: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                      if (isButtonRow == false)
                        Column(
                          children: [
                            1.h.height,
                            MyText(
                              title:
                                  (oboCoinsText == null ||
                                      oboCoinsText!.isEmpty)
                                  ? ''
                                  : oboCoinsText,
                              weight: FontWeight.w700,
                              size: 10.sp,
                              clr: AppColors.white,
                            ),
                            2.h.height,
                            CustomButton(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              radius: 30,
                              text: (buttonText.isEmpty)
                                  ? 'Upgrade your plan to access for'
                                  : buttonText,
                              onPress:
                                  onClick ??
                                  () {
                                    Get.back();
                                  },
                              textColor: AppColors.black,
                              boxColor: AppColors.white,
                              isGradient: true,
                              gradient: AppColors.primaryGradient,
                            ),
                            if (isCancelButton == true)
                              Column(
                                children: [
                                  SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: MyText(
                                      title: 'Cancel',
                                      clr: AppColors.darkGolden,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      if (isButtonRow == true)
                        Column(
                          children: [
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: MyText(
                                    title: 'No, Keep',
                                    clr: AppColors.darkGolden,
                                  ).paddingOnly(left: 15),
                                ),
                                CustomButton(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  radius: 30,
                                  text: (buttonText.isEmpty)
                                      ? 'Upgrade your plan to access for'
                                      : buttonText,
                                  onPress:
                                      onClick ??
                                      () {
                                        Get.back();
                                      },
                                  textColor: AppColors.black,
                                  boxColor: AppColors.white,
                                  isGradient: true,
                                  gradient: AppColors.primaryGradient,
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                  1.h.height,
                  // const SizedBox(height: 15),
                ],
              ),
            ).paddingAll(1),
          ),
        ],
      ),
    );
  }
}
