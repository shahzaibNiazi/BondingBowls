import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../src/feature/BottomBar/speakable_prompt.dart';
import '../../matches/views/bottom_sheet.dart';
import '../controllers/match_profile_controller.dart';

class MatchProfileView extends GetView<MatchProfileController> {
  const MatchProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDEFE3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink.shade100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: SvgPicture.asset(
                            "assets/icon/svg/back_arrow.svg",
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          'assets/images/female-avatar.jpg', // Replace with your avatar image
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          log("shshzaib");
                          showTextBottomSheet(
                            context,
                            items: [
                              'Report for inappropriate/offensive behaviour',
                              'Spam , Selling something (including financial product)',
                              'Others',
                            ],
                            onTap: [
                              () async {
                                Navigator.pop(context);

                                showConfirmReportBottomSheet(context, () async {
                                  Navigator.pop(context);
                                  await controller.reportUser(
                                    id: '',
                                    reportReason: "Inappropriate Behaviour",
                                    reasonDetail:
                                        "Report for inappropriate/offensive behaviour",
                                  );
                                }); // 👈 open confirm report sheet
                              },
                              () async {
                                Navigator.pop(context);

                                showConfirmReportBottomSheet(context, () async {
                                  Navigator.pop(context);
                                  await controller.reportUser(
                                    id: '',
                                    reportReason: "Spam",
                                    reasonDetail:
                                        "Spam , Selling something (including financial product)",
                                  );
                                });
                              },
                              () {
                                Navigator.pop(context);

                                showOtherBottomSheet(
                                  context,
                                ); // 👈 open second bottom sheet
                              },
                            ],
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            "assets/icon/svg/tri_info.svg",
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Name
                  Text(
                    'Nicole',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffFF0000),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffC672A5), width: 2),
                    ),
                    child: Text(
                      "SingPass",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Software Engineer | Coffee Enthusiast | Yoga lover',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color(0xFFBC0072),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Profile Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildProfileRow('Nationality', 'Singaporean'),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(child: _buildProfileDetail('Age', '22')),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildProfileDetail('Gender', 'Female'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildProfileDetail('Race', 'Chinese'),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildProfileDetail('Status', 'Single'),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Determine how many icons can fit horizontally
                      double iconWidth =
                          15; // You can adjust this based on the actual SVG size
                      int iconCount = (constraints.maxWidth / iconWidth)
                          .floor();

                      return Wrap(
                        spacing: 0, // no space between icons
                        runSpacing: 0,
                        children: List.generate(iconCount, (index) {
                          return SvgPicture.asset(
                            "assets/icon/svg/bowl.svg",
                            width: iconWidth,
                          );
                        }),
                      );
                    },
                  ),

                  Center(
                    child: Text(
                      "Nitty - Gritty",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Row 1
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildIconText(
                                "assets/icon/svg/smoke.svg",
                                "Non - Smoker",
                              ),
                              _buildIconText(
                                "assets/icon/svg/ocasstional.svg",
                                "Occasional Drinker",
                              ),
                              _buildIconText(
                                "assets/icon/svg/pet.svg",
                                "No Pets",
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildIconText(
                                "assets/icon/svg/fre.svg",
                                "Frequent Clubber",
                              ),
                              _buildIconText(
                                "assets/icon/svg/serious.svg",
                                "Serious",
                              ),
                              _buildIconText(
                                "assets/icon/svg/location1.svg",
                                "North - East",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Religion
                  Text(
                    "Religion: Hinduism",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xfff2dede), // light pink/red
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      "Voice Prompts :",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SpeakablePrompt(text: "What do I think of first dates?"),

                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xfff2dede), // light pink
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Bio :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child:
                              // TextFormField(
                              //     controller: _bioController,
                              //     maxLines: null, // allows multiline
                              //     minLines: 10, // initial height
                              //     keyboardType: TextInputType.multiline,
                              //     decoration: InputDecoration(
                              //       // labelText: "About You",
                              //       alignLabelWithHint: true,
                              //       // border: OutlineInputBorder(),
                              //     ),
                              //     style: const TextStyle(fontSize: 14),
                              //   ),
                              Text(
                                "Hi! I'm someone who loves meaningful conversations, spontaneous adventures, and the little things in life. Whether it's deep talks over coffee or laughing at silly memes, I'm all in. Looking to meet someone genuine, kind, and curious. Let's explore connections beyond just swipes.",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Green Flags
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Green Flags",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: const [
                                _FlagChip(
                                  label: "Trustworthy & Honest",
                                  backgroundColor: Colors.green,
                                ),
                                _FlagChip(
                                  label: "Open Communication",
                                  backgroundColor: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Red Flags
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Red Flags",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 10,
                              children: const [
                                _FlagChip(
                                  label: "Bad Time Management",
                                  backgroundColor: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //   "Bowl Crush remaining : 6",
                                //   style: TextStyle(
                                //     color: Color(0xffEB5230),
                                //     fontSize: 16.sp,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/thumbs.png",
                                scale: 3.5,
                              ),
                              // Image.asset(
                              //   "assets/images/match_logo.png",
                              //   scale: 3.5,
                              // ),
                              Image.asset(
                                "assets/images/thumbs_down.png",
                                scale: 3.5,
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 200),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================== Widgets ==================
}

Widget _buildProfileRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$label : ',
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget _buildProfileDetail(String label, String value) {
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label : ',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget _buildIconText(String iconPath, String text, {bool underline = false}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(iconPath, width: 18, height: 18),
      const SizedBox(width: 6),
      Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            decoration: underline
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    ],
  );
}

class _FlagChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const _FlagChip({required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 10.sp),
      ),
    );
  }
}
