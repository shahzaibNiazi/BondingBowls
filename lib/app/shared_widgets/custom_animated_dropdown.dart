import 'package:convo_hearts/app/extensions/extensions.dart';
import 'package:convo_hearts/app/shared_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import 'my_text.dart';

class CustomAnimatedDropdown extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? Function(String?)? onChange;
  final Color? backgroundColor;
  final TextEditingController searchController;
  final Color? textColor;
  final ScrollController scrollController;
  final Widget child;
  final bool isHeight;
  final bool isTileOpen;
  final List<Widget> children;
  final double? fontSize;
  const CustomAnimatedDropdown({
    super.key,
    required this.text,
    this.isHeight = false,
    required this.onChange,
    required this.searchController,
    required this.onTap,
    required this.scrollController,
    this.backgroundColor,
    this.textColor,
    required this.child,
    required this.isTileOpen,
    required this.children,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: Get.height / 15.6,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.inputBorder),
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor ?? AppColors.secondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: text,
                  weight: FontWeight.w600,
                  size: fontSize ?? 12.sp,
                  clr: textColor ?? AppColors.black,
                ),
                // Smooth icon transition
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return RotationTransition(
                          turns: AlwaysStoppedAnimation(
                            isTileOpen ? 0.25 : 0.0,
                          ),
                          child: child,
                        );
                      },
                  child: child,
                ),
              ],
            ).paddingSymmetric(horizontal: 4.w),
          ),
        ),
        .5.h.height,
        // Smooth expansion and collapse of the container
        AnimatedSize(
          duration: const Duration(microseconds: 2),
          curve: Curves
              .easeInOut, // Smoother curve for natural expansion and collapse
          child: Container(
            width: double.infinity,
            height: isHeight ? 150 : null,
            padding: isTileOpen ? const EdgeInsets.all(10.0) : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.lightGrey.withOpacity(.3),
            ),
            child: isTileOpen
                ? AnimatedOpacity(
                    opacity: isTileOpen ? 1.0 : 0.0, // Fades in the content
                    duration: const Duration(microseconds: 2),
                    child: Theme(
                      data: ThemeData(
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(3),
                          thumbColor: MaterialStateProperty.all(
                            AppColors.white.withOpacity(0.6),
                          ), // Set the scrollbar thumb color
                        ),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        thickness: 5,
                        controller: scrollController,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: searchController,
                                isPrefixIcon: true,
                                prefixIcon: 'search',
                                hint: 'Search here',
                                onchange: onChange,
                              ).paddingOnly(right: 12),
                              ListView(
                                controller: scrollController,
                                shrinkWrap: true,
                                children: children,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(), // Empty space when tile is closed
          ),
        ),
      ],
    );
  }
}
