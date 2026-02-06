// Booking Card
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/utils/utils.dart';
import '../../controllers/make_a_booking_controller.dart';

Widget confirmBookingCard(MakeABookingController controller) {
  return controller.isBookingLoading.value == true
      ? CircularProgressIndicator.adaptive()
      : confirmContentCard(
          controller: controller,
          icon: Icons.check_circle,
          iconColor: Colors.green,
          title: 'Booking Confirmed',
        );
}

// Shared Card Content
// Shared Card Content
Widget confirmContentCard({
  required IconData icon,
  required Color iconColor,
  required String title,
  required MakeABookingController controller,
}) {
  final opening =
      controller.bookingModel.cafeId!.openingHours?.isNotEmpty == true
      ? controller.cafeModel.openingHours!.first
      : null;
  final availableFor = controller.bookingModel.availableFor ?? [];
  log(
    controller.bookingModel.lookingFor!
        .any((e) => e.toLowerCase() == 'lunch')
        .toString(),
  );
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.purple.shade100),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 50.w),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Restaurant info Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  controller.bookingModel.cafeId!.image ?? '',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      color: Colors.grey[100],
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          size: 36,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'No Image',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.bookingModel.cafeId!.name ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Average price : \$${controller.bookingModel.cafeId!.averagePrice}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        controller.bookingModel.cafeId!.reviews!.rating
                            .toString(),
                      ),
                      SizedBox(width: 4.w),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            color: Colors.orange,
                            size: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text(
                        opening == null
                            ? ''
                            : '${Utils.formatTo12Hour(opening.openingTime)} - ${Utils.formatTo12Hour(opening.closingTime)}',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),

                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14.sp),
                      SizedBox(width: 4.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.bookingModel.cafeId!.location?.region ??
                                '',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            controller.bookingModel.cafeId!.locationLink ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.blue,
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
        SizedBox(height: 16.h),

        // Bookings for date
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 16.sp),
            SizedBox(width: 4.w),
            Text(
              'Bookings For ${Utils.formattedDate()}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                controller.cafeModel.description ?? '',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '(Can select multiple options for all)',
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Looking For Section
        // Updated sections for MakeABookingView - replace the "Looking For" and "Available For" sections

        // Replace the Looking For and Available For section (starting from line ~685) with this:

        // Looking For Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Looking For:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                const Text(
                  'Available For:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Looking For - Multiple Selection
                Row(
                  children: controller.bookingModel.lookingFor!
                      .map(
                        (option) => Container(
                          width: 100.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff3F6EFF),
                            border: Border.all(color: const Color(0xff3F6EFF)),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 12.h),

                // Available For - Multiple Selection
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (controller.bookingModel.availableFor!.any(
                          (e) => e.toLowerCase() == 'breakfast',
                        ))
                          Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8.w),
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xff3F6EFF),
                              border: Border.all(
                                color: const Color(0xff3F6EFF),
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              'Breakfast',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        if (controller.bookingModel.availableFor!.any(
                          (e) => e.toLowerCase() == 'lunch',
                        ))
                          Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xff3F6EFF),
                              border: Border.all(
                                color: const Color(0xff3F6EFF),
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              'Lunch',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        if (controller.bookingModel.availableFor!.any(
                          (e) => e.toLowerCase() == 'dinner',
                        ))
                          Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8.w),
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xff3F6EFF),
                              border: Border.all(
                                color: const Color(0xff3F6EFF),
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              'Dinner',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        if (controller.bookingModel.availableFor!.any(
                          (e) => e.toLowerCase() == 'supper',
                        ))
                          Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xff3F6EFF),
                              border: Border.all(
                                color: const Color(0xff3F6EFF),
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              'Supper',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ).paddingOnly(right: 18.w),
          ],
        ),

        SizedBox(height: 12.h),
        Row(
          children: [
            const Text(
              'Additional Notes:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: Text(
                controller.bookingModel.additionalNotes ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '- Reservations can\'t be amended',
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              '- Booking will automatically expire within 24 hours',
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              '- If no successful booking is made, you may apply with the next booking cycle',
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              '- Only one booking allowed at a time',
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              '- Only one successful match limit a week',
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              '- Bookings for events will open at 9PM SGT the day before (e.g. Booking for 12th April will be opened at 9PM on 11th April)',
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              '- More T&C in our website',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),

        SizedBox(height: 16.h),
      ],
    ),
  );
}
