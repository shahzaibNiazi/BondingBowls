import 'package:convo_hearts/app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_colors.dart';
import 'my_text.dart';

class CustomDropdown extends StatelessWidget {
  final String? text;
  final FontWeight? textWeight;
  final double? textSize;
  final bool isDropDown;
  final Widget? parent;
  final String? time;
  final IconData? icon;
  final double? height;
  final Offset? offset;
  final Color? backgroundColor;
  final Color? expensionColor;
  final Color? textColor;
  final bool showBorder;
  final VoidCallback? onToggleDropdown;
  final String? withIcon;
  final List<Widget>? children;
  final double? fontSize;
  final Widget? child;
  final String? selectedItem;
  final VoidCallback? onTap;
  final GlobalKey? dropdownKey;
  final controller;
  final EdgeInsetsGeometry? padding;

  const CustomDropdown({
    super.key,
    this.text,
    this.offset,
    this.isDropDown = false,
    // required this.onTap,
    this.backgroundColor,
    this.dropdownKey,
    this.onToggleDropdown,
    this.textColor,
    // required this.isTileOpen,
    this.children,
    this.fontSize,
    this.controller,
    this.expensionColor,
    this.withIcon,
    this.showBorder = true,
    this.child,
    this.selectedItem,
    this.parent,
    this.time,
    this.onTap,
    this.padding,
    this.icon,
    this.height,
    this.textWeight,
    this.textSize,
  });
  // Create an instance of the controller

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (onToggleDropdown != null) {
              onToggleDropdown!();
            }
          },
          child: Container(
            height: height ?? Get.height / 15.6,
            width: double.infinity,
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: showBorder
                  ? Border.all(color: AppColors.inputBorder, width: 1)
                  : null,
              color: backgroundColor ?? AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: offset ?? const Offset(0, 0),
                  child:
                      parent ??
                      MyText(
                        weight: textWeight ?? FontWeight.w500,
                        size: textSize ?? 12.sp,
                        clr: textColor,
                        title: selectedItem ?? text,
                      ).paddingOnly(left: 4),
                ),
                if (time != null)
                  Container(
                    height: 3.h,
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: MyText(
                        title: time,
                        weight: FontWeight.w500,
                        size: 7.sp,
                        isSatoshi: true,
                        clr: AppColors.white,
                      ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      title: withIcon ?? '',
                      weight: FontWeight.w500,
                      size: 12.sp,
                      clr: AppColors.hint,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return RotationTransition(
                              turns: AlwaysStoppedAnimation(
                                isDropDown
                                    ? icon != null
                                          ? 0.50
                                          : 0.25
                                    : 0.0,
                              ),
                              child: child,
                            );
                          },
                      child: Icon(
                        icon ?? Icons.keyboard_arrow_right,
                        color: textColor,
                      ).paddingOnly(right: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        .5.h.height,
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Container(
            width: double.infinity,
            padding: isDropDown ? const EdgeInsets.all(2.0) : EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(
                color: isDropDown ? AppColors.inputBorder : AppColors.trans,
              ),
              borderRadius: BorderRadius.circular(8),
              color: expensionColor ?? AppColors.grey.withOpacity(0.05),
            ),
            child: isDropDown
                ? AnimatedOpacity(
                    opacity: isDropDown ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: SingleChildScrollView(
                      child:
                          child ??
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: children ?? [],
                          ),
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}

class CustomAnimatedStep extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? expensionColor;
  final Color? textColor;
  final Color? iconClr;
  final bool isTileOpen;
  final List<Widget> children;
  final double? fontSize;

  const CustomAnimatedStep({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    required this.isTileOpen,
    required this.children,
    this.fontSize,
    this.expensionColor,
    this.iconClr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: Get.height / 22,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: isTileOpen
                  ? const BorderRadius.vertical(top: Radius.circular(10))
                  : BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey.withOpacity(0.20)),
              color: backgroundColor ?? AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(title: text),
                // Smooth icon transition
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return RotationTransition(
                          turns: AlwaysStoppedAnimation(
                            isTileOpen ? 0.50 : 0.0,
                          ),
                          child: child,
                        );
                      },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: iconClr ?? AppColors.black,
                  ),
                  // child: Image.asset(
                  //   Utils.getIconPath(
                  //     isTileOpen
                  //       ? 'up'
                  //     :
                  //       'down'),
                  //   key: ValueKey<bool>(isTileOpen),
                  //   scale: 4.0,
                  //   color: AppColors.black,
                  // ),
                ),
              ],
            ).paddingSymmetric(horizontal: 4.w),
          ),
        ),
        // Smooth expansion and collapse of the container
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves
              .easeInOut, // Smoother curve for natural expansion and collapse
          child: Container(
            width: double.infinity,
            padding: isTileOpen ? const EdgeInsets.all(10.0) : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              color: expensionColor ?? AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.15),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: isTileOpen
                ? AnimatedOpacity(
                    opacity: isTileOpen ? 1.0 : 0.0, // Fades in the content
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  )
                : const SizedBox(), // Empty space when tile is closed
          ),
        ),
      ],
    );
  }
}
