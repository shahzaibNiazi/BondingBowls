import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_colors.dart';
import '../utils/utils.dart';

class InputTextField extends StatefulWidget {
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
  const InputTextField({
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
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
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
            : GestureDetector(
                onTap: widget.suffixOntap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    Utils.getSvgPath(widget.suffixIcon ?? ''),
                    fit: BoxFit.scaleDown,
                    color: widget.suffixColor,
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
          borderSide: const BorderSide(width: 1, color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputBorder),
        ),
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w400,
          color: widget.hintColor ?? AppColors.white.withOpacity(0.4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: AppColors.inputBorder),
        ),
      ),
    );
  }
}

class CommentTextField extends StatefulWidget {
  final String? initial;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? suffixColor;
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
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;
  final String? Function(String?)? onSaved;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatter;
  const CommentTextField({
    super.key,
    this.maxLines,
    this.decoration,
    this.height,
    this.filledColor,
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
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
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
        textCapitalization: TextCapitalization.words,
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
              : GestureDetector(
                  onTap: widget.suffixOntap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SvgPicture.asset(
                      Utils.getSvgPath(widget.suffixIcon ?? ''),
                      fit: BoxFit.scaleDown,
                      color: AppColors.lightGolden,
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
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 1, color: AppColors.trans),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 1, color: AppColors.trans),
          ),
          hintStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white.withOpacity(0.7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 1, color: AppColors.trans),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 1, color: AppColors.trans),
          ),
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
      style: TextStyle(color: AppColors.white, fontSize: 10.sp),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: AppColors.white),
        hintText: widget.hint,
        suffixIcon: widget.suffixIcon,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.white),
        ),
        hintStyle: TextStyle(
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.white),
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
  final Color? fillColor;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onchange;

  const SearchTextField({
    super.key,
    this.isEnabled = true,
    this.fillColor,
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
                    color: AppColors.white.withOpacity(0.4),
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
                      color: widget.suffixColor,
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
            color: AppColors.white.withOpacity(0.5),
          ),
        ),
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w400,
          color: widget.hintColor ?? AppColors.white.withOpacity(0.4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.white.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
