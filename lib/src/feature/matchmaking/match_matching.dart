// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// class MatchmakingScreen extends StatefulWidget {
//   const MatchmakingScreen({super.key});
//
//   @override
//   State<MatchmakingScreen> createState() => _MatchmakingScreenState();
// }
//
// class _MatchmakingScreenState extends State<MatchmakingScreen> {
//   RangeValues ageRange = const RangeValues(25, 28);
//   String selectedGender = 'Female';
//   String selectedIntention = 'Any';
//   String selectedNationality = 'SG/PR';
//   String selectedReligion = 'Any';
//   bool isReligionUnlocked = false; // Track if religion filter is unlocked
//
//   Widget sectionLabel(String text) => Padding(
//     padding: const EdgeInsets.only(top: 20, bottom: 12),
//     child: Text(
//       text,
//       style: const TextStyle(
//         fontFamily: "Adlam_Display",
//         fontSize: 20,
//         fontWeight: FontWeight.w400,
//         color: Color(0xff000000),
//       ),
//     ),
//   );
//
//   Widget optionButton(
//     String label,
//     String groupValue,
//     Function(String) onTap, {
//     bool isSmall = false,
//   }) {
//     bool isSelected = groupValue == label;
//     return GestureDetector(
//       onTap: () => onTap(label),
//       child: Container(
//         width: 100.w,
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.grey.shade700 : Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(
//             color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
//             width: 1.5,
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontSize: 12,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget intentionButton(String label) {
//     bool isSelected = selectedIntention == label;
//     return GestureDetector(
//       onTap: () => setState(() => selectedIntention = label),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         margin: const EdgeInsets.only(right: 8, bottom: 8),
//         width: 92,
//         height: 40,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.grey.shade700 : Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(
//             color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
//             width: 2,
//           ),
//         ),
//         child: Text(
//           label,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontSize: 12,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green.shade100,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         margin: const EdgeInsets.all(16),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
//
//   // Callback function to handle religion unlock
//   void onReligionUnlocked() {
//     setState(() {
//       isReligionUnlocked = true;
//     });
//     showSnackBar("Religion filter unlocked successfully!");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFCEEDD),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // App bar
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       size: 28,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const Expanded(
//                     child: Text(
//                       "Matchmaking",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: "Playfair",
//                         fontSize: 36,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 48),
//                 ],
//               ),
//             ),
//
//             // Main container with Expanded
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: const Text(
//                           "Adjust your main matchmaking filters",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.italic,
//                             color: Color(0xff000000),
//                           ),
//                         ),
//                       ),
//
//                       sectionLabel("Age (25-40)"),
//
//                       // Custom Range Slider matching the image design
//                       Container(
//                         height: 80,
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: LayoutBuilder(
//                           builder: (context, constraints) {
//                             double trackWidth = constraints.maxWidth;
//                             double startPos =
//                                 ((ageRange.start - 25) / 15) * trackWidth;
//                             double endPos =
//                                 ((ageRange.end - 25) / 15) * trackWidth;
//
//                             return GestureDetector(
//                               onPanUpdate: (details) {
//                                 RenderBox renderBox =
//                                     context.findRenderObject() as RenderBox;
//                                 double localPosition =
//                                     renderBox
//                                         .globalToLocal(details.globalPosition)
//                                         .dx -
//                                     24;
//                                 double percentage = (localPosition / trackWidth)
//                                     .clamp(0.0, 1.0);
//                                 double newValue = 25 + (percentage * 15);
//
//                                 // Determine which thumb is closer
//                                 double startDistance =
//                                     (startPos - localPosition).abs();
//                                 double endDistance = (endPos - localPosition)
//                                     .abs();
//
//                                 if (startDistance < endDistance) {
//                                   // Move start thumb
//                                   double newStart = newValue.clamp(
//                                     25.0,
//                                     ageRange.end - 1,
//                                   );
//                                   setState(() {
//                                     ageRange = RangeValues(
//                                       newStart,
//                                       ageRange.end,
//                                     );
//                                   });
//                                 } else {
//                                   // Move end thumb
//                                   double newEnd = newValue.clamp(
//                                     ageRange.start + 1,
//                                     40.0,
//                                   );
//                                   setState(() {
//                                     ageRange = RangeValues(
//                                       ageRange.start,
//                                       newEnd,
//                                     );
//                                   });
//                                 }
//                               },
//                               child: Stack(
//                                 children: [
//                                   // Age labels above the slider
//                                   Positioned(
//                                     top: 0,
//                                     left: startPos - 10,
//                                     child: Text(
//                                       '${ageRange.start.round()}',
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 0,
//                                     left: endPos - 10,
//                                     child: Text(
//                                       '${ageRange.end.round()}',
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ),
//
//                                   // Track background
//                                   Positioned(
//                                     top: 35,
//                                     left: 0,
//                                     right: 0,
//                                     child: Container(
//                                       height: 8,
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey.shade300,
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                     ),
//                                   ),
//
//                                   // Active track (between thumbs)
//                                   Positioned(
//                                     top: 35,
//                                     left: startPos,
//                                     child: Container(
//                                       width: endPos - startPos,
//                                       height: 8,
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey.shade700,
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                     ),
//                                   ),
//
//                                   // Start thumb (left circle)
//                                   Positioned(
//                                     left: startPos - 20,
//                                     top: 20,
//                                     child: GestureDetector(
//                                       onPanUpdate: (details) {
//                                         double delta = details.delta.dx;
//                                         double newStart =
//                                             (ageRange.start +
//                                                     (delta * 15 / trackWidth))
//                                                 .clamp(25.0, ageRange.end - 1);
//                                         setState(() {
//                                           ageRange = RangeValues(
//                                             newStart,
//                                             ageRange.end,
//                                           );
//                                         });
//                                       },
//                                       child: SizedBox(
//                                         width: 40,
//                                         height: 40,
//                                         child: Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Container(
//                                               height: 30,
//                                               width: 30,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey.shade700,
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               child: SvgPicture.asset(
//                                                 "assets/icon/svg/bowl.svg",
//                                                 height: 40,
//                                                 width: 40,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                   // End thumb (right circle)
//                                   Positioned(
//                                     left: endPos - 20,
//                                     top: 20,
//                                     child: GestureDetector(
//                                       onPanUpdate: (details) {
//                                         double delta = details.delta.dx;
//                                         double newEnd =
//                                             (ageRange.end +
//                                                     (delta * 15 / trackWidth))
//                                                 .clamp(
//                                                   ageRange.start + 1,
//                                                   40.0,
//                                                 );
//                                         setState(() {
//                                           ageRange = RangeValues(
//                                             ageRange.start,
//                                             newEnd,
//                                           );
//                                         });
//                                       },
//                                       child: SizedBox(
//                                         width: 40,
//                                         height: 40,
//                                         child: Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Container(
//                                               height: 30,
//                                               width: 30,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey.shade700,
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               child: SvgPicture.asset(
//                                                 "assets/icon/svg/bowl.svg",
//                                                 height: 40,
//                                                 width: 40,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // --- Gender Section ---
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Gender",
//                                 style: const TextStyle(
//                                   fontFamily: "Adlam_Display",
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xff000000),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   optionButton(
//                                     "Male",
//                                     selectedGender,
//                                     (value) =>
//                                         setState(() => selectedGender = value),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   optionButton(
//                                     "Female",
//                                     selectedGender,
//                                     (value) =>
//                                         setState(() => selectedGender = value),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//
//                           // --- Dating Intentions Section ---
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   "Dating\nintentions",
//                                   style: const TextStyle(
//                                     fontFamily: "Adlam_Display",
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xff000000),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 flex: 2,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         intentionButton("Any"),
//                                         const SizedBox(width: 8),
//                                         intentionButton("Serious"),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         intentionButton("Friends"),
//                                         const SizedBox(width: 8),
//                                         intentionButton("Casual"),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//
//                           // --- Nationality Section ---
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Nationality",
//                                 style: const TextStyle(
//                                   fontFamily: "Adlam_Display",
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xff000000),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   optionButton(
//                                     "SG/PR",
//                                     selectedNationality,
//                                     (value) => setState(
//                                       () => selectedNationality = value,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   optionButton(
//                                     "Others",
//                                     selectedNationality,
//                                     (value) => setState(
//                                       () => selectedNationality = value,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//
//                           // --- Religion Section ---
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Religion",
//                                     style: const TextStyle(
//                                       fontFamily: "Adlam_Display",
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w400,
//                                       color: Color(0xff000000),
//                                     ),
//                                   ),
//                                   if (!isReligionUnlocked) ...[
//                                     const SizedBox(height: 12),
//                                     InkWell(
//                                       onTap: () {
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) =>
//                                               ConfirmPurchaseDialog(
//                                                 onPurchaseConfirmed:
//                                                     onReligionUnlocked,
//                                               ),
//                                         );
//                                       },
//                                       child: Container(
//                                         padding: const EdgeInsets.all(8),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                             30,
//                                           ),
//                                           border: Border.all(
//                                             color: const Color.fromARGB(
//                                               131,
//                                               63,
//                                               111,
//                                               255,
//                                             ),
//                                             width: 1.5,
//                                           ),
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             SvgPicture.asset(
//                                               "assets/icon/svg/lock1.svg",
//                                             ),
//                                             const SizedBox(height: 8),
//                                             Text(
//                                               "Unlock Religion filter?\n (permanent)",
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 color: Color(0xff0022FF),
//                                                 fontWeight: FontWeight.w700,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ],
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 flex: 2,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     GridView.count(
//                                       crossAxisCount: 2,
//                                       shrinkWrap: true,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       crossAxisSpacing: 10,
//                                       mainAxisSpacing: 10,
//                                       childAspectRatio:
//                                           2, // adjust to control button width/height
//                                       children: [
//                                         optionButton(
//                                           "Any",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Atheist",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Buddhism",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Christianity",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Islam",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Taoism",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Hinduism",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                         optionButton(
//                                           "Others",
//                                           selectedReligion,
//                                           isReligionUnlocked
//                                               ? (value) => setState(
//                                                   () =>
//                                                       selectedReligion = value,
//                                                 )
//                                               : (value) {},
//                                           isSmall: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       // Save button
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             showSnackBar("Your preferences have been saved.");
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.blue,
//                             minimumSize: Size(285, 35),
//                             side: BorderSide(
//                               color: Colors.blue.shade400,
//                               width: 1.5,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             elevation: 0,
//                           ),
//                           child: const Text(
//                             "Save",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w700,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ConfirmPurchaseDialog extends StatelessWidget {
//   final VoidCallback onPurchaseConfirmed;
//
//   const ConfirmPurchaseDialog({super.key, required this.onPurchaseConfirmed});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: const Color(0xffFFF7ED),
//             border: Border.all(color: Colors.pinkAccent, width: 2),
//           ),
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: const Color.fromARGB(255, 255, 255, 255),
//               border: Border.all(color: Colors.pinkAccent, width: 1),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Title Section
//                 const Text(
//                   "Confirm Purchase of",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Product Info Section
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 14),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SvgPicture.asset(
//                         "assets/icon/svg/unlock.svg",
//                         width: 20,
//                         height: 20,
//                       ),
//                       SizedBox(width: 20),
//                       Expanded(
//                         child: const Text(
//                           "Religion filter (permanent)",
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Color(0xff000000),
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const Text(
//                             "= ",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffBC0072),
//                             ),
//                           ),
//                           SvgPicture.asset(
//                             "assets/icon/svg/color_bowl.svg",
//                             width: 16,
//                             height: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             " 500",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffBC0072),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 // Description
//                 const Text(
//                   "This will unlock filter for religion permanently",
//                   style: TextStyle(fontSize: 13, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Calculation Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Text("Available", style: TextStyle(fontSize: 10)),
//                     const Text("Deductibles", style: TextStyle(fontSize: 10)),
//                     const Text("Balance", style: TextStyle(fontSize: 10)),
//                   ],
//                 ),
//                 Container(
//                   height: 50,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: const Color(0xffC672A5),
//                       width: 2,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "assets/icon/svg/color_bowl.svg",
//                               width: 16,
//                               height: 16,
//                             ),
//                             const SizedBox(width: 4),
//                             const Text(
//                               "300",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Color(0xff000000),
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Text("-", style: TextStyle(fontSize: 16)),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "assets/icon/svg/color_bowl.svg",
//                               width: 16,
//                               height: 16,
//                             ),
//                             const SizedBox(width: 4),
//                             const Text(
//                               "500",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xffFF0000),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Text("=", style: TextStyle(fontSize: 16)),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "assets/icon/svg/color_bowl.svg",
//                               width: 16,
//                               height: 16,
//                             ),
//                             const SizedBox(width: 5),
//                             const Text(
//                               "-200",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Color(0xff000000),
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Terms Text
//                 const Text(
//                   "Purchase made are non refundable as per TOS",
//                   style: TextStyle(fontSize: 12, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Action Buttons
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: Colors.red,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 2,
//                             vertical: 5,
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text(
//                           "Cancel",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xffDA4747),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 5,
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                           onPurchaseConfirmed(); // Call the callback to unlock religion filter
//                         },
//                         child: const Text(
//                           "Proceed",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xffFFFFFF),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
