import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Show a bottom sheet with 4 vertically stacked texts.
/// - [items] must have exactly 4 strings (the widget does not enforce but intended usage).
/// - [onTap] optional callbacks per item; if provided it should be same length as items.
/// - Example call:
///   showTextBottomSheet(context, items: ['One','Two','Three','Four']);
Future<void> showTextBottomSheet(
  BuildContext context, {
  required List<String> items,
  List<VoidCallback?>? onTap,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 20,
  ),
  TextStyle? textStyle,
  double radius = 20,
  Color? backgroundColor,
}) {
  assert(
    items.length == 3,
    'This helper expects 4 items (but will work with other counts too).',
  );

  final effectiveTextStyle =
      textStyle ?? TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            // shrink to content height
            mainAxisSize: MainAxisSize.min,
            children: List.generate(items.length, (index) {
              final isLast = index == items.length - 1;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Each item: clickable row with padding
                  InkWell(
                    onTap: onTap != null && onTap.length > index
                        ? onTap[index]
                        : null,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ), // spacing around text
                      child: Text(items[index], style: effectiveTextStyle),
                    ),
                  ),

                  // single horizontal line between items (not after the last one)
                  if (!isLast) const Divider(height: 1),
                ],
              );
            }),
          ),
        ),
      );
    },
  );
}

Future<void> showOtherBottomSheet(BuildContext context) {
  final TextEditingController controller = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom, // ← correct context
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Others :",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Focus(
                  canRequestFocus: true,

                  child: StrokedHintTextField(
                    controller: controller,
                    hint: "Please state the reasons for your report.",
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff3F6EFF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          log("Submitted: ${controller.text}");
                          Navigator.pop(context);
                          showReportSuccessDialog(context);
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showConfirmReportBottomSheet(BuildContext context, onTap) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Heading
            Text(
              "Confirm report for\nInappropriate / offensive behavior?",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 60.h),

            // Timer icon + warning text
            Row(
              children: [
                const Icon(Icons.timer, size: 20, color: Colors.red),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "ACTION WILL BE TAKEN AGAINST FALSE REPORTS",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 60.h),

            // Confirm button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3F6EFF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<void> showReportSuccessDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must press close

    builder: (ctx) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Person icon
              Icon(
                CupertinoIcons.person_solid,
                size: 55,
                color: Color(0xffBC0072),
              ),

              const SizedBox(height: 16),

              // Main success text
              Text(
                "Your report has been made successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              // Moderator review text
              Text(
                "A Moderator will review shortly,",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Thank you text
              Text(
                "Thanks for keeping our App safe",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 22),

              // Close button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class StrokedHintTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final int maxLength;

  const StrokedHintTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 5,
    this.maxLength = 200,
  });

  @override
  State<StrokedHintTextField> createState() => _StrokedHintTextFieldState();
}

class _StrokedHintTextFieldState extends State<StrokedHintTextField> {
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () {
      if (!mounted) return; // prevent setState after dispose
      setState(() {});
    };
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // add Material to prevent InkResponse/focus errors
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 3, color: const Color(0xFFD9D9D9)),
        ),
        child: Stack(
          children: [
            // if (widget.controller.text.isEmpty)
            //   Positioned(
            //     left: 12,
            //     top: 12,
            //     child: Stack(
            //       children: [
            //         // Stroke layer
            //         Text(
            //           widget.hint,
            //           style: GoogleFonts.inriaSans(
            //             fontSize: 14.sp,
            //             fontWeight: FontWeight.bold,
            //             foreground: Paint()
            //               ..style = PaintingStyle.stroke
            //               ..strokeWidth = 3
            //               ..color = const Color(0xFFD9D9D9),
            //           ),
            //         ),
            //         // Fill layer
            //         Text(
            //           widget.hint,
            //           style: TextStyle(
            //             fontSize: 15.sp,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black.withAlpha(100),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            TextField(
              controller: widget.controller,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              cursorColor: Colors.black,

              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: GoogleFonts.inriaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Color(0xff000000).withValues(alpha: 0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
