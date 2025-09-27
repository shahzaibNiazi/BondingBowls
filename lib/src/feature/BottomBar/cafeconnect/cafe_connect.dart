import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../settings/notification.dart';
import '../../settings/settings.dart';

class CafeConnect extends StatefulWidget {
  const CafeConnect({super.key});

  @override
  State<CafeConnect> createState() => _CafeConnectState();
}

class _CafeConnectState extends State<CafeConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top half - darker peach
            Container(
              color: const Color(0xFFFFEEDA),
              child: SafeArea(
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
                                  builder: (context) => NotificationScreen(),
                                ),
                              );
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/calender.svg",
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Cafeconnect",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Playfair",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SettingsScreen(),
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  "assets/icon/svg/bowl.svg",
                                  height: 33,
                                  width: 33,
                                ),
                              ),
                              Text(
                                "300",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Slideshow ads space banner
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      child: const Center(
                        child: Text(
                          '~Slideshow Ads Space',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showFilterBottomSheet(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color(0xffBCBCBC),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icon/svg/filter.svg",
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color(0xffBCBCBC),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.08),
                                        blurRadius: 8.0,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Hot",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color(0xffBCBCBC),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.08),
                                        blurRadius: 8.0,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Deals",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/cup_coffee1.jpg",
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Find the perfect activities to enjoy with someone - feel free to explore LAST MINUTE events and spontaneous plans!",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff505050),
                                          height: 1.4,
                                        ),
                                      ),
                                      SizedBox(height: 10),
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
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff0022FF),
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: Color(
                                                      0xff0022FF,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icon/svg/timer.svg",
                                              ),
                                              SizedBox(width: 5),
                                              Flexible(
                                                child: Text(
                                                  "(7 days countdown)",
                                                  style: TextStyle(
                                                    fontSize: 13,
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

                        // Card List
                        Column(
                          children: [
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/food.png",
                              title: "Macdonald's",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Food",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/star_nbucks.png",
                              title: "StarBucks",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Beverages",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/food.png",
                              title: "Macdonald's",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Food",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/star_nbucks.png",
                              title: "StarBucks",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Beverages",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/food.png",
                              title: "Macdonald's",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Food",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),

                            SizedBox(height: 20),

                            Container(
                              margin: EdgeInsets.only(left: 15),
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                              child: Row(
                                children: [
                                  // Left side (coffee cup + text)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: 160,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/cup_coffee1.jpg",
                                          height: 105,
                                          width: 100,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Enjoy Up to 30% off deals for these restaurants!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Right side (scrollable restaurant cards)
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

                            SizedBox(height: 20),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/food.png",
                              title: "Macdonald's",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Food",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/star_nbucks.png",
                              title: "StarBucks",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Beverages",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),                            
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/food.png",
                              title: "Macdonald's",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Food",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),
                            SizedBox(height: 2),
                            CafeCardWidget(
                              discountimageAsset: "assets/images/banner.png",
                              imageAsset: "assets/images/star_nbucks.png",
                              title: "StarBucks",
                              rating: 4.8,
                              location: "North",
                              priceLevel: "\$\$\$",
                              categoryText: "Beverages",
                              categoryBgImage:
                                  "assets/images/Rectangle 121.png",
                              maleCount: "10",
                              femaleCount: "10",
                              heartCount: "10",
                              maleSvg: "assets/icon/svg/male.svg",
                              femaleSvg: "assets/icon/svg/female.svg",
                              heartSvg: "assets/icon/svg/female.svg",
                            ),

                            SizedBox(height: 80),
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
    );
  }
}

Widget buildRestaurantCard(String image, String name, String banner) {
  return Row(
    children: [
      Container(width: 1, height: 200, color: Color(0xff000000)),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.3),
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
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
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffEE706B),
                minimumSize: Size(120, 20),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffBCBCBC)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Food",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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

// Widget _buildStatItem(String svg, String count) {
//   return Row(
//     children: [
//       SvgPicture.asset(svg),
//       const SizedBox(width: 4),
//       Text(
//         count,
//         style: const TextStyle(
//           fontSize: 12,
//           color: Colors.grey,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ],
//   );
// }

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
  final String femaleSvg;
  final String heartSvg;

  const CafeCardWidget({
    super.key,
    required this.discountimageAsset,
    required this.imageAsset,
    required this.title,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffBCBCBC), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(categoryBgImage),
                              ),
                            ),
                            child: Text(
                              categoryText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          // Rating stars
                          Flexible(
                            child: Row(
                              children: List.generate(5, (index) {
                                return SvgPicture.asset(
                                  index < rating.floor()
                                      ? "assets/icon/svg/fav_fill.svg"
                                      : "assets/icon/svg/fav_.svg",
                                  width: 16,
                                  height: 16,
                                );
                              }),
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

                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            priceLevel,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
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
                          Flexible(child: _buildStatItem(heartSvg, heartCount)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Discount badge
          Positioned(
            top: 15,
            left: 13,
            child: Container(
              height: 55,
              width: 55,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(discountimageAsset),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
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
            style: const TextStyle(
              fontSize: 12,
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

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Set<String> selectedLocations = <String>{};

  String selectedLocation = "South"; // default selected
  String selectedCategory = "Beverages"; // default selected

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color.fromARGB(204, 0, 0, 0), width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 5, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 25,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: SvgPicture.asset(
                            "assets/icon/svg/cross.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),

                      // Clear all button positioned on the right
                      Positioned(
                        right: 10,
                        top: 20,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLocations.clear();
                            });
                          },
                          child: const Text(
                            'clear all',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      // Title centered
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Filter',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // Subtitle
                Center(
                  child: Text(
                    '(Can select multiple options for all)',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ),

                const SizedBox(height: 16),

                // Location section
                Row(
                  children: [
                    SvgPicture.asset("assets/icon/svg/location3.svg"),
                    const SizedBox(width: 8),
                    const Text(
                      'location',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Location options
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

                const SizedBox(height: 24),

                Row(
                  children: [
                    // SvgPicture.asset("assets/icon/svg/location3.svg"),
                    const SizedBox(width: 8),
                    const Text(
                      '👀 Looking For',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Location options
                buildSelectableOption("Food", selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),
                buildSelectableOption("Beverages", selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),
                buildSelectableOption("Event", selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),

                const SizedBox(height: 24),

                // Save button
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, selectedLocations);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xff003FFF)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Save',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[800] : Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    builder: (BuildContext context) {
      return const FilterBottomSheet();
    },
  ).then((selectedFilters) {
    if (selectedFilters != null) {
      // Handle the selected filters
      log('Selected locations: $selectedFilters');
    }
  });
}
