// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// class SkeletonizerData extends StatelessWidget {
//   final bool isEnabled;
//   final Widget? child;
//   const SkeletonizerData({super.key, required this.isEnabled, this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: isEnabled,
//       ignorePointers: true,
//       child: child ??
//           ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               // Generate a random width for each item based on index
//               final randomWidth = Random(index).nextInt(100) + 10; // Generates a random width between 10 and 100
//
//               return Skeleton.shade(
//                 child: Card(
//                   child: SizedBox(
//                     height: 50,
//                     width: randomWidth.toDouble(),
//                   ),
//                 ),
//               );
//             },
//           ),
//     );
//   }
// }
