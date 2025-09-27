// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../config/app_colors.dart';
//
// class CarouselImages extends StatelessWidget {
//   final PageController pageController;
//   const CarouselImages({
//     super.key,
//     required this.banners,
//     required this.pageController,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 96,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColors.trans,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         children: [
//           SizedBox(
//             height: 96,
//             child: PageView(
//               controller: pageController,
//               scrollDirection: Axis.horizontal,
//               children: List.generate(
//                 banners.length,
//                 (index) => Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       banners[index].image ?? '',
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         }
//                         return Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                       (loadingProgress.expectedTotalBytes ?? 1)
//                                 : null,
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           color: Colors.grey[300],
//                           child: Center(
//                             child: Icon(
//                               Icons.broken_image,
//                               color: Colors.grey,
//                               size: 40,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ).toList(),
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             left: (Get.width / 2.4),
//             child: Visibility(
//               visible: banners.isNotEmpty,
//               child: SmoothPageIndicator(
//                 controller: pageController,
//                 count: banners.length,
//                 effect: WormEffect(
//                   spacing: 2,
//                   dotWidth: 5.0,
//                   dotHeight: 5.0,
//                   radius: 4,
//                   activeDotColor: AppColors.white,
//                   dotColor: Colors.white.withOpacity(0.4),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
