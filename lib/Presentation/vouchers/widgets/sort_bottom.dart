import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortBottomSheet extends StatefulWidget {
  String selectedOption;

  SortBottomSheet({super.key, required this.selectedOption});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  final List<String> sortOptions = [
    'Recent (Default)',
    'Expiring First',
    'Expiring Last',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 2.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top handle bar
          Container(
            margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 5.h, 24.w, 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  'Sort by',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 8.h),

                // Divider line
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 119, 118, 118),
                ),

                SizedBox(height: 24.h),

                // Sort options
                ...sortOptions.map(
                  (option) => Container(
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.selectedOption = option;
                            });
                          },
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: widget.selectedOption == option
                                    ? const Color.fromARGB(255, 0, 0, 0)
                                    : Colors.grey[400]!,
                                width: 2,
                              ),
                              color: Colors.transparent,
                            ),
                            child: widget.selectedOption == option
                                ? Container(
                                    margin: EdgeInsets.all(4.w),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // Apply button
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, widget.selectedOption);
                    },
                    child: Container(
                      width: 200.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Color(0xff003FFF)),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
