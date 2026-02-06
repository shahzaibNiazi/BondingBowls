// import 'package:convo_hearts/src/feature/BottomBar/news_letter/voucher.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../settings/notification.dart';
// import 'detail_page.dart';
//
// class NewsletterScreen extends StatefulWidget {
//   const NewsletterScreen({super.key});
//
//   @override
//   State<NewsletterScreen> createState() => _NewsletterScreenState();
// }
//
// class _NewsletterScreenState extends State<NewsletterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // ================= TOP FIXED AREA =================
//           Container(
//             color: const Color(0xFFFFEEDA),
//             child: SafeArea(
//               bottom: false,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => NotificationScreen(),
//                               ),
//                             );
//                           },
//                           icon: SvgPicture.asset(
//                             "assets/icon/svg/notification.svg",
//                           ),
//                         ),
//                         Text(
//                           "NewsLetter",
//                           style: TextStyle(
//                             fontSize: 24.sp,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => VouchersOffersScreen(),
//                               ),
//                             );
//                           },
//                           icon: SvgPicture.asset(
//                             "assets/icon/svg/news_letter_svg.svg",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Banner fixed
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 30),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.grey[400]!),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         '~Slideshow Ads Space',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontStyle: FontStyle.italic,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           // ============= BOTTOM SCROLL AREA =============
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//               ),
//
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//
//                     // FOOD
//                     _buildSectionHeader("Food", () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DetailsScreen(title: "Food"),
//                         ),
//                       );
//                     }),
//                     _buildHorizontalList(),
//                     const SizedBox(height: 20),
//                     _buildHorizontalList(),
//
//                     // BEVERAGES
//                     _buildSectionHeader("Beverages", () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DetailsScreen(title: "Beverages"),
//                         ),
//                       );
//                     }),
//                     _buildHorizontalList(),
//                     const SizedBox(height: 20),
//                     _buildHorizontalList(),
//
//                     // EVENTS
//                     _buildSectionHeader("Events", () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DetailsScreen(title: "Event"),
//                         ),
//                       );
//                     }),
//                     _buildHorizontalList(),
//                     const SizedBox(height: 20),
//                     _buildHorizontalList(),
//
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // =================== SECTION HEADER =====================
//   Widget _buildSectionHeader(String title, VoidCallback? onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/Rectangle 121.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//
//           GestureDetector(
//             onTap: onTap,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: const Color(0xff3F6EFF),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: const Text(
//                 "See more",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ================= HORIZONTAL LIST =====================
//   Widget _buildHorizontalList() {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: 6,
//         itemBuilder: (_, index) => _buildCard(),
//       ),
//     );
//   }
//
//   // =================== CARD ======================
//   Widget _buildCard() {
//     return Container(
//       width: 140,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 100,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/food.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Text(
//                       "Click for surprise!",
//                       style: TextStyle(fontSize: 10),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     "MacDonalds",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Best western food in the west?",
//                     textAlign: TextAlign.center,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
