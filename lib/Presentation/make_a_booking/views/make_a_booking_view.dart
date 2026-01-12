import 'dart:developer';

import 'package:convo_hearts/Presentation/make_a_booking/views/widgets/available_card.dart';
import 'package:convo_hearts/Presentation/make_a_booking/views/widgets/confirm_booking.dart';
import 'package:convo_hearts/Presentation/make_a_booking/views/widgets/like_you.dart';
import 'package:convo_hearts/Presentation/make_a_booking/views/widgets/make_booking_card.dart'
    show bookingCard;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/utils/utils.dart';
import '../../cafeconnect_booking_details/views/filter.dart';
import '../../cafeconnect_conversation/views/report_bottom.dart';
import '../controllers/make_a_booking_controller.dart';

class MakeABookingView extends GetView<MakeABookingController> {
  const MakeABookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MakeABookingController(),
      builder: (controller) {
        log(controller.selectedTab.value);
        return Scaffold(
          backgroundColor: const Color(0xFFFAEEDC),
          appBar: AppBar(
            backgroundColor: const Color(0xFFFAEEDC),
            elevation: 0,
            actions: [
              Obx(() {
                if (controller.selectedTab.value != 'Bookings') {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const FilterBottomSheet(),
                      );
                    },
                    child: Image.asset(
                      'assets/images/filter.png',
                      scale: 4,
                    ).paddingOnly(right: 12),
                  );
                }
                return const SizedBox.shrink();
              }),
            ],

            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Make a Booking',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              // Slideshow Ads Placeholder
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: const Center(
                  child: Text(
                    '~Slideshow Ads Space',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Tabs Row
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    tabItem('Bookings', controller),
                    tabItem('Available', controller),
                    tabItem('Likes you', controller),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // Cards based on selected tab
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 16.h),

                  child: Obx(() {
                    if (controller.selectedTab.value != 'Bookings') {
                      switch (controller.selectedTab.value) {
                        case 'Available':
                          return availableCard(controller);
                        case 'Likes you':
                          return likesYouCard(controller);
                        default:
                          return bookingCard(controller);
                      }
                    }

                    // BOOKINGS TAB
                    if (!controller.isAlreadyBooked.value) {
                      return bookingCard(controller);
                    }

                    // already booked but API still loading
                    if (controller.isBookingLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    // safety check
                    if (controller.bookingModel.id == null) {
                      return const SizedBox(); // or skeleton UI
                    }

                    return confirmBookingCard(controller);
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Tab Widget
  Widget tabItem(String title, MakeABookingController controller) {
    bool isSelected = controller.selectedTab.value == title;
    return GestureDetector(
      onTap: () => controller.selectTab(title),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff3F6EFF) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Color(0xff3F6EFF)),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
        ),
      ),
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                // Handle block action
                Navigator.pop(context);
                showBlockReportBottomSheet(context, () {
                  Navigator.pop(Get.context!);
                  showReportUserBlocked(Get.context!);
                });
              },
              child: const Text(
                'Block (hides from your pool)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(color: Colors.grey.shade300),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.pop(context);

                showConfirmReportBottomSheet(context, () {
                  Navigator.pop(Get.context!);

                  showReportSuccessDialog(Get.context!);
                });
                // Handle report action
              },
              child: const Text(
                'Report for inappropriate/ offensive behavior',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
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

Future<void> showBlockReportBottomSheet(BuildContext context, onTap) {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Main Heading
            Text(
              "Confirm blocking on Mary?",
              style: GoogleFonts.inriaSans(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 30.h),

            Text(
              "(removes from your dating pool too)",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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

Future<void> showReportUserBlocked(BuildContext context) {
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
                "User has been blocked.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

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

void showBookingDialog(BuildContext context, String title, onTap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0xFFF5E6D3),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Booking Date: ${Utils.formattedDate()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Available for: Lunch/ Dinner',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Note: Please be punctual',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text(
                'By proceeding, you accept the terms of use',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Color(0xff3F6EFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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
