import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/utils/utils.dart';
import '../../../src/feature/settings/notification.dart';
import '../controllers/vouchers_controller.dart';
import '../widgets/voucher_card.dart';

class VouchersView extends GetView<VouchersController> {
  const VouchersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VouchersController>(
      init: VouchersController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFEEDA),
          body: SafeArea(
            child: Column(
              children: [
                // Header Section
                SizedBox(
                  height: 60.h,
                  child: Stack(
                    children: [
                      // Back button positioned on the left
                      Positioned(
                        left: 10.w,
                        top: 10.h,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            "assets/icon/svg/notification.svg",
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          ),
                        ),
                      ),
                      // Title centered
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Text(
                            'Vouchers & Offers',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Content Container
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8.w),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromARGB(187, 161, 5, 135),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Filter/Sort header
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: SvgPicture.asset(
                                  "assets/icon/svg/back_arrow.svg",
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Color(0xffD9D9D9),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4.h),
                                      blurRadius: 4.r,
                                      spreadRadius: 0,
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    if (controller.vouchers.isNotEmpty)
                                      Text(
                                        controller
                                            .vouchers
                                            .first
                                            .currentUsageCount
                                            .toString(),
                                      ),
                                    Text("voucher used this month"),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.showSortBottomSheet();
                                },
                                icon: SvgPicture.asset(
                                  "assets/icon/svg/filter.svg",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Scrollable content
                        Obx(
                          () => controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : controller.vouchers.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        controller.vouchers.length +
                                        1, // +1 for static ads
                                    itemBuilder: (context, index) {
                                      // Show static ads AFTER index 3
                                      if (index == 3) {
                                        return Container(
                                          height: 155.h,
                                          margin: EdgeInsets.symmetric(
                                            vertical: 12.h,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text("Static Ads"),
                                          ),
                                        );
                                      }

                                      // Adjust index after ads insertion
                                      final voucherIndex = index > 3
                                          ? index - 1
                                          : index;
                                      final voucher =
                                          controller.vouchers[voucherIndex];

                                      return VoucherCard(
                                        id: voucher.id ?? "",
                                        title: voucher.title ?? '',
                                        discount: voucher.discountValue
                                            .toString(),
                                        badge: Utils.daysDifference(
                                          voucher.startDate ?? '',
                                          voucher.expiryDate ?? '',
                                        ).toString(),
                                        expiryText: Utils.formatDate(
                                          voucher.expiryDate ?? '',
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
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
}
