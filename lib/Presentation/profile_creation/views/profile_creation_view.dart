import 'dart:developer';

import 'package:convo_hearts/Presentation/profile_creation/widgets/red_flag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';
import '../../../app/utils/image_picker_widget.dart';
import '../../../app/utils/utils.dart';
import '../controllers/profile_creation_controller.dart';
import '../widgets/audio_file.dart';
import '../widgets/green_flag_chip.dart';

class ProfileCreationView extends GetView<ProfileCreationController> {
  ProfileCreationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCreationController>(
      init: ProfileCreationController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Back Button
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  "assets/icon/svg/back_arrow.svg",
                                ), // Replace with SVG if needed
                              ),
                            ),

                            // Title
                            Expanded(
                              child: Text(
                                'Profile Creation',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Spacer for alignment
                            const SizedBox(width: 40),
                          ],
                        ),

                        // Profile Picture Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage(
                                "assets/images/avatar.jpg",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.AI_AVATAR_PICK_IMAGE);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffFA6D8C),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  'Edit my AI Avatar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // Form Fields
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nickname:',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        _buildTextField(
                          'Nickname',
                          controller.nickname,
                          controller.updateNickname,
                          showCharCount: true,
                          showLabelAbove: false,
                          maxLength: 20,
                        ),
                        const SizedBox(height: 15),

                        ElevatedButton(
                          onPressed: () {
                            if (controller.images.length > 2) {
                              Utils.showSnackBar(
                                "Warning",
                                "max limit is 3",
                                Colors.red,
                              );
                            } else {
                              controller.pickImage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            minimumSize: Size(260, 50),
                            side: BorderSide(color: Color(0xffFA6D8C)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icon/svg/upload.svg"),
                              SizedBox(width: 5),
                              Text(
                                "upload 3 Images (Optional)",
                                style: TextStyle(color: Color(0xffFA6D8C)),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        Obx(() {
                          final images = controller.images;
                          return Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: images.asMap().entries.map((entry) {
                              final index = entry.key;
                              final img = entry.value;
                              return ImageItemWidget(
                                img: img,
                                onRemove: () => controller.removeImage(index),
                              );
                            }).toList(),
                          );
                        }),
                        const SizedBox(height: 10),
                        // Dating Intentions Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Dating Intentions:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDatingIntentionChip('Serious'),
                            const SizedBox(width: 8),
                            _buildDatingIntentionChip('Friends'),
                            const SizedBox(width: 8),
                            _buildDatingIntentionChip('Casual'),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Describe Yourself Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Describe Yourself:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          'Occupation',
                          controller.occupation,
                          controller.updateOccupation,
                          showCharCount: true,
                          maxLength: 20,
                          showLabelAbove: false,
                        ),
                        SizedBox(height: 20),
                        _buildTextField(
                          'Hobbies',
                          controller.hobbies,
                          controller.updateHobbies,
                          showCharCount: true,
                          maxLength: 20,
                          showLabelAbove: false,
                        ),
                        SizedBox(height: 20),
                        _buildTextField(
                          'Lifestyle / Interests',
                          controller.lifestyleInterests,
                          controller.updateLifestyleInterests,
                          showCharCount: true,
                          maxLength: 20,
                          showLabelAbove: false,
                        ),
                        SizedBox(height: 20),

                        Column(
                          children: [
                            // Bio Section
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Bio:',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Bio TextField with character count in row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: controller.bio,
                                    onChanged: controller.updateBio,
                                    maxLines: 6,
                                    maxLength: 200,
                                    decoration: InputDecoration(
                                      hintText: 'Write more about yourself',
                                      hintStyle: TextStyle(
                                        color: const Color.fromARGB(
                                          167,
                                          0,
                                          0,
                                          0,
                                        ),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.pink,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(12),
                                      counterText:
                                          '', // Hide the default counter
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  // Align with text field content
                                  child: Text(
                                    '${controller.bio.text.length}/200',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),

                            // Dropdowns
                            Column(
                              children: [
                                _buildGenericDropdown(
                                  "assets/icon/svg/location.svg",
                                  "Location",
                                  controller.selectedLocation,
                                  controller.locations,
                                  'location',
                                ),

                                const SizedBox(height: 15),

                                // For Religion:
                                _buildGenericDropdown(
                                  "assets/icon/svg/reglion.svg",
                                  "Religion",
                                  controller.selectedReligion,
                                  controller.religions,
                                  'religion',
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            const SizedBox(height: 10),

                            // Status Section
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Status :',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              spacing: 14,
                              children: [
                                _buildStatusChip('Studying'),
                                _buildStatusChip('Working'),
                                _buildStatusChip('Others'),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Do you smoke Section
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Do you smoke ?',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              spacing: 14,
                              children: [
                                _buildLifestyleChip('Frequent', 'smoking'),
                                _buildLifestyleChip('Occasionally', 'smoking'),
                                _buildLifestyleChip('Never', 'smoking'),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Do you drink Section
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Do you drink ?',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              spacing: 14,
                              children: [
                                _buildLifestyleChip('Frequent', 'drinking'),
                                _buildLifestyleChip('Occasionally', 'drinking'),
                                _buildLifestyleChip('Never', 'drinking'),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Do you go to clubs Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Do you go to clubs ?',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          spacing: 14,
                          children: [
                            _buildLifestyleChip('Frequent', 'clubs'),
                            _buildLifestyleChip('Occasionally', 'clubs'),
                            _buildLifestyleChip('Never', 'clubs'),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Do you own pets Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Do you own pets ?',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            _buildRadioOption('yes', 'Yes'),
                            _buildRadioOption('no', 'No'),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Voice Prompt Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Voice Prompt (Optional)',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.seconds.value = 0;
                                Get.toNamed(Routes.VOICE_PROMPT_ONE);
                              },
                              child: SizedBox(
                                width: 32,
                                height: 32,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 7,
                                      child: SvgPicture.asset(
                                        "assets/icon/svg/voice_command.svg",
                                      ), // Replace with SVG if needed
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: SvgPicture.asset(
                                        "assets/icon/svg/voice_command_plus.svg",
                                      ), // Replace with SVG if needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        if (controller.audioUrl != null &&
                            controller.audioUrl!.isNotEmpty)
                          AudioPlayerWidget(
                            audioUrl: controller.audioUrl!,
                            isSentByMe: true,
                          ),

                        const SizedBox(height: 30),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Green Flags',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff008000),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 2,
                          runSpacing: 2,
                          children: controller.greenFlags.map((e) {
                            return buildGreenFlagChip(e, () {
                              log(e);
                              controller.toggleGreenFlag(e);
                            }, controller.isGreenFlagSelected(e));
                          }).toList(),
                        ),
                        const SizedBox(height: 30),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Red Flags',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xffFF0000),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 2,
                          runSpacing: 4,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: controller.redFlags.map((e) {
                            return buildRedFlagChip(e, () {
                              controller.toggleRedFlag(e);
                            }, controller.isRedFlagSelected(e));
                          }).toList(),
                        ),

                        const SizedBox(height: 30),

                        // Create Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.updateProfileCreation,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffC672A5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Create',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  // Dropdown overlays positioned outside the scroll view
                  if (isLocationDropdownOpen || isReligionDropdownOpen)
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          isLocationDropdownOpen = false;
                          isReligionDropdownOpen = false;
                          controller.update();
                        },
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.1),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              // Prevent closing when tapping on dropdown content
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.2,
                                      ),
                                      blurRadius: 15,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: _buildDropdownOptions(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController title,
    Function(String) onChanged, {
    int maxLines = 1,
    bool showCharCount = false,
    int? maxLength,
    bool showLabelAbove = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabelAbove)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (showCharCount && maxLength != null)
                Text(
                  '${controller.getCurrentLength(label)}/$maxLength',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromARGB(192, 0, 0, 0),
                  ),
                ),
            ],
          ),
        if (showLabelAbove) const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: title,
                onChanged: onChanged,
                maxLines: maxLines,
                maxLength: maxLength,
                decoration: InputDecoration(
                  hintText: showLabelAbove ? null : label,
                  hintStyle: TextStyle(
                    color: const Color(0xff000000).withValues(alpha: 0.7),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.pink),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  counter: const SizedBox.shrink(), // ✅ Correct usage
                ),
              ),
            ),
            if (!showLabelAbove && showCharCount && maxLength != null) ...[
              const SizedBox(width: 10),
              SizedBox(
                width: 40.w,
                child: Text(
                  '${controller.getCurrentLength(label)}/$maxLength',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(178, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  bool isLocationDropdownOpen = false;
  bool isReligionDropdownOpen = false;

  Widget _buildGenericDropdown(
    String svgPicture,
    String placeholder,
    String selectedValue,
    List<String> options,
    String dropdownType,
  ) {
    bool isOpen = dropdownType == 'location'
        ? isLocationDropdownOpen
        : isReligionDropdownOpen;

    return GestureDetector(
      onTap: () {
        if (dropdownType == 'location') {
          isLocationDropdownOpen = !isLocationDropdownOpen;
          isReligionDropdownOpen = false; // Close other dropdown
        } else {
          isReligionDropdownOpen = !isReligionDropdownOpen;
          isLocationDropdownOpen = false; // Close other dropdown
        }
        controller.update();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffFA6D8C), width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(svgPicture),
            const SizedBox(width: 10),
            // Text
            Expanded(
              child: Text(
                selectedValue.isEmpty || selectedValue == placeholder
                    ? placeholder
                    : selectedValue,
                style: TextStyle(
                  color: selectedValue.isEmpty || selectedValue == placeholder
                      ? const Color(0xff040001)
                      : Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
            // Dropdown arrow
            SvgPicture.asset("assets/icon/svg/dropdown_arrow.svg"),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDropdownOptions() {
    List<String> options = [];
    String selectedValue = '';
    String dropdownType = '';

    if (isLocationDropdownOpen) {
      options = controller.locations;
      selectedValue = controller.selectedLocation;
      dropdownType = 'location';
    } else if (isReligionDropdownOpen) {
      options = controller.religions;
      selectedValue = controller.selectedReligion;
      dropdownType = 'religion';
    }

    return options.map((option) {
      bool isSelected = selectedValue == option;

      return GestureDetector(
        onTap: () {
          if (dropdownType == 'location') {
            controller.selectedLocation = option;
            isLocationDropdownOpen = false;
          } else {
            controller.selectedReligion = option;
            isReligionDropdownOpen = false;
          }
          controller.update();
        },
        child: Container(
          width: 150,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffFA6D8C), width: 1.5),
            color: isSelected ? const Color(0xffFA6D8C) : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade700,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildDatingIntentionChip(String intention) {
    return GestureDetector(
      onTap: () => controller.selectDatingIntention(intention),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFA6D8C)),
          color: controller.selectedDatingIntention == intention
              ? Color(0xffFA6D8C)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          intention,
          style: TextStyle(
            color: controller.selectedDatingIntention == intention
                ? Colors.white
                : Color(0xffFA6D8C),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return GestureDetector(
      onTap: () => controller.selectStatus(status),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFA6D8C)),
          color: controller.selectedStatus == status
              ? Color(0xffFA6D8C)
              : Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: controller.selectedStatus == status
                ? Colors.white
                : Color(0xff000000),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLifestyleChip(String option, String category) {
    bool isSelected = false;
    switch (category) {
      case 'smoking':
        isSelected = controller.selectedSmoking == option;
        break;
      case 'drinking':
        isSelected = controller.selectedDrinking == option;
        break;
      case 'clubs':
        isSelected = controller.selectedClubs == option;
        break;
    }

    return GestureDetector(
      onTap: () {
        switch (category) {
          case 'smoking':
            controller.selectSmoking(option);
            break;
          case 'drinking':
            controller.selectDrinking(option);
            break;
          case 'clubs':
            controller.selectClubs(option);
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFA6D8C)),
          color: isSelected ? Color(0xffFA6D8C) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          textAlign: TextAlign.center,
          option,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.selectPetOwnership(value),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffFA6D8C), width: 2),
                color: controller.ownsPet == value
                    ? Color(0xffFA6D8C)
                    : Colors.white,
              ),
              child: controller.ownsPet == value
                  ? const Icon(Icons.circle, size: 12, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
