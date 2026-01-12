// Available Card
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../cafeconnect_booking_details/views/cafeconnect_booking_details_view.dart';
import '../make_a_booking_view.dart';

Widget likesYouCard(controller) {
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
      "status": "Married Female",
    },
    {
      "name": "Mary",
      "age": 38,
      "nationality": "Malay",
      "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
      "lookingFor": "Male",
      "availableFor": ["Lunch", "Dinner"],
      "note": "please be punctual",
      "status": "- Female",
    },
    {
      "name": "Mary",
      "age": 38,
      "nationality": "Russian",
      "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
      "lookingFor": "Male",
      "availableFor": ["Lunch", "Dinner"],
      "note": "please be punctual",
      "status": "- Female",
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
                GestureDetector(
                  onTap: () {
                    showCustomBottomSheet(Get.context!);
                  },
                  child: Icon(
                    Icons.warning,
                    color: Color(0xffBC0072),
                    size: 30.sp,
                  ),
                ),
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
                    Text("Looking for: ${profile['lookingFor']}"),
                    Text(
                      "Available for: ${(profile['availableFor'] as List).join(', ')}",
                    ),
                    Text("Note: ${profile['note']}"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 4.h),
            Column(
              children: [
                Text(profile['status'].toString()),
                Text('Singaporean'),
              ],
            ),

            // Accept / Reject buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showMatchDialog(Get.context!);
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/images/done.png', scale: 4),
                  ),
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/images/cross.png', scale: 4),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList(),
  );
}
