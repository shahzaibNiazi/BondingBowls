// import 'package:flutter/material.dart';
//
// class ProfileCard extends StatelessWidget {
//   final dynamic user; // Replace with your UserModel
//
//   const ProfileCard({super.key, required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Color(0xffC672A5)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.1),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//
//       child: Column(
//         children: [
//           SizedBox(height: 10.h),
//
//           /// AVATAR ROW
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Visibility(
//                 visible: false,
//                 maintainSize: true,
//                 maintainAnimation: true,
//                 maintainState: true,
//                 child: SvgPicture.asset("assets/icon/svg/tri_info.svg"),
//               ),
//
//               Image.network(
//                 user.profileImage ?? "",
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//
//               SvgPicture.asset("assets/icon/svg/tri_info.svg"),
//             ],
//           ),
//
//           /// NAME
//           Text(
//             user.fullName ?? "",
//             style: TextStyle(
//               fontStyle: FontStyle.italic,
//               fontSize: 32.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           /// LOGIN TYPE / TAG
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             decoration: BoxDecoration(
//               color: Color(0xffFF0000),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Color(0xffC672A5), width: 2),
//             ),
//             child: Text(
//               user.loginType ?? "",
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//
//           SizedBox(height: 10),
//
//           /// BIO SHORT
//           Text(
//             user.bioShort ?? "",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 15.sp,
//               color: Color(0xFFBC0072),
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//
//           SizedBox(height: 15),
//
//           /// NATIONALITY ETC
//           _buildProfileRow("Nationality", user.nationality ?? ""),
//           SizedBox(height: 12),
//           Row(
//             children: [
//               Expanded(child: _buildProfileDetail("Age", "${user.age}")),
//               SizedBox(width: 20),
//               Expanded(child: _buildProfileDetail("Gender", user.gender ?? "")),
//             ],
//           ),
//
//           SizedBox(height: 30),
//
//           /// Nitty Gritty Title
//           Center(
//             child: Text(
//               "Nitty - Gritty",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           SizedBox(height: 16),
//
//           /// SMOKING, DRINKING, PETS, etc
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildIconText(
//                       "assets/icon/svg/smoke.svg",
//                       user.smokingText,
//                     ),
//                     _buildIconText(
//                       "assets/icon/svg/ocasstional.svg",
//                       user.drinkingText,
//                     ),
//                     _buildIconText("assets/icon/svg/pet.svg", user.petText),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildIconText(
//                       "assets/icon/svg/fre.svg",
//                       user.clubbingText,
//                     ),
//                     _buildIconText(
//                       "assets/icon/svg/serious.svg",
//                       user.intentText,
//                     ),
//                     _buildIconText(
//                       "assets/icon/svg/location1.svg",
//                       user.locationText,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(height: 14),
//
//           Text(
//             "Religion: ${user.religion}",
//             style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
//           ),
//
//           SizedBox(height: 20),
//
//           /// VOICE PROMPTS
//           Container(
//             width: double.infinity,
//             color: Color(0xfff2dede),
//             padding: EdgeInsets.all(8),
//             child: Text(
//               "Voice Prompts :",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           SpeakablePrompt(text: user.voicePrompt ?? ""),
//
//           SizedBox(height: 20),
//
//           /// BIO
//           _buildBioSection(user.bioLong ?? ""),
//
//           SizedBox(height: 20),
//
//           /// GREEN FLAGS
//           _buildFlags("Green Flags", user.greenFlags, Colors.green),
//
//           SizedBox(height: 20),
//
//           /// RED FLAGS
//           _buildFlags("Red Flags", user.redFlags, Colors.red),
//
//           SizedBox(height: 20),
//
//           /// BOTTOM BUTTONS
//           Image.asset("assets/images/thumbs.png", scale: 3.5),
//           SizedBox(height: 200),
//         ],
//       ),
//     );
//   }
// }
