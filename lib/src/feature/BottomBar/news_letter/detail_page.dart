import 'dart:developer';

import 'package:convo_hearts/src/feature/BottomBar/news_letter/voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../settings/notification.dart';
import '../bottom_bar.dart';
import 'hotel_details.dart';

// Modified DetailsScreen to work with BottomNavBar
class DetailsScreen extends StatefulWidget {
  final bool showAsFullScreen;
  final String? title;
  const DetailsScreen({super.key, this.showAsFullScreen = true, this.title});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // If showing as full screen, wrap with BottomNavBar
    if (widget.showAsFullScreen) {
      return DetailsScreenWithBottomNav();
    }

    // Otherwise return the original content
    return _buildDetailsContent(context);
  }

  Widget _buildDetailsContent(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section with Newsletter header
            Container(
              decoration: BoxDecoration(color: const Color(0xFFFFEEDA)),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VouchersOffersScreen(),
                                ),
                              );
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/news_letter_svg.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Food List Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border.all(color: Color(0xffdd80b8)),
                ),
                child: Column(
                  children: [
                    // Header with back button and Food title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                );
                              },
                            ),
                          ),
                          Text(
                            widget.title ?? "Food",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xffEE706B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showFilterBottomSheet(context);
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/filter.svg",
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.tune,
                                  color: Colors.black,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Scrollable content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Food items list
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 0,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return _buildFoodListItem(index);
                              },
                            ),

                            // Static ads section at bottom
                            Container(
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.symmetric(vertical: 80),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "static ads",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 0,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return _buildFoodListItem(index);
                              },
                            ),
                          ],
                        ),
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
  }

  Widget _buildFoodListItem(int index) {
    return InkWell(
      onTap: () {
        // Navigate to HotelDetailScreen with BottomNavBar
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreenWithBottomNav(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Food image
            Container(
              height: 120,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage("assets/images/food.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Food details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MacDonalds",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icon/svg/share_loc.svg"),
                      const SizedBox(width: 4),
                      const Text(
                        "west",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Best western food in the west?",
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff9f8f8),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff333333)),
                    ),
                    child: const Text(
                      "Click for surprise!",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Wrapper class that shows DetailsScreen with BottomNavBar
class DetailsScreenWithBottomNav extends StatefulWidget {
  const DetailsScreenWithBottomNav({super.key});

  @override
  State<DetailsScreenWithBottomNav> createState() =>
      _DetailsScreenWithBottomNavState();
}

class _DetailsScreenWithBottomNavState
    extends State<DetailsScreenWithBottomNav> {
  int currentIndex = 1; // Keep it on Newsletter tab since we came from there

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: const DetailsScreen(showAsFullScreen: false),
      bottomNavigationBar: CurvedBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            return;
          }

          setState(() {
            currentIndex = index;
          });

          Navigator.pop(context);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBar(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}

// New wrapper for HotelDetailScreen with BottomNavBar
class HotelDetailScreenWithBottomNav extends StatefulWidget {
  const HotelDetailScreenWithBottomNav({super.key});

  @override
  State<HotelDetailScreenWithBottomNav> createState() =>
      _HotelDetailScreenWithBottomNavState();
}

class _HotelDetailScreenWithBottomNavState
    extends State<HotelDetailScreenWithBottomNav> {
  int currentIndex = 1; // Keep it on Newsletter tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: HotelDetailScreen(),
      bottomNavigationBar: CurvedBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            return;
          }

          setState(() {
            currentIndex = index;
          });

          // Pop current screen and navigate to selected tab
          Navigator.pop(context);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBar(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Set<String> selectedLocations = <String>{};

  final List<String> locations = ['North', 'South', 'East', 'West', 'Central'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 5, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      // Clear all button positioned on the right
                      Positioned(
                        right: 10,
                        top: 16,
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
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
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
                    SvgPicture.asset("assets/icon/svg/share_loc.svg"),
                    const SizedBox(width: 8),
                    const Text(
                      'location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Location options
                ...locations.map(
                  (location) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedLocations.contains(location)) {
                                selectedLocations.remove(location);
                              } else {
                                selectedLocations.add(location);
                              }
                            });
                          },
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                width: 2,
                              ),
                              color: Colors.transparent,
                            ),
                            child: selectedLocations.contains(location)
                                ? Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

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

// Usage: How to show the bottom sheet
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
