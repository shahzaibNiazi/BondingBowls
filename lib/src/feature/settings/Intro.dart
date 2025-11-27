// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   final TextEditingController favoriteQuotesController =
//       TextEditingController();
//   final TextEditingController beforeAnythingController =
//       TextEditingController();
//   bool _canSave = false;
//
//   String favoriteQuotes = '';
//   String beforeAnything = '';
//
//   @override
//   void initState() {
//     super.initState();
//     favoriteQuotesController.addListener(_checkCanSave);
//     beforeAnythingController.addListener(_checkCanSave);
//   }
//
//   void updateFavoriteQuotes(String value) {
//     setState(() {
//       favoriteQuotes = value;
//     });
//   }
//
//   void updateBeforeAnything(String value) {
//     setState(() {
//       beforeAnything = value;
//     });
//   }
//
//   void _checkCanSave() {
//     setState(() {
//       _canSave =
//           favoriteQuotesController.text.isNotEmpty ||
//           beforeAnythingController.text.isNotEmpty;
//     });
//   }
//
//   // Helper method to check if favorite quotes field should be enabled
//   bool _isFavoriteQuotesEnabled() {
//     return beforeAnythingController.text.isEmpty;
//   }
//
//   // Helper method to check if before anything field should be enabled
//   bool _isBeforeAnythingEnabled() {
//     return favoriteQuotesController.text.isEmpty;
//   }
//
//   @override
//   void dispose() {
//     favoriteQuotesController.dispose();
//     beforeAnythingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5E6D3),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header with proper height constraint
//             SizedBox(
//               height: 80,
//               child: Stack(
//                 children: [
//                   // Back button positioned on the left
//                   Positioned(
//                     left: 10,
//                     top: 0,
//                     child: IconButton(
//                       icon: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//                   // Title centered
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 12.0),
//                       child: Text(
//                         'Intro',
//                         style: TextStyle(
//                           fontFamily: "Playfair",
//                           color: Colors.black,
//                           fontSize: 36,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Main content area
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                       color: const Color(0xffC672A5),
//                       width: 1.5,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: LayoutBuilder(
//                     // 👈 this gives flexibility
//                     builder: (context, constraints) {
//                       return SingleChildScrollView(
//                         child: ConstrainedBox(
//                           constraints: BoxConstraints(
//                             minHeight: constraints.maxHeight,
//                           ),
//                           child: IntrinsicHeight(
//                             // 👈 makes Spacer work correctly
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'This will be brought to chat when you match!',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.black87,
//                                     height: 1.4,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 32),
//
//                                 // Favorite quotes
//                                 const Text(
//                                   'Favorite quotes...',
//                                   style: TextStyle(
//                                     fontFamily: "Adlam_Display",
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 _buildTextField(
//                                   '',
//                                   updateFavoriteQuotes,
//                                   controller: favoriteQuotesController,
//                                   showCharCount: true,
//                                   showLabelAbove: false,
//                                   maxLength: 20,
//                                   enabled: _isFavoriteQuotesEnabled(),
//                                 ),
//                                 const SizedBox(height: 24),
//
//                                 // Before anything
//                                 const Text(
//                                   'Before Anything...',
//                                   style: TextStyle(
//                                     fontFamily: "Adlam_Display",
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 _buildTextField(
//                                   '',
//                                   updateBeforeAnything,
//                                   controller: beforeAnythingController,
//                                   showCharCount: true,
//                                   showLabelAbove: false,
//                                   maxLength: 20,
//                                   enabled: _isBeforeAnythingEnabled(),
//                                 ),
//
//                                 // 👇 Spacer still works
//                                 const Spacer(),
//
//                                 // Bottom section
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     const Center(
//                                       child: Text(
//                                         "Only 1 answers can be done at 1 time!",
//                                         style: TextStyle(
//                                           color: Colors.red,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 20),
//                                     SizedBox(
//                                       width: double.infinity,
//                                       child: ElevatedButton(
//                                         onPressed: _canSave
//                                             ? () {
//                                                 log(
//                                                   'Favorite quotes: ${favoriteQuotesController.text}',
//                                                 );
//                                                 log(
//                                                   'Before anything: ${beforeAnythingController.text}',
//                                                 );
//                                               }
//                                             : null,
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: _canSave
//                                               ? const Color.fromARGB(
//                                                   255,
//                                                   255,
//                                                   255,
//                                                   255,
//                                                 )
//                                               : Colors.grey[300],
//                                           foregroundColor: _canSave
//                                               ? Colors.white
//                                               : Colors.grey[600],
//
//                                           padding: const EdgeInsets.symmetric(
//                                             vertical: 16,
//                                           ),
//                                           shape: RoundedRectangleBorder(
//                                             side: BorderSide(),
//                                             borderRadius: BorderRadius.circular(
//                                               25,
//                                             ),
//                                           ),
//                                           elevation: 0,
//                                         ),
//                                         child: const Text(
//                                           'Save',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(
//     String label,
//     Function(String) onChanged, {
//     required TextEditingController controller,
//     int maxLines = 1,
//     bool showCharCount = false,
//     int? maxLength,
//     bool showLabelAbove = true,
//     bool enabled = true, // Added enabled parameter
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (showLabelAbove)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black,
//                 ),
//               ),
//               if (showCharCount && maxLength != null)
//                 Text(
//                   '${controller.text.length}/$maxLength',
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                 ),
//             ],
//           ),
//         if (showLabelAbove) const SizedBox(height: 8),
//         Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: controller,
//                 onChanged: onChanged,
//                 maxLines: maxLines,
//                 maxLength: maxLength,
//                 enabled: enabled, // Use the enabled parameter
//                 decoration: InputDecoration(
//                   hintText: showLabelAbove ? null : label,
//                   hintStyle: TextStyle(
//                     color: Colors.grey.shade600,
//                     fontSize: 14,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.pink),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   contentPadding: const EdgeInsets.all(12),
//                   counterText: '',
//                 ),
//               ),
//             ),
//             if (!showLabelAbove && showCharCount && maxLength != null) ...[
//               const SizedBox(width: 10),
//               Text(
//                 '${controller.text.length}/$maxLength',
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Color.fromARGB(255, 0, 0, 0),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ],
//     );
//   }
// }
