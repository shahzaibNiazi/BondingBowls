import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../app/routes/app_pages.dart';
import '../../../verify-dating-profile/dating_verification.dart';

class ProfileCreationController extends GetxController {
  //TODO: Implement ProfileCreationController

  final count = 0.obs;
  var question = ''.obs;
  final AudioRecorder record = AudioRecorder(); // ✅ FIXED
  final player = AudioPlayer();

  String? recordedFilePath;

  RxInt seconds = 0.obs;
  Timer? _timer;
  // Form fields
  String nickname = '';
  String jobInterests = '';
  String address = '';
  String occupation = '';
  String university = '';
  String aboutYourself = '';
  String hobbies = '';
  String lifestyleInterests = '';
  String bio = '';

  // Dropdown selections
  String selectedLocation = 'Location';
  String selectedReligion = 'Religion';

  // Dating Intentions - only one can be selected at a time
  String selectedDatingIntention = '';

  // Age range
  int ageFrom = 18;
  int ageTo = 25;

  // Checkboxes
  bool isStudent = false;
  bool isWorking = false;
  bool isOther = false;

  // Selected languages
  List<String> selectedLanguages = [];

  // Status selection
  String selectedStatus = '';

  // Lifestyle questions
  String selectedSmoking = '';
  String selectedDrinking = '';
  String selectedClubs = '';

  // Pet ownership
  String ownsPet = ''; // 'yes', 'no', or ''

  @override
  void onInit() {
    super.onInit();
  }

  // Methods
  void updateNickname(String value) => nickname = value;

  void updateJobInterests(String value) => jobInterests = value;

  void updateAddress(String value) => address = value;

  void updateOccupation(String value) => occupation = value;

  void updateUniversity(String value) => university = value;

  void updateAboutYourself(String value) => aboutYourself = value;

  void updateHobbies(String value) => hobbies = value;

  void updateLifestyleInterests(String value) => lifestyleInterests = value;

  void updateBio(String value) => bio = value;

  void updateLocation(String value) => selectedLocation = value;

  void updateSubject(String value) => selectedReligion = value;

  // Dating Intentions methods
  void selectDatingIntention(String intention) {
    selectedDatingIntention = intention;
  }

  void updateAgeFrom(double value) => ageFrom = value.round();

  void updateAgeTo(double value) => ageTo = value.round();

  void toggleStudent(bool? value) => isStudent = value ?? false;

  void toggleWorking(bool? value) => isWorking = value ?? false;

  void toggleOther(bool? value) => isOther = value ?? false;

  // Language selection methods
  void toggleLanguage(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
  }

  bool isLanguageSelected(String language) {
    return selectedLanguages.contains(language);
  }

  // Methods for status and lifestyle
  void selectStatus(String status) => selectedStatus = status;

  void selectSmoking(String smoking) => selectedSmoking = smoking;

  void selectDrinking(String drinking) => selectedDrinking = drinking;

  void selectClubs(String clubs) => selectedClubs = clubs;

  void selectPetOwnership(String pet) => ownsPet = pet;

  void ViewProfile() {
    log('Profile View successfully!');
    // Navigate to next page

    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text('Profile created successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    Get.to(Verification_DatingScreen());
  }

  void updateQuestion(String value) {
    if (value.length <= 40) {
      question.value = value;
    }
  }

  /// Start recording with 30s limit
  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      final dir = await getTemporaryDirectory();
      recordedFilePath =
          '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await record.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc, // format
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: recordedFilePath!,
      );

      seconds.value = 0;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds.value >= 30) {
          stopRecording();
        } else {
          seconds.value++;
        }
      });
    }
  }

  /// Stop recording
  Future<void> stopRecording() async {
    await record.stop();
    _timer?.cancel();
    _timer = null;

    if (recordedFilePath != null) {
      Get.toNamed(Routes.VOICE_PROMPT_SECOND); // navigate to 2nd screen
    }
  }

  /// Redo recording
  void redoRecording() {
    if (recordedFilePath != null) {
      File(recordedFilePath!).delete();
    }
    recordedFilePath = null;
    Get.back();
  }
}
