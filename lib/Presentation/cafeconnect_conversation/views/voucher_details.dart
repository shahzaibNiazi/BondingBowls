import 'package:convo_hearts/Presentation/cafeconnect_conversation/views/slide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showVoucherDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.8,
        maxChildSize: 0.9,
        builder: (_, controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                // ================= MAIN CONTAINER =================
                Container(
                  clipBehavior: Clip.hardEdge, // 🔥 REQUIRED
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),

                  // ================= INNER STACK =================
                  child: Stack(
                    clipBehavior: Clip.hardEdge, // 🔥 REQUIRED
                    children: [
                      // ================= CONTENT =================
                      SingleChildScrollView(
                        controller: controller,
                        padding: const EdgeInsets.only(
                          top: 14,
                          left: 12,
                          right: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Drag handle
                            Center(
                              child: Container(
                                width: 60,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),

                            SizedBox(height: 12),

                            Center(
                              child: Text(
                                "Voucher Details",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 16),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/food_1.png',
                                    height: 150.h,
                                    width: 140.w,
                                    fit: BoxFit.cover,
                                  ),
                                ).paddingOnly(right: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "My Briyani House",
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Average price: \$10-15",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          SizedBox(width: 6),
                                          Text("4.8 (234 reviews)"),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.access_time, size: 20),
                                          SizedBox(width: 6),
                                          Text("10am - 9pm (5th May)"),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 6),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("North"),
                                              Text(
                                                "#01-2 Bukit Batok Crescent (638498)",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 11.sp,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1 FOR 1 BRIYANI",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.timer, size: 20),
                                    const SizedBox(width: 6),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "2 ",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Text(
                                              "hours ",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            Text(
                                              "18 ",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Text(
                                              "minutes left",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "8 ",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Vouchers left!",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 20),
                            const Divider(),
                            SizedBox(height: 20),

                            _bullet(
                              "Each voucher is subject to limited availability as determined by the participating café or restaurant.",
                            ),
                            _bulletText().paddingOnly(bottom: 1.h),
                            _bullet(
                              "To redeem the voucher, you must physically visit the participating outlet. Upon arrival, open the app and swipe right on the “logo” below in the presence of the café/restaurant staff.",
                            ),
                            _bullet(
                              "Vouchers are non-transferable and can only be used by the account holder who accepted the voucher. Vouchers cannot be exchanged for cash, credit, or other services outside of what is explicitly offered.",
                            ),
                            _bullet(
                              "Any misuse or fraudulent behavior (e.g., swiping the voucher off-premise) may result in the forfeiture of the voucher and potential suspension of your account.",
                            ),
                            const Divider(),

                            Text(
                              "We and our partner merchants reserve the right to modify or cancel vouchers at"
                              "any time without prior notice due to unforeseen circumstances, including"
                              "over-redemption or operational limitations. ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xff563636),
                              ),
                            ).paddingSymmetric(horizontal: 6),

                            SizedBox(height: 28),
                            SlideToRedeem(),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),

                      // ================= RIBBON =================
                      Positioned(
                        top: 10,
                        left: -30,
                        child: Transform.rotate(
                          angle: -0.65,
                          child: Container(
                            width: 120,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  blurRadius: 6,
                                  offset: const Offset(2, 3),
                                ),
                              ],
                            ),

                            child: const Text(
                              '-50%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
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
        },
      );
    },
  );
}

// ================= HELPERS =================

Widget _bullet(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• "),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 11.sp)),
        ),
      ],
    ),
  );
}

Widget _bulletText() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("• "),
      Expanded(
        child: Text.rich(
          TextSpan(
            children:  [
              TextSpan(
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
                text:
                    "Vouchers are issued on a ",
              ),

              TextSpan(
                text: "first-come, first-served",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " basis and may be redeemed by up to the stated maximum number of users (e.g. 50)",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: " No further redemptions will be accepted.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
