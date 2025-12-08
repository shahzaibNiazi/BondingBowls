import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GetBowlsScreen extends StatelessWidget {
  const GetBowlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Top Bar with Back and Centered Title
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: SvgPicture.asset(
                          "assets/icon/svg/back_arrow.svg",
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Get more Bowls",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Bowl options
                _bowlCard(price: "25", bowls: "250"),
                const SizedBox(height: 12),
                _bowlCard(price: "45", bowls: "500"),
                const SizedBox(height: 12),
                _bowlCard(
                  price: "100",
                  bowls: "1000",
                  extra: "+1 PERMANENT\nincrement chat",
                ),

                const SizedBox(height: 24),

                // Mystery Bowl Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Claim daily free mystery bowls ;-)",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icon/svg/clock_timer.svg",
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Available",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ), // const Icon(Icons.help_outline, color: Colors.black54),
                      const SizedBox(width: 12),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/icon/svg/bowl.svg"),
                          SvgPicture.asset("assets/icon/svg/question.svg"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bowlCard({
    required String price,
    required String bowls,
    String? extra,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left: Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "S\$$price",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "One-time charge",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Equal icon
          SvgPicture.asset("assets/icon/svg/isequal.svg"),

          const Spacer(),

          // Right: Bowl info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icon/svg/bowl.svg"),
                  const SizedBox(width: 4),
                  Text(
                    bowls,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/svg/clock.svg",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Instant Delivery",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              if (extra != null) ...[
                const SizedBox(height: 2),
                Text(
                  extra,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
