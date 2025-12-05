import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> showCafeConnectPurchaseDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CafeConnectPurchaseDialogContent(),
      );
    },
  );
}

class CafeConnectPurchaseDialogContent extends StatelessWidget {
  const CafeConnectPurchaseDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF8D4E0), width: 4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Title
          Text(
            "Confirm Purchase of",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          /// Item Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time, size: 20, color: Colors.black87),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CafeConnect",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Timer Refresh",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Text(
                "= ♡ 200",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBC0072),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          /// Description
          Text(
            "This will refresh your CafeConnect Timer Immediately",
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          /// Balance Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFC672A5), width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "♡",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffBC0072),
                      ),
                    ),
                    Text(
                      " 300",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ],
                ),
                Text(" - ", style: TextStyle(fontSize: 14.sp)),
                Text(
                  "♡ 200",
                  style: TextStyle(fontSize: 14.sp, color: Color(0xFFE91E63)),
                ),
                Text(" = ", style: TextStyle(fontSize: 14.sp)),
                Text(
                  "♡ 100",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE91E63),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          /// Non Refundable
          Text(
            "Purchase made are non refundable as per ToS",
            style: TextStyle(fontSize: 14.sp, color: Colors.black54),
          ),
          const SizedBox(height: 40),

          /// Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Cancel Button
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.transparent, // disable default shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12),

              /// Proceed Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Add purchase logic here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F6EFF),
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: Colors.black38,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Proceed",
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
    ).paddingAll(12);
  }
}
