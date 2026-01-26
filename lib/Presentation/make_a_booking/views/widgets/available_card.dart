// Available Card
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/make_a_booking_controller.dart';
import '../make_a_booking_view.dart';

Widget availableCard(MakeABookingController controller) {
  // Sample data

  return Column(
    children: controller.availableModel.map((profile) {
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
                  "${profile.userId?.fullName} ${profile.userId?.age ?? ''}",
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
                ClipOval(
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.network(
                      profile.userId?.profilePhoto?.isNotEmpty == true
                          ? profile.userId!.profilePhoto!
                          : 'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ).paddingOnly(right: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.userId!.location.toString(),
                        style: TextStyle(fontSize: 14.sp),
                      ),

                      Text(
                        profile.userId?.occupation ?? ''.toString(),
                        style: TextStyle(fontSize: 11.sp, color: Colors.pink),
                      ),

                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Looking for: ${(profile.lookingFor as List).join(', ')}",
                          ).paddingOnly(right: 70.w),
                        ],
                      ),
                      Text(
                        "Available for: ${(profile.availableFor as List).join(', ')}",
                      ),
                      Text("Note: ${profile.additionalNotes}"),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 4.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile.userId!.maritalStatus.toString()),
                Text(profile.cafeId!.location!.region.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        profile.userId?.datingIntentions ?? '',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.joinRequest(profile.id);
                            // showMatchDialog(Get.context!);
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              'assets/images/done.png',
                              scale: 4,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () {
                            controller.rejectRequestForAvailable(
                              profile.userId?.id!,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              'assets/images/cross.png',
                              scale: 4,
                            ),
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
      );
    }).toList(),
  );
}
