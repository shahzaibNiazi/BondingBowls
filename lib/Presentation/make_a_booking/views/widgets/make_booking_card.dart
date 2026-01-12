// Booking Card
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/utils/utils.dart';
import '../../controllers/make_a_booking_controller.dart';
import '../make_a_booking_view.dart';

Widget bookingCard(controller) {
  return contentCard(
    controller: controller,
    icon: Icons.check_circle,
    iconColor: Colors.green,
    title: 'Booking Confirmed',
  );
}

// Shared Card Content
Widget contentCard({
  required IconData icon,
  required Color iconColor,
  required String title,
  required MakeABookingController controller,
}) {
  final opening = controller.cafeModel.openingHours?.isNotEmpty == true
      ? controller.cafeModel.openingHours!.first
      : null;

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
                  controller.cafeModel.image ?? '',
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
                    controller.cafeModel.name ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Average price : \$${controller.cafeModel.averagePrice}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(controller.cafeModel.reviews!.rating.toString()),
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
                            controller.cafeModel.location?.region ?? '',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            controller.cafeModel.locationLink ?? '',
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
                  children: ['Male', 'Female']
                      .map(
                        (option) => GestureDetector(
                          onTap: () {
                            controller.toggleLookingFor(option);
                          },
                          child: Container(
                            width: 100.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8.w),
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color:
                                  controller.selectedLookingFor.contains(option)
                                  ? const Color(0xff3F6EFF)
                                  : Colors.white,
                              border: Border.all(
                                color:
                                    controller.selectedLookingFor.contains(
                                      option,
                                    )
                                    ? const Color(0xff3F6EFF)
                                    : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color:
                                    controller.selectedLookingFor.contains(
                                      option,
                                    )
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 12.h),

                // Available For - Multiple Selection
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleAvailableFor('Breakfast');
                            },
                            child: Container(
                              width: 100.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 8.w),
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedAvailableFor.contains(
                                      'Breakfast',
                                    )
                                    ? const Color(0xff3F6EFF)
                                    : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Breakfast',
                                      )
                                      ? const Color(0xff3F6EFF)
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'Breakfast',
                                style: TextStyle(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Breakfast',
                                      )
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.toggleAvailableFor('Lunch');
                            },
                            child: Container(
                              width: 100.w,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedAvailableFor.contains(
                                      'Lunch',
                                    )
                                    ? const Color(0xff3F6EFF)
                                    : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Lunch',
                                      )
                                      ? const Color(0xff3F6EFF)
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'Lunch',
                                style: TextStyle(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Lunch',
                                      )
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleAvailableFor('Dinner');
                            },
                            child: Container(
                              width: 100.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 8.w),
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedAvailableFor.contains(
                                      'Dinner',
                                    )
                                    ? const Color(0xff3F6EFF)
                                    : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Dinner',
                                      )
                                      ? const Color(0xff3F6EFF)
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'Dinner',
                                style: TextStyle(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Dinner',
                                      )
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.toggleAvailableFor('Supper');
                            },
                            child: Container(
                              width: 100.w,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedAvailableFor.contains(
                                      'Supper',
                                    )
                                    ? const Color(0xff3F6EFF)
                                    : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Supper',
                                      )
                                      ? const Color(0xff3F6EFF)
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'Supper',
                                style: TextStyle(
                                  color:
                                      controller.selectedAvailableFor.contains(
                                        'Supper',
                                      )
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // background color
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // optional: rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3), // shadow color
                      spreadRadius: 2, // how much the shadow spreads
                      blurRadius: 5, // blur effect
                      offset: const Offset(0, 3), // x and y offset
                    ),
                  ],
                ),
                child: TextFormField(
                  maxLines: 3,
                  controller: controller.additional,
                  decoration: const InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: (value) =>
                      value != null && value.isNotEmpty ? null : 'Required',
                ),
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

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                showBookingDialog(
                  Get.context!,
                  'Confirm booking for Macdonalds\nto find other matches?',
                  () async {
                    Navigator.of(Get.context!).pop();
                    // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);

                    await controller.makeABooking();
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3F6EFF),
                foregroundColor: Colors.white,
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 12,
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                "[Confirm]\nFinding for other \nmatches for ${Utils.formattedDate()}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
