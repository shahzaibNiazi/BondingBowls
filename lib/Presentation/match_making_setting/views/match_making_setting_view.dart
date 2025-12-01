import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/match_making_setting_controller.dart';

class MatchMakingSettingView extends GetView<MatchMakingSettingController> {
  const MatchMakingSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchMakingSettingController>(
      init: MatchMakingSettingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFFCEEDD),
          body: SafeArea(
            child: Column(
              children: [
                // App bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Matchmaking",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Playfair",
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                // Main container with Expanded
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Adjust your main matchmaking filters",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),

                          sectionLabel("Age (25-40)"),

                          // Custom Range Slider matching the image design
                          Container(
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double trackWidth = constraints.maxWidth;
                                double startPos =
                                    ((controller.ageRange.start - 25) / 15) *
                                    trackWidth;
                                double endPos =
                                    ((controller.ageRange.end - 25) / 15) *
                                    trackWidth;

                                return GestureDetector(
                                  onPanUpdate: (details) {
                                    controller.ageUpdate(
                                      details,
                                      context,
                                      trackWidth,
                                      startPos,
                                      endPos,
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      // Age labels above the slider
                                      Positioned(
                                        top: 0,
                                        left: startPos - 10,
                                        child: Text(
                                          '${controller.ageRange.start.round()}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: endPos - 10,
                                        child: Text(
                                          '${controller.ageRange.end.round()}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),

                                      // Track background
                                      Positioned(
                                        top: 35,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Active track (between thumbs)
                                      Positioned(
                                        top: 35,
                                        left: startPos,
                                        child: Container(
                                          width: endPos - startPos,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade700,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Start thumb (left circle)
                                      Positioned(
                                        left: startPos - 20,
                                        top: 20,
                                        child: GestureDetector(
                                          onPanUpdate: (details) {
                                            double delta = details.delta.dx;
                                            double newStart =
                                                (controller.ageRange.start +
                                                        (delta *
                                                            15 /
                                                            trackWidth))
                                                    .clamp(
                                                      25.0,
                                                      controller.ageRange.end -
                                                          1,
                                                    );
                                            controller.ageRange = RangeValues(
                                              newStart,
                                              controller.ageRange.end,
                                            );
                                            controller.update();
                                          },
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                  ),
                                                ),
                                                Positioned(
                                                  child: SvgPicture.asset(
                                                    "assets/icon/svg/bowl.svg",
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // End thumb (right circle)
                                      Positioned(
                                        left: endPos - 20,
                                        top: 20,
                                        child: GestureDetector(
                                          onPanUpdate: (details) {
                                            double delta = details.delta.dx;
                                            double newEnd =
                                                (controller.ageRange.end +
                                                        (delta *
                                                            15 /
                                                            trackWidth))
                                                    .clamp(
                                                      controller
                                                              .ageRange
                                                              .start +
                                                          1,
                                                      40.0,
                                                    );
                                            controller.ageRange = RangeValues(
                                              controller.ageRange.start,
                                              newEnd,
                                            );
                                            controller.update();
                                          },
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                  ),
                                                ),
                                                Positioned(
                                                  child: SvgPicture.asset(
                                                    "assets/icon/svg/bowl.svg",
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // --- Gender Section ---
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Gender",
                                    style: TextStyle(
                                      fontFamily: "Adlam_Display",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      optionButton(
                                        "Male",
                                        controller.selectedGender,
                                        (value) {
                                          controller.selectedGender = value;
                                          controller.update();
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      optionButton(
                                        "Female",
                                        controller.selectedGender,
                                        (value) {
                                          controller.selectedGender = value;
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // --- Dating Intentions Section ---
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Dating\nintentions",
                                      style: TextStyle(
                                        fontFamily: "Adlam_Display",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          intentionButton("Any"),
                                          const SizedBox(width: 8),
                                          intentionButton("Serious"),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          intentionButton("Friends"),
                                          const SizedBox(width: 8),
                                          intentionButton("Casual"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // --- Nationality Section ---
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nationality",
                                    style: TextStyle(
                                      fontFamily: "Adlam_Display",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      optionButton(
                                        "SG/PR",
                                        controller.selectedNationality,
                                        (value) {
                                          controller.selectedNationality =
                                              value;
                                          controller.update();
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      optionButton(
                                        "Others",
                                        controller.selectedNationality,
                                        (value) {
                                          controller.selectedNationality =
                                              value;
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // --- Religion Section ---
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Religion",
                                        style: TextStyle(
                                          fontFamily: "Adlam_Display",
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      if (!controller.isReligionUnlocked) ...[
                                        const SizedBox(height: 12),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ConfirmPurchaseDialog(
                                                    onPurchaseConfirmed:
                                                        controller
                                                            .onReligionUnlocked,
                                                  ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                  131,
                                                  63,
                                                  111,
                                                  255,
                                                ),
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/icon/svg/lock1.svg",
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  "Unlock Religion filter?\n (permanent)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Color(0xff0022FF),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        GridView.count(
                                          crossAxisCount: 2,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio:
                                              2, // adjust to control button width/height
                                          children: [
                                            optionButton(
                                              "Any",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Atheist",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Buddhism",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Christianity",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Islam",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;

                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Taoism",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Hinduism",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                            optionButton(
                                              "Others",
                                              controller.selectedReligion,
                                              controller.isReligionUnlocked
                                                  ? (value) {
                                                      controller
                                                              .selectedReligion =
                                                          value;
                                                      controller.update();
                                                    }
                                                  : (value) {},
                                              isSmall: true,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // Save button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.updateMatchMaking();
                                // controller.showSnackBar(
                                //   "Your preferences have been saved.",
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                                minimumSize: Size(285, 35),
                                side: BorderSide(
                                  color: Colors.blue.shade400,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 12),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: "Adlam_Display",
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xff000000),
      ),
    ),
  );

  Widget optionButton(
    String label,
    String groupValue,
    Function(String) onTap, {
    bool isSmall = false,
  }) {
    bool isSelected = groupValue == label;
    return GestureDetector(
      onTap: () => onTap(label),
      child: Container(
        width: 100.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget intentionButton(String label) {
    bool isSelected = controller.selectedIntention == label;
    return GestureDetector(
      onTap: () {
        controller.selectedIntention = label;
        controller.update();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        width: 100.w,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // Callback function to handle religion unlock
}

class ConfirmPurchaseDialog extends StatelessWidget {
  final VoidCallback onPurchaseConfirmed;

  const ConfirmPurchaseDialog({super.key, required this.onPurchaseConfirmed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffFFF7ED),
            border: Border.all(color: Colors.pinkAccent, width: 2),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(color: Colors.pinkAccent, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Section
                Text(
                  "Confirm Purchase of",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Product Info Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/svg/unlock.svg",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Religion filter (permanent)",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "= ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBC0072),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icon/svg/color_bowl.svg",
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            " 500",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBC0072),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  "This will unlock filter for religion permanently",
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Calculation Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Available", style: TextStyle(fontSize: 10.sp)),
                    Text("Deductibles", style: TextStyle(fontSize: 10.sp)),
                    Text("Balance", style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffC672A5),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/svg/color_bowl.svg",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "300",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("-", style: TextStyle(fontSize: 16.sp)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/svg/color_bowl.svg",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "500",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFF0000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("=", style: TextStyle(fontSize: 16.sp)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/svg/color_bowl.svg",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "-200",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Terms Text
                Text(
                  "Purchase made are non refundable as per TOS",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffDA4747),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onPurchaseConfirmed(); // Call the callback to unlock religion filter
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
