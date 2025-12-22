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
                  padding: EdgeInsets.all(16.w),
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
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 48.w),
                    ],
                  ),
                ),

                // Main container with Expanded
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10.r,
                          offset: Offset(0, 4.h),
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
                            height: 80.h,
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(
                                        fontFamily: "Adlam_Display",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  SizedBox(
                                    width: 200.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: optionButton(
                                            "Male",
                                            controller.selectedGender,
                                            (value) {
                                              controller.selectedGender = value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: optionButton(
                                            "Female",
                                            controller.selectedGender,
                                            (value) {
                                              controller.selectedGender = value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),

                              // --- Dating Intentions Section ---
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  SizedBox(
                                    width: 120.w,
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
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: intentionButton("Any"),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: intentionButton("Serious"),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: intentionButton("Friends"),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: intentionButton("Casual"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),

                              // --- Nationality Section ---
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text(
                                      "Nationality",
                                      style: TextStyle(
                                        fontFamily: "Adlam_Display",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  SizedBox(
                                    width: 200.w,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: optionButton(
                                            "SG/PR",
                                            controller.selectedNationality,
                                            (value) {
                                              controller.selectedNationality =
                                                  value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: optionButton(
                                            "Others",
                                            controller.selectedNationality,
                                            (value) {
                                              controller.selectedNationality =
                                                  value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              // --- Religion Section ---
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          SizedBox(height: 12.h),
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
                                              padding: EdgeInsets.all(8.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                    131,
                                                    63,
                                                    111,
                                                    255,
                                                  ),
                                                  width: 1.5.w,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/icon/svg/lock1.svg",
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  Text(
                                                    "Unlock Religion filter?\n (permanent)",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Color(0xff0022FF),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: optionButton(
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
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: optionButton(
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
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: optionButton(
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
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: optionButton(
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
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: optionButton(
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
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: optionButton(
                                                "Taoism",
                                                controller.selectedReligion,
                                                controller.isReligionUnlocked
                                                    ? (value) {
                                                        controller
                                                                .selectedReligion =
                                                            value;
                                                      }
                                                    : (value) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: optionButton(
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
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: optionButton(
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
                                              ),
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

                          SizedBox(height: 30.h),

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
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sectionLabel(String text) => Padding(
    padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
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
    double btnWidth = 120.w;
    double btnHeight = 44.h;
    return GestureDetector(
      onTap: () => onTap(label),
      child: Container(
        width: btnWidth,
        height: btnHeight,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
            width: 1.5.w,
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
    double btnWidth = 120.w;
    double btnHeight = 44.h;
    return GestureDetector(
      onTap: () {
        controller.selectedIntention = label;
        controller.update();
      },
      child: Container(
        width: btnWidth,
        height: btnHeight,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
            width: 2.w,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 13.sp,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: const Color(0xffFFF7ED),
            border: Border.all(color: Colors.pinkAccent, width: 2.w),
          ),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(color: Colors.pinkAccent, width: 1.w),
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
                SizedBox(height: 20.h),

                // Product Info Section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/svg/unlock.svg",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 20.w),
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
                          Image.asset(
                            "assets/images/cup.png",
                            scale: 18,
                            color: Color(0xffBC0072),
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

                SizedBox(height: 8.h),

                // Description
                Text(
                  "This will unlock filter for religion permanently",
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xffC672A5),
                      width: 2.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/cup.png",
                              scale: 18,
                              color: Color(0xffBC0072),
                            ),
                            SizedBox(width: 6.w),
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
                            Image.asset(
                              "assets/images/cup.png",
                              scale: 18,
                              color: Color(0xffBC0072),
                            ),
                            SizedBox(width: 6.w),
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
                            Image.asset(
                              "assets/images/cup.png",
                              scale: 18,
                              color: Color(0xffBC0072),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "200",
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
                SizedBox(height: 16.h),

                // Terms Text
                Text(
                  "Purchase made are non refundable as per TOS",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 5.h,
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
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 5.h,
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
