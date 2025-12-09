import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/user_booking_details_controller.dart';

class UserBookingDetailsView extends GetView<UserBookingDetailsController> {
  const UserBookingDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAEEDC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Booking Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            availableCard(),

            Container(
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

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 50.w,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Booking Confirmed'",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Restaurant info Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          'assets/images/food_1.png',
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Macdonald',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Average price : \$10-15',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Text('4.8'),
                                SizedBox(width: 4.w),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      index < 4
                                          ? Icons.star
                                          : Icons.star_border,
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
                                  '10am - 9pm (5th May)',
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
                                      'North',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    Text(
                                      '#01-2 Bukit Batok Crescent (638498)',
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
                        'Bookings For 5th May',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Best Western Food in the West?',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Looking For Section
                  Row(
                    children: [
                      const Text(
                        'Looking For:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).paddingOnly(right: 12.w),
                      Row(
                        children: ['Male', 'Female']
                            .map(
                              (option) => GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(right: 8.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3F6EFF),

                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Text(
                                    option,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Available For:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 12.w),

                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120.w,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      'Breakfast',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    width: 120.w,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      'Lunch',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  Container(
                                    width: 120.w,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      'Dinner',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 120.w,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      'Supper',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Expanded(
                          //   child: Wrap(
                          //     spacing: 12.w,
                          //     runSpacing: 4.h,
                          //     children: options.map((option) {
                          //       final isSelected = controller.selectedAvailableFor
                          //           .contains(option);
                          //       return GestureDetector(
                          //         onTap: () => controller.toggleAvailableFor(option),
                          //         child: Container(
                          //           padding: EdgeInsets.symmetric(
                          //             horizontal: 30.w,
                          //             vertical: 4.h,
                          //           ),
                          //           decoration: BoxDecoration(
                          //             color: isSelected
                          //                 ? const Color(0xff3F6EFF)
                          //                 : Colors.white,
                          //             border: Border.all(
                          //               color: isSelected
                          //                   ? const Color(0xff3F6EFF)
                          //                   : Colors.black,
                          //             ),
                          //             borderRadius: BorderRadius.circular(20.r),
                          //           ),
                          //           child: Text(
                          //             option,
                          //             style: TextStyle(
                          //               color: isSelected
                          //                   ? Colors.white
                          //                   : Colors.black,
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),

                  // Obx(() {
                  //   List<String> options = controller.availableFor;
                  //
                  //   return Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text(
                  //             'Available For:',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //           SizedBox(width: 12.w),
                  //
                  //           Column(
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Container(
                  //                     width: 120.w,
                  //                     alignment: Alignment.center,
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 20.w,
                  //                       vertical: 4.h,
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       border: Border.all(color: Colors.black),
                  //                       borderRadius: BorderRadius.circular(20.r),
                  //                     ),
                  //                     child: Text(
                  //                       'Breakfast',
                  //                       style: TextStyle(
                  //                         color: Colors.black,
                  //                         fontSize: 14.sp,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(width: 4),
                  //                   Container(
                  //                     width: 120.w,
                  //                     alignment: Alignment.center,
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 20.w,
                  //                       vertical: 4.h,
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       border: Border.all(color: Colors.black),
                  //                       borderRadius: BorderRadius.circular(20.r),
                  //                     ),
                  //                     child: Text(
                  //                       'Lunch',
                  //                       style: TextStyle(color: Colors.black),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               SizedBox(height: 12.h),
                  //               Row(
                  //                 children: [
                  //                   Container(
                  //                     width: 120.w,
                  //                     alignment: Alignment.center,
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 20.w,
                  //                       vertical: 4.h,
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       border: Border.all(color: Colors.black),
                  //                       borderRadius: BorderRadius.circular(20.r),
                  //                     ),
                  //                     child: Text(
                  //                       'Dinner',
                  //                       style: TextStyle(color: Colors.black),
                  //                     ),
                  //                   ),
                  //                   SizedBox(width: 12),
                  //                   Container(
                  //                     width: 120.w,
                  //                     alignment: Alignment.center,
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 20.w,
                  //                       vertical: 4.h,
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       border: Border.all(color: Colors.black),
                  //                       borderRadius: BorderRadius.circular(20.r),
                  //                     ),
                  //                     child: Text(
                  //                       'Supper',
                  //                       style: TextStyle(color: Colors.black),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //
                  //           // Expanded(
                  //           //   child: Wrap(
                  //           //     spacing: 12.w,
                  //           //     runSpacing: 4.h,
                  //           //     children: options.map((option) {
                  //           //       final isSelected = controller.selectedAvailableFor
                  //           //           .contains(option);
                  //           //       return GestureDetector(
                  //           //         onTap: () => controller.toggleAvailableFor(option),
                  //           //         child: Container(
                  //           //           padding: EdgeInsets.symmetric(
                  //           //             horizontal: 30.w,
                  //           //             vertical: 4.h,
                  //           //           ),
                  //           //           decoration: BoxDecoration(
                  //           //             color: isSelected
                  //           //                 ? const Color(0xff3F6EFF)
                  //           //                 : Colors.white,
                  //           //             border: Border.all(
                  //           //               color: isSelected
                  //           //                   ? const Color(0xff3F6EFF)
                  //           //                   : Colors.black,
                  //           //             ),
                  //           //             borderRadius: BorderRadius.circular(20.r),
                  //           //           ),
                  //           //           child: Text(
                  //           //             option,
                  //           //             style: TextStyle(
                  //           //               color: isSelected
                  //           //                   ? Colors.white
                  //           //                   : Colors.black,
                  //           //             ),
                  //           //           ),
                  //           //         ),
                  //           //       );
                  //           //     }).toList(),
                  //           //   ),
                  //           // ),
                  //         ],
                  //       ),
                  //     ],
                  //   );
                  // }),

                  // Additional Notes and T&C
                  SizedBox(height: 8.h),

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
            ),
          ],
        ),
      ),
    );
  }
}

Widget availableCard() {
  // Sample data
  final profiles = [
    {
      "name": "Mary",
      "age": 38,
      "nationality": "Chinese",
      "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
      "lookingFor": "Male",
      "availableFor": ["Lunch", "Dinner"],
      "note": "please be punctual",
      "status": "  -Female,\n Singaporean",
    },
  ];

  return Column(
    children: profiles.map((profile) {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: name, age, nationality, warning icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${profile['name']} ${profile['age']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ).paddingOnly(left: 30.w),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/images/girl.png", scale: 3.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile['nationality'].toString(),
                      style: TextStyle(fontSize: 14.sp),
                    ),

                    Text(
                      profile['occupation'].toString(),
                      style: TextStyle(fontSize: 11.sp, color: Colors.pink),
                    ),

                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Looking for: ${profile['lookingFor']}",
                        ).paddingOnly(right: 70.w),

                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withValues(alpha: 0.4),
                            ),
                          ),
                          child: Text(
                            "Serious",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Available for: ${profile['availableFor'].toString()}",
                    ),
                    Text("Note: ${profile['note']}"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 4.h),

            SizedBox(height: 4.h),
            Text(profile['status'].toString()),
            SizedBox(height: 8.h),
          ],
        ),
      );
    }).toList(),
  );
}
