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
        minChildSize: 0.6,
        maxChildSize: 0.8,
        builder: (_, controller) {
          return Stack(
            children: [
              // 50% banner
              Container(
                padding: EdgeInsets.only(top: 14, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  border: Border.all(color: Color(0xffBC0072), width: 2),
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // drag handle
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                children: [
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
                                children: [
                                  Icon(Icons.access_time, size: 20),
                                  SizedBox(width: 6),
                                  Text("10am - 9pm (5th May)"),
                                ],
                              ),

                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on, size: 20),
                                  SizedBox(width: 6),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "North",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "#01-2 Bukit Batok Crescent (638498)",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 11.sp,
                                          decoration: TextDecoration.underline,
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

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "1 FOR 1 BRIYANI ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            children: [
                              Icon(Icons.timer, color: Colors.black, size: 20),
                              SizedBox(width: 6),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "hours",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "18",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "minutes left",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "8",
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
                                          color: Colors.black,
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
                      Divider(color: Colors.black26),
                      SizedBox(height: 20),

                      _bullet(
                        "Each voucher is subject to limited availability as determined by the participating café or restaurant.",
                      ),
                      _bullet(
                        "Vouchers are issued on a first-come, first-served basis and may be redeemed by up to the stated maximum number of users (e.g. 50) No further redemptions will be accepted. ",
                      ),
                      _bullet(
                        "To redeem the voucher, you must physically visit the participating outlet. Upon arrival, open the app and swipe right on the “logo” below in the presence of the café/restaurant staff.",
                      ),
                      _bullet(
                        "Vouchers are non-transferable and can only be used by the account holder who accepted the voucher. Vouchers cannot be exchanged for cash, credit, or other services outside of what is explicitly offered.",
                      ),
                      _bullet(
                        "Any misuse or fraudulent behavior (e.g., swiping the voucher off-premise) may result in the forfeiture of the voucher and potential suspension of your account.",
                      ),

                      Divider(color: Colors.black),

                      SizedBox(height: 28),

                      // Slide warning button
                      SlideToRedeem(),

                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ).paddingSymmetric(horizontal: 8),
              // Positioned(
              //   top: -12,
              //   left: 0,
              //   child: Transform.rotate(
              //     angle: -0.20,
              //     child: Container(
              //       width: 134, // REQUIRED
              //       height: 134, // REQUIRED
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage("assets/images/ribon.png"),
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //       child: Text(
              //         "-50%",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20.sp,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      );
    },
  );
}

Widget _bullet(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• "),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
