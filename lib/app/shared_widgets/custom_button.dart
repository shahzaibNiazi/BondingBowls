import 'package:dio_log/dio_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../utils/utils.dart';
import 'my_text.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onPress;
  final double? height;
  final double? width;
  final Color textColor;
  final bool isCupertinoIndicator;
  final Color boxColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final FontWeight? weight;
  final Gradient? gradient;
  final bool isGradient;
  const CustomButton({
    super.key,
    this.width,
    this.isGradient = false,
    this.height,
    this.fontWeight,
    this.gradient,
    this.isCupertinoIndicator = false,
    required this.text,
    required this.onPress,
    required this.textColor,
    required this.boxColor,
    this.fontSize,
    this.radius,
    this.weight,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      onLongPress: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => HttpLogListWidget()));
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? Get.height / 20.5,
        decoration: BoxDecoration(
          color: widget.isGradient ? null : widget.boxColor,
          gradient: widget.isGradient ? widget.gradient : null,
          borderRadius: BorderRadius.circular(widget.radius ?? 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MyText(
                title: widget.text,
                textAlign: TextAlign.center,
                weight: widget.weight ?? FontWeight.w700,
                size: widget.fontSize ?? 12.sp,
                clr: widget.textColor,
                isSatoshi: false,
              ),
            ),
            widget.isCupertinoIndicator
                ? const CupertinoActivityIndicator(
                    color: AppColors.white,
                    radius: 8,
                  ).paddingOnly(left: 12)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatefulWidget {
  final String text;
  final Function()? onPress;
  final double? height;
  final double? width;
  final String logo;
  final Color textColor;
  final bool isCupertinoIndicator;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final Color boxColor;
  final Gradient? gradient;
  final bool isGradient;
  final FontWeight? weight;
  final double? scale;
  const SocialButton({
    super.key,
    this.width,
    this.gradient,
    required this.boxColor,
    this.isGradient = false,
    required this.logo,
    this.height,
    this.fontWeight,
    this.isCupertinoIndicator = false,
    required this.text,
    this.scale,
    required this.onPress,
    required this.textColor,
    this.fontSize,
    this.radius,
    this.weight,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      onLongPress: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => HttpLogListWidget()));
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? Get.height / 14.5,
        decoration: BoxDecoration(
          color: widget.isGradient ? null : widget.boxColor,
          gradient: widget.isGradient ? widget.gradient : null,
          border: Border.all(color: AppColors.inputBorder),
          borderRadius: BorderRadius.circular(widget.radius ?? 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Utils.getIconPath(widget.logo),
              scale: widget.scale,
            ).paddingOnly(right: 12),
            Center(
              child: MyText(
                title: widget.text,
                textAlign: TextAlign.center,
                weight: widget.weight ?? FontWeight.w700,
                size: widget.fontSize ?? 12.sp,
                clr: AppColors.black,
              ),
            ),
            widget.isCupertinoIndicator
                ? const CupertinoActivityIndicator(
                    color: AppColors.white,
                    radius: 8,
                  ).paddingOnly(left: 12)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class CustomButtonNew extends StatefulWidget {
  final String text;
  final Function()? onPress;
  final double? height;
  final double? width;
  final Color textColor;
  final bool isCupertinoIndicator;
  final Color boxColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final FontWeight? weight;
  final Gradient? gradient;
  final bool isGradient;
  const CustomButtonNew({
    super.key,
    this.width,
    this.isGradient = false,
    this.height,
    this.fontWeight,
    this.gradient,
    this.isCupertinoIndicator = false,
    required this.text,
    required this.onPress,
    required this.textColor,
    required this.boxColor,
    this.fontSize,
    this.radius,
    this.weight,
  });

  @override
  State<CustomButtonNew> createState() => _CustomButtonNewState();
}

class _CustomButtonNewState extends State<CustomButtonNew> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      onLongPress: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => HttpLogListWidget()));
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? Get.height / 14.5,
        decoration: BoxDecoration(
          color: widget.isGradient ? null : widget.boxColor,
          gradient: widget.isGradient ? widget.gradient : null,
          borderRadius: BorderRadius.circular(widget.radius ?? 12),
          border: Border.all(color: AppColors.grey6B),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MyText(
                title: widget.text,
                textAlign: TextAlign.center,
                weight: widget.weight ?? FontWeight.w700,
                size: widget.fontSize ?? 12.sp,
                clr: widget.textColor,
                isSatoshi: false,
              ),
            ),
            widget.isCupertinoIndicator
                ? const CupertinoActivityIndicator(
                    color: AppColors.white,
                    radius: 8,
                  ).paddingOnly(left: 12)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
