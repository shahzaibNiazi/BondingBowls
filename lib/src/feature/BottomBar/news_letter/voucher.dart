import 'dart:developer';

import 'package:convo_hearts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../settings/notification.dart';

class VouchersOffersScreen extends StatefulWidget {
  const VouchersOffersScreen({super.key});

  @override
  State<VouchersOffersScreen> createState() => _VouchersOffersScreenState();
}

class _VouchersOffersScreenState extends State<VouchersOffersScreen> {
  String currentSort = 'Recent (Default)';

  void _showSortBottomSheet() {
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(104, 0, 0, 0),
      builder: (BuildContext context) {
        return const SortBottomSheet();
      },
    ).then((selectedSort) {
      if (selectedSort != null) {
        setState(() {
          currentSort = selectedSort;
        });
        log('Selected sort: $selectedSort');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            SizedBox(
              height: 60,
              child: Stack(
                children: [
                  // Back button positioned on the left
                  Positioned(
                    left: 10,
                    top: 10,
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
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Vouchers  Offers',
                        style: TextStyle(
                          fontFamily: "Playfair",
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
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
                margin: EdgeInsets.all(10),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(187, 161, 5, 135)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filter/Sort header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffD9D9D9),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color: Colors.black.withValues(alpha: 0.25),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text("0"),
                                Text("voucher used this month"),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _showSortBottomSheet();
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/filter.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Scrollable content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VoucherCard(
                              title: "20% off on all Macdonald's item",
                              discount: "20% OFF!",
                              badge: "10 left!",
                              expiryText: "Expiring soon! Use by 7 Dec 2025",
                            ),

                            VoucherCard(
                              title: "Get \$5 off your next purchase!",
                              discount: "\$5 OFF!",
                              badge: "10 left!",
                              expiryText: "Use by 7 Mar 2026",
                            ),
                            VoucherCard(
                              title: "Get \$5 off your next purchase!",
                              discount: "\$5 OFF!",
                              badge: "10 left!",
                              expiryText: "Use by 7 Mar 2026",
                            ),
                            VoucherCard(
                              title: "Get \$5 off your next purchase!",
                              discount: "\$5 OFF!",
                              badge: "10 left!",
                              expiryText: "Use by 7 Mar 2026",
                            ),
                            VoucherCard(
                              title: "Get \$5 off your next purchase!",
                              discount: "\$5 OFF!",
                              badge: "10 left!",
                              expiryText: "Use by 7 Mar 2026",
                            ),

                            Container(
                              height: 155,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff000000)),
                              ),
                              child: Center(child: Text("Static Ads")),
                            ),

                            VoucherCard(
                              title: "Get \$5 off your next purchase!",
                              discount: "\$5 OFF!",
                              badge: "10 left!",
                              expiryText: "Use by 7 Mar 2026",
                            ),
                            VoucherCard(
                              title: "Get \$5 off your next purchase!",
                              discount: "\$5 OFF!",
                              badge: "10 left!",
                              expiryText: "Use by 7 Mar 2026",
                            ),

                            VoucherCard(
                              title:
                                  "Spend \$30 in a single receipt and get 10% off!",
                              discount: "10% OFF!",
                              badge: "10 left!",
                              expiryText: "Expiring soon! Use by 9 Dec 2025",
                            ),

                            VoucherCard(
                              title:
                                  "Buy any coffee/latte and get one free drink on us!",
                              discount: "Buy 1 get 1 Free!",
                              badge: "10 left!",
                              expiryText: "Expiring soon! Use by 1 Dec 2025",
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
}

// class VoucherCard extends StatelessWidget {
//   final String title;
//   final String discount;
//   final String badge;
//   final String expiryText;
//   final String buttonText;
//   final Color badgeColor;
//   final Color buttonBorderColor;
//   final Color buttonTextColor;
//   final Color expiryTextColor;
//   final bool isExpired;

//   const VoucherCard({
//     Key? key,
//     required this.title,
//     required this.discount,
//     required this.badge,
//     required this.expiryText,
//     this.buttonText = 'Redeem',
//     this.badgeColor = const Color(0xFFAF0000),
//     this.buttonBorderColor = const Color(0xffFB0000),
//     this.buttonTextColor = Colors.red,
//     this.expiryTextColor = const Color(0xff003366),
//     this.isExpired = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: ,
//       margin: const EdgeInsets.all(20),
//       child: Stack(
//         children: [
//           // Main card container
//           Container(
//             height: 110,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//             decoration: BoxDecoration(
//               color: const Color(0xFFE8E8E8),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey[300]!, width: 1),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Middle row with discount and badge
//                 Row(
//                   children: [
//                     // Voucher icon
//                     Container(
//                       width: 20,
//                       height: 20,
//                       child: SvgPicture.asset("assets/icon/svg/voucher.svg"),
//                     ),

//                     const SizedBox(width: 12),

//                     // Title and discount text
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             title,
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.grey[600],
//                             ),
//                           ),

//                           Row(
//                             children: [
//                               Text(
//                                 discount,
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.black,
//                                 ),
//                               ),

//                               const SizedBox(width: 10),

//                               // Badge
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 2,
//                                   vertical: 1,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: isExpired ? Colors.grey : badgeColor,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: Text(
//                                   badge,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 // const SizedBox(height: 12),

//                 // Divider line
//                 Container(
//                   width: double.infinity,
//                   height: 1,
//                   decoration: const BoxDecoration(
//                     color: Colors.grey,
//                   ),
//                 ),

//                 SizedBox(height: 5,),

//                 // Bottom row with expiry and redeem button
//                 Row(
//                   children: [
//                     // Timer icon and expiry text
//                     SvgPicture.asset("assets/icon/svg/timer.svg",
//                     height: 13,
//                     width: 13,
//                     ),
//                     const SizedBox(width: 6),
//                     Expanded(
//                       child: Text(
//                         expiryText,
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: isExpired ? Colors.red : expiryTextColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),

//                     // Redeem button
//                     Container(
//                       height: 30,
//                       width: 92,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: isExpired ? Colors.grey[300] : Colors.white,
//                         border: Border.all(
//                           color: isExpired ? Colors.grey : buttonBorderColor,
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Center(
//                         child: Text(
//                           isExpired ? 'Expired' : buttonText,
//                           style: TextStyle(
//                             color: isExpired ? Colors.grey : buttonTextColor,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Left semi-circle cutout
//           Positioned(
//             left: 0,
//             top: 0,
//             bottom: -25,
//             child: Center(
//               child: Container(
//                 height: 30,
//                 width: 15,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Right semi-circle cutout
//           Positioned(
//             right: 0,
//             top: 0,
//             bottom: -25,
//             child: Center(
//               child: Container(
//                 height: 30,
//                 width: 15,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Info icon
//           Positioned(
//             top: 10,
//             right: 10,
//             child: SvgPicture.asset("assets/icon/svg/info1.svg"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class VoucherCard extends StatelessWidget {
  final String title;
  final String discount;
  final String badge;
  final String expiryText;
  final String buttonText;
  final Color badgeColor;
  final Color buttonBorderColor;
  final Color buttonTextColor;
  final Color expiryTextColor;
  final bool isExpired;

  const VoucherCard({
    Key? key,
    required this.title,
    required this.discount,
    required this.badge,
    required this.expiryText,
    this.buttonText = 'Redeem',
    this.badgeColor = const Color(0xFFAF0000),
    this.buttonBorderColor = const Color(0xffFB0000),
    this.buttonTextColor = Colors.red,
    this.expiryTextColor = const Color(0xff003366),
    this.isExpired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Stack(
        children: [
          // Main card containerXX
          Container(
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E8E8),

              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Middle row with discount and badge
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      // Voucher icon
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset("assets/icon/svg/voucher.svg"),
                      ),

                      const SizedBox(width: 12),

                      // Title and discount text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    discount,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                // Badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isExpired ? Colors.grey : badgeColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    badge,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
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

                // Divider line
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),

                const SizedBox(height: 5),

                // Bottom row with expiry and redeem button
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      // Timer icon and expiry text
                      SvgPicture.asset(
                        "assets/icon/svg/timer.svg",
                        height: 13,
                        width: 13,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          expiryText,
                          style: TextStyle(
                            fontSize: 10,
                            color: isExpired ? Colors.red : expiryTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Redeem button
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REDEEM);
                        },
                        child: Container(
                          height: 30,
                          width: 92,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isExpired ? Colors.grey[300] : Colors.white,
                            border: Border.all(
                              color: isExpired
                                  ? Colors.grey
                                  : buttonBorderColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              isExpired ? 'Expired' : buttonText,
                              style: TextStyle(
                                color: isExpired
                                    ? Colors.grey
                                    : buttonTextColor,
                                fontSize: 12,
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
          ),

          // Left semi-circle cutout
          Positioned(
            left: 0,
            top: 0,
            bottom: -25,
            child: Center(
              child: Container(
                height: 30,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),

          // Right semi-circle cutout
          Positioned(
            right: 0,
            top: 0,
            bottom: -25,
            child: Center(
              child: Container(
                height: 30,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),

          // Info icon
          Positioned(
            top: 10,
            right: 10,
            child: SvgPicture.asset("assets/icon/svg/info1.svg"),
          ),
        ],
      ),
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  String selectedOption = 'Recent (Default)';

  final List<String> sortOptions = [
    'Recent (Default)',
    'Expiring First',
    'Expiring Last',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  'Sort by',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                // Divider line
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 119, 118, 118),
                ),

                const SizedBox(height: 24),

                // Sort options
                ...sortOptions
                    .map(
                      (option) => Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              option,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = option;
                                });
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedOption == option
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : Colors.grey[400]!,
                                    width: 2,
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: selectedOption == option
                                    ? Container(
                                        margin: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),

                const SizedBox(height: 24),

                // Apply button
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, selectedOption);
                    },
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xff003FFF)),
                      ),
                      child: const Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0),
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
