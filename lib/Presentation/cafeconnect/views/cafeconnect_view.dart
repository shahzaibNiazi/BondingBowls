import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';
import '../../../data/model/cafeConnect_model.dart';
import '../../payment_system/views/payment_system_view.dart';
import '../controllers/cafeconnect_controller.dart';

class CafeConnectView extends GetView<CafeconnectController> {
  const CafeConnectView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CafeconnectController>(
      init: CafeconnectController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFEEDA),
          body: SafeArea(
            child: Column(
              children: [
                // ====== STATIC PART ======
                const SizedBox(height: 8),
                _buildHeader(context),
                const SizedBox(height: 8),

                // slideshow placeholder
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

                // filter + tags row
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => showFilterBottomSheet(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0xffBCBCBC)),
                          ),
                          child: SvgPicture.asset("assets/icon/svg/filter.svg"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: _SelectableTag(
                          text: "Hot",
                          isActive: controller.selectedTag == "Hot",
                          onTap: () => controller.selectTag("Hot"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: _SelectableTag(
                          text: "Deals",
                          isActive: controller.selectedTag == "Deals",
                          onTap: () => controller.selectTag("Deals"),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // ====== SCROLLABLE PART ======
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      // main hero card (static)
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/cup_coffee1.jpg",
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Find the perfect activities to enjoy with someone - feel free to explore LAST MINUTE events and spontaneous plans!",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff505050),
                                        height: 1.4,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                "Cafeconnect is available!",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff0022FF),
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icon/svg/timer.svg",
                                            ),
                                            const SizedBox(width: 5),
                                            Flexible(
                                              child: Text(
                                                "(7 days countdown)",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.cafeList.length,
                        itemBuilder: (context, index) {
                          CafeModel cafe = controller.cafeList[index];

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                Routes.MAKE_A_BOOKING,
                                arguments: {'cafe': cafe},
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xffBCBCBC),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none, // 🔥 VERY IMPORTANT

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        // Image container - Fixed width for consistency
                                        Stack(
                                          clipBehavior:
                                              Clip.hardEdge, // IMPORTANT
                                          children: [
                                            // IMAGE
                                            Container(
                                              width: 165,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  cafe.image ?? '',
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (_, __, ___) =>
                                                      Container(
                                                        color: Colors.grey[200],
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                          'No Image',
                                                        ),
                                                      ),
                                                ),
                                              ),
                                            ),

                                            // 🔴 CLEAN RIBBON (FIGMA MATCH)
                                            Positioned(
                                              top: 4,
                                              left: -25,
                                              child: Transform.rotate(
                                                angle:
                                                    -0.75, // correct Figma angle
                                                child: Container(
                                                  width:
                                                      90, // SHORT – important
                                                  height: 26,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: const Color(
                                                      0xFFE50914,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    border: Border.all(
                                                      color: const Color(
                                                        0xFFFFC107,
                                                      ),
                                                      width: 2,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withValues(
                                                              alpha: 0.25,
                                                            ),
                                                        blurRadius: 6,
                                                        offset: const Offset(
                                                          2,
                                                          3,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  child: Text(
                                                    '-${cafe.discountPercentage}%',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(width: 16),
                                        // Content - Flexible to adapt to remaining space
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Title + category
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      cafe.name ?? '',
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              // Rating row
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        cafe.reviews!.rating
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),

                                                      Row(
                                                        children: List.generate(5, (
                                                          index,
                                                        ) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  right: 2.0,
                                                                ),
                                                            child: SvgPicture.asset(
                                                              index < 4.8.floor()
                                                                  ? "assets/icon/svg/fav_fill.svg"
                                                                  : "assets/icon/svg/fav_.svg",
                                                              width: 8,
                                                              height: 8,
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ],
                                                  ),

                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/icon/svg/location2.svg",
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        cafe.location?.region ??
                                                            '',
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 13.sp,
                                                          color: Colors.grey,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 4,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          "assets/images/Rectangle 121.png",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      cafe.category ?? '',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Poppins",
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),

                                                  Image.asset(
                                                    "assets/images/dollar.png",
                                                  ),
                                                  // Text(
                                                  //   '\$${cafe.averagePrice}',
                                                  //   style: TextStyle(
                                                  //     fontSize: 14.sp,
                                                  //     fontFamily: "Poppins",
                                                  //     fontWeight:
                                                  //         FontWeight.w400,
                                                  //     color: Colors.black,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: _buildStatItem(
                                                      "assets/icon/svg/male.svg",
                                                      '10',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Flexible(
                                                    child: _buildStatItem(
                                                      "assets/icon/svg/female.svg",
                                                      '10',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Flexible(
                                                    child: _buildStatItem(
                                                      "assets/icon/svg/heart.svg",
                                                      '10',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Discount badge
                                  // Positioned(top: -8, left: -22, child: DiscountRibbon(text: '-10%')),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // if (controller.selectedTag == 'Hot') _hotContent(),
                      // if (controller.selectedTag == 'Deals') _dealsContent(),
                      const SizedBox(height: 20),
                      // horizontal restaurant scroller
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        height: 230,
                        decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              width: 160,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/images/cup_coffee1.jpg",
                                    ),
                                    height: 105,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Enjoy Up to 30% off deals for these restaurants!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    buildRestaurantCard(
                                      "assets/images/star_nbucks.png",
                                      "StarBucks",
                                      "assets/images/banner.png",
                                    ),
                                    buildRestaurantCard(
                                      "assets/images/star_nbucks.png",
                                      "StarBucks",
                                      "assets/images/banner.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
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

Widget _buildHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.BOOKING_DETAILS);
          },
          icon: SvgPicture.asset("assets/icon/svg/calender.svg"),
        ),
        Flexible(
          child: Text(
            "Cafeconnect",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentSystemView()),
                );
              },
              child: SvgPicture.asset(
                "assets/icon/svg/bowl.svg",
                height: 33,
                width: 33,
              ),
            ),
            Text(
              "300",
              style: TextStyle(
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

/// -----------------------------
/// Helper widget: Restaurant horizontal card
/// -----------------------------
Widget buildRestaurantCard(String image, String name, String banner) {
  return Row(
    children: [
      Container(width: 1, height: 200, color: const Color(0xff000000)),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: -2,
                  left: -2,
                  child: Image.asset(banner, height: 41, width: 41),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEE706B),
                minimumSize: const Size(120, 30),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xffBCBCBC)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Food",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

/// -----------------------------
/// CafeCardWidget (self-contained)
/// -----------------------------
class CafeCardWidget extends StatelessWidget {
  final String discountimageAsset;
  final String imageAsset;
  final String title;
  final double rating;
  final String location;
  final String priceLevel;
  final String categoryText;
  final String categoryBgImage;
  final String maleCount;
  final String femaleCount;
  final String heartCount;
  final String maleSvg;
  final void Function()? onTap;
  final String femaleSvg;
  final String heartSvg;

  const CafeCardWidget({
    super.key,
    required this.discountimageAsset,
    required this.imageAsset,
    required this.title,
    required this.onTap,
    required this.rating,
    required this.location,
    required this.priceLevel,
    required this.categoryText,
    required this.categoryBgImage,
    required this.maleCount,
    required this.femaleCount,
    required this.heartCount,
    required this.maleSvg,
    required this.femaleSvg,
    required this.heartSvg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffBCBCBC), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none, // 🔥 VERY IMPORTANT

          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Image container - Fixed width for consistency
                  Container(
                    width: 165,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Content - Flexible to adapt to remaining space
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + category
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Rating row
                        Row(
                          children: [
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Row(
                                children: List.generate(5, (index) {
                                  // show filled star if index < floor(rating)
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: SvgPicture.asset(
                                      index < rating.floor()
                                          ? "assets/icon/svg/fav_fill.svg"
                                          : "assets/icon/svg/fav_.svg",
                                      width: 12,
                                      height: 12,
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Text(
                              priceLevel,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icon/svg/location2.svg"),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                location,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(categoryBgImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Text(
                                categoryText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Flexible(child: _buildStatItem(maleSvg, maleCount)),
                            const SizedBox(width: 16),
                            Flexible(
                              child: _buildStatItem(femaleSvg, femaleCount),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              child: _buildStatItem(heartSvg, heartCount),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Discount badge
            // Positioned(top: -8, left: -22, child: DiscountRibbon(text: '-10%')),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String svg, String count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(svg),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            count,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

Widget _buildStatItem(String svg, String count) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(svg),
      const SizedBox(width: 4),
      Flexible(
        child: Text(
          count,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

/// -----------------------------
/// Selectable Tag widget
/// -----------------------------
class _SelectableTag extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const _SelectableTag({
    required this.text,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        splashColor: Colors.grey.withValues(alpha: 0.2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2E5BFF) : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive
                  ? const Color(0xFF2E5BFF)
                  : const Color(0xffBCBCBC),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 6.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// -----------------------------
/// Filter BottomSheet
/// -----------------------------
void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext ctx) {
      return const FilterBottomSheet();
    },
  ).then((selectedFilters) {
    if (selectedFilters != null) {
      log('Selected locations: $selectedFilters');
      // handle selected filters if needed
    }
  });
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // allow multiple selection in this example
  Set<String> selectedLocations = <String>{};

  // single-select examples
  String selectedLocation = "South";
  String selectedCategory = "Beverages";

  @override
  Widget build(BuildContext context) {
    // ensure sheet height uses content + keyboard
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color.fromARGB(204, 0, 0, 0), width: 2),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 5, 24, 8),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 8,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icon/svg/cross.svg",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 8,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, {
                        'location': selectedLocation,
                        'category': selectedCategory,
                      });
                      Get.find<CafeconnectController>().clearFilter();
                    },
                    child: Text(
                      'clear all',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromARGB(255, 0, 0, 0),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),
          const Text('(Can select multiple options for all)'),
          const SizedBox(height: 12),

          // Location label
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                SvgPicture.asset("assets/icon/svg/location3.svg"),
                const SizedBox(width: 8),
                Text(
                  'location',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // location options (single-select in this example)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                buildSelectableOption("North", selectedLocation, (val) {
                  setState(() => selectedLocation = val);
                }),
                buildSelectableOption("South", selectedLocation, (val) {
                  setState(() => selectedLocation = val);
                }),
                buildSelectableOption("East", selectedLocation, (val) {
                  setState(() => selectedLocation = val);
                }),
                buildSelectableOption("West", selectedLocation, (val) {
                  setState(() => selectedLocation = val);
                }),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Looking for
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                SizedBox(width: 8),
                Text(
                  '👀 Looking For',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                buildSelectableOption("Food", selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),
                buildSelectableOption("Beverages", selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),
                buildSelectableOption("Event", selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Save button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context, {
                  'location': selectedLocation,
                  'category': selectedCategory,
                });

                Get.find<CafeconnectController>().selectFilter(
                  selectedLocation,
                  selectedCategory,
                );
                // return chosen filter set (as example return locations & category)
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xff003FFF)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Save',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

Widget buildSelectableOption(
  String text,
  String selectedValue,
  Function(String) onTap,
) {
  bool isSelected = text == selectedValue;
  return GestureDetector(
    onTap: () => onTap(text),
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[800] : Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16.sp,
        ),
      ),
    ),
  );
}
