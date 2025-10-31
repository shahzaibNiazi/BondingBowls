// import 'package:convo_hearts/verify-dating-profile/verify_manually2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'dart:io';
//
// import 'package:image_picker/image_picker.dart';
//
// class VerifyManullayScreen extends StatefulWidget {
//   @override
//   _VerifyAcreeManullayStaten createState() => _VerifyAcreeManullayStaten();
// }
//
// class _VerifyAcreeManullayStaten extends State<VerifyManullayScreen> {
//   File? _capturedImage;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _captureImage() async {
//     final XFile? image = await _picker.pickImage(
//       source: ImageSource.camera,
//       imageQuality: 80,
//     );
//
//     if (image != null) {
//       setState(() {
//         _capturedImage = File(image.path);
//       });
//     }
//   }
//
//   Future<void> _pickFromGallery() async {
//     final XFile? image = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//     );
//
//     if (image != null) {
//       setState(() {
//         _capturedImage = File(image.path);
//       });
//     }
//   }
//
//   void _removeImage() {
//     setState(() {
//       _capturedImage = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white,
//       //   elevation: 1,
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back, color: Colors.pink[500]),
//         //   onPressed: () => Navigator.pop(context),
//         // ),
//         // title: Text(
//         //   'Document Capture',
//         //   style: TextStyle(
//         //     color: Colors.pink[500],
//         //     fontSize: 20,
//         //     fontWeight: FontWeight.w600,
//         //   ),
//         // ),
//       // ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Row(
//                   children: [
//                     IconButton(
//                   icon: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
//                     onPressed: () => Navigator.pop(context),
//                     ),
//
//                     InkWell(onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyManullay2Screen()));
//                     },
//                       child: const Expanded(
//                         child: Text(
//                           'Document Capture',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//
//                 // Instructions
//                 Container(
//                   margin: EdgeInsets.only(bottom: 24),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Only your details written below will be recorded down,',
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 14,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'all documents and pictures will be deleted after verification.',
//                         style: TextStyle(
//                           color: const Color.fromARGB(255, 12, 12, 12),
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Information Lists
//                 Container(
//                   margin: EdgeInsets.only(bottom: 24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '(not shown to others)',
//                         style: TextStyle(
//                           color: Colors.red[400],
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       _buildInfoItem('• Full Name'),
//                       _buildInfoItem('• IC number',
//                           subtitle: '(Please cover all the numbers except only last 3 digits)'),
//                       // SizedBox(height: 16),
//                       Text(
//                         '(shown to others)',
//                         style: TextStyle(
//                           color: Colors.red[400],
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       _buildInfoItem('• Age'),
//                       _buildInfoItem('• Race'),
//                       _buildInfoItem('• Gender'),
//                       _buildInfoItem('• Nationality')
//                     ],
//                   ),
//                 ),
//
//                 // Camera/Document Area
//                 Container(
//                   margin: EdgeInsets.only(bottom: 24),
//                   child: _capturedImage != null
//                       ? _buildCapturedImage()
//                       : _buildCameraArea(),
//                 ),
//
//
//
//                  SizedBox(height: 20,),
//
//                  _buildInfoItem("• Please centre your NRIC in the centre of the photo as shown in the example"),
//
//
//                  _buildInfoItem("• Make sure the image is clear and easily readable for easier verification"),
//                 // Action Buttons
//                 Column(
//                   children: [
//                     Image.asset("assets/images/camera.jpg"),
//                     SizedBox(height: 12),
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoItem(String text, {String? subtitle}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 2),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text,
//             style: TextStyle(
//               color: Colors.grey[700],
//               fontSize: 14,
//             ),
//           ),
//           if (subtitle != null)
//             Padding(
//               padding: EdgeInsets.only(left: 16, top: 2),
//               child: Text(
//                 subtitle,
//                 style: TextStyle(
//                   color: Colors.grey[500],
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCapturedImage() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: EdgeInsets.all(16),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.file(
//               _capturedImage!,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: 8,
//             right: 8,
//             child: GestureDetector(
//               onTap: _removeImage,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Text(
//                   'Remove',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCameraArea() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           // Camera button area
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.amber[100],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             padding: EdgeInsets.all(24),
//             child: Column(
//               children: [
//                 Icon(
//                   Icons.camera_alt,
//                   size: 48,
//                   color: Colors.amber[700],
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Tap to capture document',
//                   style: TextStyle(
//                     color: Colors.amber[800],
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: _captureImage,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.amber[600],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Text(
//                           'Open Camera',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: _pickFromGallery,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.amber[600],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Text(
//                           'Gallery',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           SizedBox(height: 16),
//
//           // Sample ID Card
//           _buildSampleIdCard(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSampleIdCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Header
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.red[600]!, Colors.red[700]!],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8),
//                 topRight: Radius.circular(8),
//               ),
//             ),
//             child: Text(
//               'REPUBLIC OF SINGAPORE',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//
//           // ID Card Content
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               border: Border.all(color: Colors.grey[300]!),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(8),
//                 bottomRight: Radius.circular(8),
//               ),
//             ),
//             child: Row(
//               children: [
//                 // Photo placeholder
//                 Container(
//                   width: 50,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//                 SizedBox(width: 12),
//
//                 // Details
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildIdRow('NAME:', '████████'),
//                       _buildIdRow('CHINESE:', '██'),
//                       _buildIdRow('DOB:', '██/██/████'),
//                       _buildIdRow('RACE:', 'CHINESE'),
//                       _buildIdRow('SEX:', 'F'),
//                     ],
//                   ),
//                 ),
//
//                 // Chip placeholder
//                 Container(
//                   width: 24,
//                   height: 24,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Footer
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
//             child: Text(
//               'MALAYSIA',
//               style: TextStyle(
//                 color: Colors.grey[500],
//                 fontSize: 10,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildIdRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 1),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 60,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontSize: 10,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 10,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Usage in main.dart or another screen:
// /*
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Document Capture',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),
//       home: DocumentCaptureScreen(),
//     );
//   }
// }
// */
