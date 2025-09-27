import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import 'my_text.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  // final bool? trailing;
  final double? leadingWidth;
  final bool centerTitle;
  final Color? color;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? iconColor;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onLeadingPressed;

  const AppBarCustom({
    super.key,
    this.title,
    this.bottom,
    this.color,
    this.iconColor,
    this.leading,
    this.actions,
    this.onLeadingPressed,
    this.leadingWidth,
    this.centerTitle = false,
    //  this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,

      elevation: 0.0,
      // bottom: PreferredSize(preferredSize: preferredSize, child: Container()),
      backgroundColor: AppColors.black.withOpacity(0.9),
      surfaceTintColor: AppColors.black.withOpacity(0.9),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent,
      //   statusBarIconBrightness: Brightness.dark,
      // ),
      title: title == null
          ? null
          : MyText(
              title: title ?? '',
              weight: FontWeight.w600,
              size: 13.5.sp,
              isSatoshi: true,
              clr: color ?? AppColors.white,
            ),
      // Text(
      //     title!,
      //     style: AppTextStyles.heading,
      //   ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth ?? 60,
      leading: onLeadingPressed == null
          ? leading
          : IconButton(
              color: AppColors.secondary,
              onPressed: onLeadingPressed, // Call the callback function here
              icon: Icon(
                Icons.arrow_back,
                color: iconColor ?? AppColors.darkGolden,
                size: 12.sp,
              ),
            ).paddingOnly(left: 6),

      actions: actions,
      // actions:trailing==null?null: [
      //   IconButton(
      //     color: AppColors.white,
      //     onPressed: () {
      //       Get.toNamed(Routes.NOTIFICATIONS);
      //     },
      //     icon: Container(
      //         padding: EdgeInsets.all(5),
      //         decoration: BoxDecoration(
      //             color: AppColors.white,
      //             shape: BoxShape.circle,
      //             boxShadow: [
      //               BoxShadow(
      //                   color: AppColors.black
      //                       .withOpacity(0.15),
      //                   blurRadius: 32,
      //                   spreadRadius: 0,
      //                   offset: const Offset(6, 5))
      //             ]),
      //         child: Image.asset(Utils.getIconPath('Bell'),scale: 4.0,)),
      //   )
      // ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
