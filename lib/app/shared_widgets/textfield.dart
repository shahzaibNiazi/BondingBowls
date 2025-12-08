import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_colors.dart';
import '../utils/utils.dart';

class CustomTextField extends StatefulWidget {
  final String? initial;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? suffixColor;
  final TextCapitalization? textCapitalization;
  final Color? backgroundColor;
  final VoidCallback? suffixOntap;
  final bool? isPrefixIcon;
  final bool? fromLogin;
  final bool? isObscure;
  final bool? padding;
  final Decoration? decoration;
  final bool? readOnly;
  final int? maxLines;
  final double? height;
  final bool isFilled;
  final Color? filledColor;
  final Color? hintColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;
  final String? Function(String?)? onSaved;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatter;
  const CustomTextField({
    super.key,
    this.maxLines,
    this.decoration,
    this.height,
    this.textCapitalization,
    this.filledColor,
    this.hintColor,
    this.isFilled = false,
    this.focusNode,
    this.isPrefixIcon = false,
    this.fromLogin = false,
    this.isObscure = false,
    this.padding = false,
    this.hint,
    this.textInputType,
    this.onSaved,
    this.controller,
    this.label,
    this.validation,
    this.onchange,
    this.prefixIcon,
    this.initial,
    this.readOnly,
    this.suffixIcon,
    this.suffixOntap,
    this.suffixColor,
    this.onTap,
    this.inputFormatter,
    this.backgroundColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatter,
      onTap: widget.onTap,
      initialValue: widget.initial,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (val) {
        // if( widget.focusNode!=null) {
        //   widget.focusNode!.unfocus();
        // }
      },
      readOnly: widget.readOnly ?? false,
      keyboardType: widget.textInputType ?? TextInputType.text,
      validator: widget.validation,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      onChanged: widget.onchange,
      obscureText: widget.isObscure ?? false,
      controller: widget.controller,
      cursorColor: AppColors.black,
      maxLines: widget.maxLines ?? 1,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: widget.suffixOntap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    Utils.getSvgPath(widget.suffixIcon ?? ''),
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      widget.suffixColor ?? Colors.transparent,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
        prefixIcon: widget.isPrefixIcon == true
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Utils.getSvgPath(widget.prefixIcon ?? ''),
                    width: 30.w,
                    height: 30.h,
                  ),
                ],
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),

        labelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: widget.hint,
        filled: widget.isFilled,
        fillColor: widget.filledColor,
        errorStyle: TextStyle(fontSize: 13.sp),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.inputBorder),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.inputBorder),
        ),
        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600],
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.pinkColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.pinkColor),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final bool isObscure;
  final String? prefixIcon;
  final bool? isPrefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;
  final String? Function(String?)? onSave;

  const PasswordTextField({
    super.key,
    this.suffixIcon,
    this.isObscure = false,
    this.hint,
    this.controller,
    this.isPrefixIcon,
    this.prefixIcon,
    this.onSave,
    this.label,
    this.validation,
    this.onchange,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validation,
      onChanged: widget.onchange,
      controller: widget.controller,
      obscureText: widget.isObscure,
      onSaved: widget.onSave,
      cursorColor: AppColors.black,
      style: TextStyle(color: AppColors.black, fontSize: 15.sp),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: AppColors.black),
        hintText: widget.hint,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.isPrefixIcon == true
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Utils.getSvgPath(widget.prefixIcon ?? ''),
                    width: 30.w,
                    height: 30.h,
                  ),
                ],
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.pinkColor),
        ),
        errorStyle: TextStyle(fontSize: 13.sp),

        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600],
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.pinkColor),
        ),
      ),
    );
  }
}

class SearchTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final VoidCallback? suffixOntap;
  final Widget? pre;
  final bool isEnabled;
  final String? suffixIcon;
  final String? prefixIcon;
  final Color? fillColor;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;

  const SearchTextField({
    super.key,
    this.isEnabled = true,
    this.fillColor,
    this.prefixIcon,
    this.suffixOntap,
    this.suffixIcon,
    this.hint,
    required this.controller,
    this.label,
    this.validation,
    this.onchange,
    this.pre,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      cursorColor: AppColors.lightGrey,
      validator: widget.validation,
      onChanged: widget.onchange,
      controller: widget.controller,

      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: widget.suffixOntap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    Utils.getSvgPath(widget.suffixIcon ?? ''),
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      AppColors.white.withValues(alpha: 0.4),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        labelText: widget.label,
        fillColor: widget.fillColor,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 50,
          minHeight: 50,
        ),
        filled: true,
        labelStyle: TextStyle(
          fontFamily: "Satoshi",
          color: AppColors.grey,
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: widget.hint,
        // focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: AppColors.button)),
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: AppColors.lightGolden),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: AppColors.lightGolden),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: AppColors.lightGolden),
        ),
      ),
    );
  }
}

class MessageTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final Icon? pre;
  final Widget? suffixIcon;
  final bool? fromLogin;
  final Color? labelClr;
  final bool? read;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;
  final String? Function(String?)? onSaved;
  final int? minLines;
  final int? maxLines;
  final double? borderRadius;
  final FocusNode? focusNode;
  const MessageTextField({
    super.key,
    this.fromLogin = false,
    this.read = false,
    this.inputFormatter,
    this.hint,
    this.labelClr,
    this.textInputType,
    this.onSaved,
    this.controller,
    this.label,
    this.validation,
    this.onchange,
    this.pre,
    this.minLines,
    this.maxLines,
    this.borderRadius,
    this.suffixIcon,
    this.focusNode,
  });

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      readOnly: widget.read ?? false,
      keyboardType: widget.textInputType ?? TextInputType.text,
      validator: widget.validation,
      onSaved: widget.onSaved,
      onChanged: widget.onchange,
      controller: widget.controller,
      cursorColor: AppColors.hint,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      style: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.hint,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ),
      inputFormatters: widget.inputFormatter ?? [],
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.pre,
        suffixIcon: widget.suffixIcon,
        labelStyle: TextStyle(
          fontFamily: "Satoshi",
          color: widget.labelClr ?? AppColors.grey,
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: widget.hint,
        filled: true,
        fillColor: AppColors.inputfield,
        errorBorder: UnderlineInputBorder(
          borderRadius: widget.fromLogin == true
              ? BorderRadius.only(
                  topRight: Radius.circular(widget.borderRadius ?? 8),
                  bottomRight: Radius.circular(widget.borderRadius ?? 8),
                )
              : BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputfield),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: widget.fromLogin == true
              ? BorderRadius.only(
                  topRight: Radius.circular(widget.borderRadius ?? 8),
                  bottomRight: Radius.circular(widget.borderRadius ?? 8),
                )
              : BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputfield),
        ),
        hintStyle: TextStyle(
          fontFamily: "Satoshi",
          fontSize: 9.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.lightGrey,
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: widget.fromLogin == true
              ? BorderRadius.only(
                  topRight: Radius.circular(widget.borderRadius ?? 8),
                  bottomRight: Radius.circular(widget.borderRadius ?? 8),
                )
              : BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputfield),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: widget.fromLogin == true
              ? BorderRadius.only(
                  topRight: Radius.circular(widget.borderRadius ?? 8),
                  bottomRight: Radius.circular(widget.borderRadius ?? 8),
                )
              : BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputfield),
        ),
      ),
    );
  }
}

class MessageInputTextField extends StatefulWidget {
  final String? initial;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? suffixColor;
  final TextCapitalization? textCapitalization;
  final bool isLoading;

  final Color? backgroundColor;
  final VoidCallback? suffixOntap;
  final bool? isPrefixIcon;
  final bool? fromLogin;
  final bool? isObscure;
  final bool? padding;
  final Decoration? decoration;
  final bool? readOnly;
  final int? maxLines;
  final double? height;
  final bool isFilled;
  final Color? filledColor;
  final Color? hintColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;
  final String? Function(String?)? onSaved;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatter;
  const MessageInputTextField({
    super.key,
    this.maxLines,
    this.decoration,
    this.height,
    this.isLoading = false,
    this.textCapitalization,
    this.filledColor,
    this.hintColor,
    this.isFilled = false,
    this.focusNode,
    this.isPrefixIcon = false,
    this.fromLogin = false,
    this.isObscure = false,
    this.padding = false,
    this.hint,
    this.textInputType,
    this.onSaved,
    this.controller,
    this.label,
    this.validation,
    this.onchange,
    this.prefixIcon,
    this.initial,
    this.readOnly,
    this.suffixIcon,
    this.suffixOntap,
    this.suffixColor,
    this.onTap,
    this.inputFormatter,
    this.backgroundColor,
  });

  @override
  State<MessageInputTextField> createState() => _MessageInputTextFieldState();
}

class _MessageInputTextFieldState extends State<MessageInputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatter,
      onTap: widget.onTap,
      initialValue: widget.initial,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (val) {
        // if( widget.focusNode!=null) {
        //   widget.focusNode!.unfocus();
        // }
      },
      readOnly: widget.readOnly ?? false,
      keyboardType: widget.textInputType ?? TextInputType.text,
      validator: widget.validation,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      onChanged: widget.onchange,
      obscureText: widget.isObscure ?? false,
      controller: widget.controller,
      cursorColor: AppColors.white,
      maxLines: widget.maxLines ?? 1,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Satoshi',
      ),
      decoration: InputDecoration(
        contentPadding: widget.padding == true
            ? EdgeInsets.symmetric(horizontal: 10, vertical: 5)
            : EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        labelText: widget.label,
        suffixIcon: widget.suffixIcon == null
            ? null
            : widget.isLoading
            ? CupertinoActivityIndicator()
            : GestureDetector(
                onTap: widget.suffixOntap,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.lightGolden,
                    ),
                    child: SvgPicture.asset(
                      Utils.getSvgPath(widget.suffixIcon ?? ''),
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        widget.suffixColor ?? Colors.transparent,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
        prefixIcon: widget.isPrefixIcon == true
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ), // Add horizontal padding
                child: SvgPicture.asset(
                  Utils.getSvgPath(widget.prefixIcon ?? ''),
                  width: 10.0,
                  height: 10.0,
                ),
              )
            : null,

        labelStyle: TextStyle(
          fontFamily: 'Satoshi',
          color: AppColors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: widget.hint,
        filled: widget.isFilled,
        fillColor: widget.filledColor,
        errorStyle: TextStyle(fontFamily: 'Satoshi', color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w400,
          color: widget.hintColor ?? AppColors.white.withValues(alpha: 0.4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
