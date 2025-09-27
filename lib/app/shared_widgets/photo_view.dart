// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'appbar_custom.dart';
//
//
// class CustomPhotoView extends StatelessWidget {
//   final String imageUrl;
//   final bool isNetwork;
//
//   const CustomPhotoView({
//     super.key,
//     required this.imageUrl,
//     this.isNetwork = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black.withOpacity(0.8),
//       appBar: AppBarCustom(
//         title: "",
//         onLeadingPressed: () {
//           Get.back();
//         },
//       ),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.of(context).pop();
//         },
//         child: Center(
//           child: PhotoView(
//             imageProvider: isNetwork
//                 ? NetworkImage(imageUrl)
//                 : AssetImage(imageUrl) as ImageProvider,
//
//           ),
//         ),
//       ),
//     );
//   }
// }
