// Available Card
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/make_a_booking_controller.dart';
import '../make_a_booking_view.dart';

Widget likesYouCard(MakeABookingController controller) {
  return Column(
    children: controller.likeYouModel.map((profile) {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: profile info and warning icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${profile.requestedBy?.nickname?.capitalizeFirst}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: SizedBox(
                                width: 90.w,
                                height: 90.w,
                                child: Image.network(
                                  profile
                                              .requestedBy
                                              ?.profilePhoto
                                              ?.isNotEmpty ==
                                          true
                                      ? profile.requestedBy!.profilePhoto!
                                      : 'https://via.placeholder.com/150',
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 90.w,
                                      height: 90.w,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                      child: const Icon(
                                        Icons.person,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '${profile.requestedBy!.maritalStatus.toString()} ${profile.requestedBy?.age ?? ''}',
                            ).paddingOnly(left: 20.w),
                            SizedBox(height: 4.h),
                            Text(
                              profile.requestedBy!.location!.toString(),
                            ).paddingOnly(left: 20.w),
                          ],
                        ),
                      ],
                    ).paddingOnly(right: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.requestedBy?.location ?? '',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          profile.requestedBy?.occupation ?? ''.toString(),
                          style: TextStyle(fontSize: 11.sp, color: Colors.pink),
                        ),
                        SizedBox(height: 4.h),
                        Text("Available"),
                        SizedBox(height: 4.h),
                        // Uncomment these if you want to show additional info
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Looking for: ${(profile.lookingFor as List).join(', ')}",
                        //     ).paddingOnly(right: 70.w),
                        //   ],
                        // ),
                        // SizedBox(height: 4.h),
                        // Text("Note: ${profile.requestedBy.additionalNotes}"),
                      ],
                    ),
                  ],
                ),

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
                    profile.requestedBy?.datingIntentions ?? '',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ).paddingOnly(left: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await controller.createConversation(
                          profile.requestedBy!.id,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Image.asset('assets/images/done.png', scale: 4),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        controller.rejectRequestForAvailable(
                          profile.requestedBy!.id!,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Image.asset('assets/images/cross.png', scale: 4),
                      ),
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
