import 'package:convo_hearts/app/config/app_colors.dart';
import 'package:convo_hearts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/model/newsletter_model.dart';
import '../../settings/notification.dart';
import '../bottom_bar.dart';

// ------------------ DETAILS SCREEN ------------------
class DetailsScreen extends StatefulWidget {
  final bool showAsFullScreen;
  final String? title;
  final List<Item> items;

  const DetailsScreen({
    super.key,
    this.showAsFullScreen = true,
    this.title,
    required this.items,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late List<Item> _allItems;
  late List<Item> _filteredItems;
  String? _selectedLocation; // single selection filter

  @override
  void initState() {
    super.initState();
    _allItems = List<Item>.from(widget.items);
    _filteredItems = List<Item>.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showAsFullScreen) {
      return DetailsScreenWithBottomNav(items: widget.items);
    }
    return _buildDetailsContent(context);
  }

  Widget _buildDetailsContent(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA),
      body: SafeArea(
        child: Column(
          children: [
            /// ---------- TOP HEADER ----------
            Container(
              color: const Color(0xFFFFEEDA),
              child: Padding(
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
            ),

            /// ---------- CONTENT ----------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border.all(color: const Color(0xffdd80b8)),
                ),
                child: Column(
                  children: [
                    /// HEADER ROW
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          Text(
                            widget.title ?? '',
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: const Color(0xffEE706B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              // Show filter bottom sheet
                              final selected = await showFilterBottomSheet(
                                context,
                                initialSelected: _selectedLocation,
                              );

                              setState(() {
                                _selectedLocation = selected;

                                if (_selectedLocation == null) {
                                  _filteredItems = List<Item>.from(_allItems);
                                } else {
                                  _filteredItems = _allItems
                                      .where(
                                        (item) =>
                                            item.location == _selectedLocation,
                                      )
                                      .toList();
                                }
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/filter.svg",
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.tune),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// LIST
                    if (_filteredItems.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _filteredItems.length + 1,
                          itemBuilder: (context, index) {
                            final int adIndex = _filteredItems.length >= 3
                                ? 3
                                : _filteredItems.length;

                            if (index == adIndex) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 80,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "Static Ads",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final int foodIndex = index > adIndex
                                ? index - 1
                                : index;

                            return _buildFoodListItem(
                              foodIndex,
                              _filteredItems[foodIndex],
                            );
                          },
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

  Widget _buildFoodListItem(int index, Item item) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.NEWSLETTER_DETAIL, arguments: {'item': item});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.displayImage ?? '',
                height: 120,
                width: 160,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 120,
                  width: 160,
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
                        size: 48,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No Image',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icon/svg/share_loc.svg"),
                      const SizedBox(width: 4),
                      Text(
                        item.location ?? '',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.secondaryText1 ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp),
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

// ------------------ BOTTOM NAV WRAPPER ------------------
class DetailsScreenWithBottomNav extends StatelessWidget {
  final List<Item> items;

  const DetailsScreenWithBottomNav({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsScreen(showAsFullScreen: false, items: items),
      bottomNavigationBar: CurvedBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BottomNavBar(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}

// ------------------ FILTER BOTTOM SHEET ------------------
Future<String?> showFilterBottomSheet(
  BuildContext context, {
  String? initialSelected,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    builder: (_) => FilterBottomSheet(initialSelected: initialSelected),
  );
}

class FilterBottomSheet extends StatefulWidget {
  final String? initialSelected;

  const FilterBottomSheet({super.key, this.initialSelected});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedLocation;

  final List<String> locations = ['North', 'South', 'East', 'West', 'Central'];

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.initialSelected;
  }

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
          // Top handle
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 5, 24, 32),
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context, null),
                        child: Text(
                          'clear all',
                          style: TextStyle(
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),
                Text('(Select one option)', style: TextStyle(fontSize: 12.sp)),

                const SizedBox(height: 16),

                Row(
                  children: [
                    SvgPicture.asset("assets/icon/svg/share_loc.svg"),
                    const SizedBox(width: 8),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ...locations.map(
                  (location) => ListTile(
                    selectedColor: AppColors.black,
                    visualDensity: VisualDensity(vertical: -4),
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      location,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: location,
                      groupValue: selectedLocation,
                      onChanged: (value) {
                        setState(() {
                          selectedLocation = value;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        selectedLocation = location;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 24),

                InkWell(
                  onTap: () => Navigator.pop(context, selectedLocation),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
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
