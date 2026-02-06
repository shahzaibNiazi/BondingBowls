import 'package:convo_hearts/app/routes/app_pages.dart';
import 'package:convo_hearts/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/model/newsletter_model.dart';
import '../../../src/feature/BottomBar/news_letter/detail_page.dart';
import '../../../src/feature/settings/notification.dart';
import '../controllers/newsletter_controller.dart';

class NewsletterView extends GetView<NewsletterController> {
  const NewsletterView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsletterController>(
      init: NewsletterController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              // ================= TOP FIXED AREA =================
              Container(
                color: const Color(0xFFFFEEDA),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => NotificationScreen(),
                                  ),
                                );
                              },
                              icon: SvgPicture.asset(
                                "assets/icon/svg/notification.svg",
                              ),
                            ),
                            Text(
                              "NewsLetter",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.VOUCHERS);
                              },
                              icon: SvgPicture.asset(
                                "assets/icon/svg/news_letter_svg.svg",
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Banner fixed
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                        child: Center(
                          child: Text(
                            '~Slideshow Ads Space',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ============= BOTTOM SCROLL AREA =============
              Obx(
                () => controller.isLoading.value
                    ? Padding(
                        padding: EdgeInsets.only(top: Get.height / 5),
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),

                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),

                                // FOOD
                                if (controller.foodItems.isNotEmpty &&
                                    controller.foodItems.length > 4)
                                  _buildSectionHeader("Food", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                          items: controller.beveragesItems,
                                          showAsFullScreen: false,
                                          title: "Food",
                                        ),
                                      ),
                                    );
                                  }),
                                _buildHorizontalList(
                                  items: controller.foodItems,
                                ),
                                SizedBox(height: 20.h),

                                // BEVERAGES
                                if (controller.foodItems.isNotEmpty &&
                                    controller.beveragesItems.length > 4)
                                  _buildSectionHeader("Beverages", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                          items: controller.beveragesItems,
                                          showAsFullScreen: false,
                                          title: "Beverages",
                                        ),
                                      ),
                                    );
                                  }),
                                _buildHorizontalList(
                                  items: controller.beveragesItems,
                                ),
                                SizedBox(height: 20.h),

                                // EVENTS
                                if (controller.foodItems.isNotEmpty &&
                                    controller.eventsItems.length > 4)
                                  _buildSectionHeader("Events", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                          items: controller.eventsItems,
                                          showAsFullScreen: false,

                                          title: "Event",
                                        ),
                                      ),
                                    );
                                  }),
                                _buildHorizontalList(
                                  items: controller.eventsItems,
                                ),
                                SizedBox(height: 50.h),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  // =================== SECTION HEADER =====================
  Widget _buildSectionHeader(String title, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Rectangle 121.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xff3F6EFF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "See more",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= HORIZONTAL LIST =====================
  Widget _buildHorizontalList({required List<Item> items}) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length > 4 ? 4 : items.length,
        itemBuilder: (_, index) {
          Item item = items[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.NEWSLETTER_DETAIL, arguments: {'item': item});

              // Navigator.push(
              //   Get.context!,
              //   MaterialPageRoute(
              //     builder: (context) => HotelDetailScreenWithBottomNav(),
              //   ),
              // );
            },
            child: Container(
              width: 140,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Utils.networkImage(url: item.displayImage),
                      Positioned(
                        top: 8,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Click for surprise!",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            item.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            item.secondaryText1 ?? '',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                            ),
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
      ),
    );
  }

  // =================== CARD ======================
}
