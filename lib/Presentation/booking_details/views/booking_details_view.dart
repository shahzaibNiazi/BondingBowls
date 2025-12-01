import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/utils/utils.dart';
import '../controllers/booking_details_controller.dart';

class BookingDetailsView extends GetView<BookingDetailsController> {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBEFE3),
      // light peach background
      body: SafeArea(
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
                    icon: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
                  ),
                ),
                Center(
                  child: Text(
                    "Booking Details",
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
            // Slideshow Ad Space
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Center(
                child: Text(
                  '~Slideshow Ads Space',
                  style: TextStyle(
                    color: Color(0xffC672A5),
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ).paddingOnly(bottom: 14.h),

            // Tabs Row
            // Tabs Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Obx(
                () => Row(
                  children: [
                    _tabButton('Bookings', 0, controller),
                    const SizedBox(width: 8),
                    _tabButton('Available', 1, controller),
                    const SizedBox(width: 8),
                    _tabButton('Likes you', 2, controller),
                  ],
                ),
              ),
            ),
            // Main Content Card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30.h),

                        // Robot Image
                        SizedBox(
                          height: 350,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Utils.getImagePath('no_booking'),
                                scale: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    Utils.getImagePath('no_book'),
                                    scale: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Cafeconnect is on cooldown!',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        '(6 Days  22 Hours  51 Mins)',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black87,
                                        ),
                                      ).paddingOnly(bottom: 12.h),

                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          border: Border.all(
                                            width: 3,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'refresh now for',
                                            children: [
                                              TextSpan(
                                                text: ' 200',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(bottom: 50.h),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Verification Speech Bubble

                        // Information List
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _BulletText('Reservations can\'t be amended'),
                            _BulletText(
                              'Booking will automatically expire within 24 hours',
                            ),
                            _BulletText(
                              'If no successful booking is made, you may apply with the next booking cycle',
                            ),
                            _BulletText('Only one booking allowed at a time'),
                            _BulletText(
                              'Only one successful match limit a week',
                            ),
                            _BulletText(
                              'Bookings for events will open at 9PM SGT the day before (e.g. Booking for 12th April will be opened at 9PM on 11th April)',
                            ),
                            SizedBox(height: 6),
                            _LinkText(
                              'More T&C  in our website',
                              'https://yourwebsite.com',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab Button Widget
  Widget _tabButton(
    String text,
    int index,
    BookingDetailsController controller,
  ) {
    final isActive = controller.selectedTabIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2E5BFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? const Color(0xFF2E5BFF)
                : Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Custom Bullet Text Widget
class _BulletText extends StatelessWidget {
  final String text;
  const _BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14, height: 1.5)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Link Text Widget
class _LinkText extends StatelessWidget {
  final String text;
  final String url;
  const _LinkText(this.text, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // open your T&C link
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
