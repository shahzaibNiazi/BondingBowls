import 'package:convo_hearts/src/feature/settings/getbowls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/payment_system_controller.dart';

class PaymentSystemView extends GetView<PaymentSystemController> {
  const PaymentSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDEEE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDEEE2),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Payments",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _availableBowlsSection(),
            const SizedBox(height: 16),
            _currentTimerSection(),
            const SizedBox(height: 16),
            _sectionTitle(
              image: 'booster',
              "Profile Boosts (Immediate +24 Hours)",
            ),
            _subtitle("Rise to the top of everyone’s matching page"),
            _singlePriceCard(60),
            const Divider(height: 32),
            _sectionTitle(
              scale: 11,
              image: 'match_logo',
              "Bowl Crush (No Expiry)",
            ),

            _subtitle("Stand out with a priority LIKE amongst others"),
            _doubleOptionCard("+5 Bowl Crush", 80),
            const SizedBox(height: 8),
            _doubleOptionCard("+10 Bowl Crush", 150),
            const Divider(height: 32),
            _incrementChatSection(),
            const Divider(height: 32),
            _sectionTitle(image: 'increment_chat', "CafeConnect Timer Refresh"),
            _subtitle("This will refresh your CafeConnect Timer Immediately"),
            _singlePriceCard(200),
            const Divider(height: 32),
            _sectionTitle(
              image: 'increment_chat',
              "Received Likes Unlocker +1 Month",
            ),
            _subtitle("This will unlock your received likes immediately"),
            _singlePriceCard(200),
          ],
        ),
      ),
    );
  }

  Widget _availableBowlsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Bowls :",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Image.asset("assets/images/cup.png", scale: 4),
              const SizedBox(width: 8),
              Text(
                "144",
                style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
              ).paddingOnly(left: 10),
              const Spacer(),
              Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFB4B16),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.card_giftcard, color: Colors.white),
                    label: Text(
                      "Add a Voucher",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      showVoucherBottomSheet(Get.context!);
                    },
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        Get.context!,
                        MaterialPageRoute(
                          builder: (context) => GetBowlsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Get more bowls",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _currentTimerSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(borderColor: Colors.pinkAccent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.timer_outlined, color: Colors.pink, size: 20),
              SizedBox(width: 8),
              Text(
                "Current Timer :",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          _TimerRow("Profile Boost", "20 Hours 10 min"),
          _TimerRow("Increment Chat +1 (1 month)", "2 Days 5 hours"),
          _TimerRow("Increment Chat +2 (2 month)", "41 Days 5 hours"),
          _TimerRow("Increment Chat +1 (1 month)", "26 Days 5 hours"),
          _TimerRow("Received Likes Unlocker +1 (1 month)", "16 Days 1 hour"),
        ],
      ),
    );
  }

  Widget _incrementChatSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/increment_chat.png",
                scale: 5,
              ).paddingOnly(right: 12),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Increment chat ",
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    TextSpan(
                      text: "      +1",
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.red, // Change color if needed
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Text(
          "1 month and 2 months chats are stackable but not time stackable",
          style: TextStyle(color: Colors.black54, fontSize: 13.sp),
        ),
        const SizedBox(height: 12),
        _doubleOptionCard("+1 month", 200),
        const SizedBox(height: 8),
        _doubleOptionCard("+2 months", 280),
      ],
    );
  }

  Widget _sectionTitle(String title, {String? image, double scale = 5}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                "assets/images/$image.png",
                scale: scale,
              ).paddingOnly(right: 12),

            Text(
              title,

              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      );

  Widget _subtitle(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(color: Colors.black54, fontSize: 13.sp),
    ),
  );

  Widget _doubleOptionCard(String label, int price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: _innerCardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Row(
            children: [
              const Icon(Icons.ramen_dining, size: 18),
              const SizedBox(width: 4),
              Text(
                "$price",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _singlePriceCard(int price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: _innerCardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.ramen_dining, size: 18),
          const SizedBox(width: 4),
          Text(
            "$price",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration({Color borderColor = const Color(0xFFE0B6B6)}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: borderColor, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  BoxDecoration _innerCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE0B6B6)),
      color: Colors.white,
    );
  }
}

class _TimerRow extends StatelessWidget {
  final String title;
  final String time;
  const _TimerRow(this.title, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 13.sp)),
          Text(
            time,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

void showVoucherBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.35,
        maxChildSize: 0.6,
        minChildSize: 0.3,
        builder: (_, controller) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: ListView(
              controller: controller,
              children: [
                // Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Confirm your voucher",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(CupertinoIcons.multiply_circle),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Text label
                Text(
                  "voucher code",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // TextField
                TextField(
                  decoration: InputDecoration(
                    hintText: "voucher code",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Disabled Redeem button
                GestureDetector(
                  onTap: () {
                    showVoucherDialog(
                      context: context,
                      title: "Valid Voucher Code!",
                      message: "200 bowls have been added to your wallet.",
                    );
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3F6EFF), // light blue disabled
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Redeem",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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

void showVoucherDialog({
  required BuildContext context,
  required String title,
  required String message,
  FontWeight? fontWeight,
  double? fontSize,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7ED),
            border: Border.all(color: Color(0xffFED7AA), width: 6),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✔ Icon
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFD92B85),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 28),
              ),

              SizedBox(height: 16),

              // ✔ Title (Dynamic)
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inriaSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 8),

              // ✔ Message (Dynamic)
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.inriaSans(
                  fontSize: fontSize ?? 14.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 20),

              // ✔ Close Button
              SizedBox(
                width: 140,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
