import 'dart:developer';

import 'package:convo_hearts/Presentation/cafeconnect/controllers/cafeconnect_controller.dart';
import 'package:convo_hearts/data/model/available_model.dart';
import 'package:convo_hearts/data/model/booking_model.dart';
import 'package:convo_hearts/data/model/cafeConnect_model.dart';
import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/utils/utils.dart';
import '../../../data/model/like_you_model.dart';
import '../../cafeconnect_booking_details/views/cafeconnect_booking_details_view.dart';

class MakeABookingController extends GetxController {
  // Track selected tab
  var selectedTab = 'Bookings'.obs;

  TextEditingController additional = TextEditingController();
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  RxBool isLoading = false.obs;
  RxBool isBookingLoading = false.obs;

  RxBool isAlreadyBooked = false.obs;

  CafeModel cafeModel = CafeModel();
  BookingModel bookingModel = BookingModel();
  List<AvailableModel> availableModel = [];
  List<LikeYouModel> likeYouModel = [];

  @override
  void onInit() {
    super.onInit();
    cafeModel = Get.arguments['cafe'];
    isAlreadyBooked.value = cafeModel.isAlreadyBooked ?? false;

    if (isAlreadyBooked.value == true) {
      isAlreadyBooked = true.obs;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        getBookingDetails(cafeModel.id.toString());
      });
    }
  }

  void selectTab(String tab) {
    selectedTab.value = tab;

    if (selectedTab.value == 'Likes you') {
      likeYou();
    }
    if (selectedTab.value == 'Available') {
      available();
    }
  }

  // Looking For Options - Changed to multiple selection
  var selectedLookingFor = <String>[].obs;

  void toggleLookingFor(String option) {
    if (selectedLookingFor.contains(option)) {
      selectedLookingFor.remove(option);
    } else {
      selectedLookingFor.add(option);
    }
  }

  // Available For Options - Multiple selection
  List<String> availableFor = ['Breakfast', 'Lunch', 'Dinner', "Supper"];
  var selectedAvailableFor = <String>[].obs;

  void toggleAvailableFor(String option) {
    if (selectedAvailableFor.contains(option)) {
      selectedAvailableFor.remove(option);
    } else {
      selectedAvailableFor.add(option);
    }
  }

  Future<void> makeABooking() async {
    /// ---- VALIDATION ----
    if (cafeModel.id == null || cafeModel.id.toString().isEmpty) {
      Utils.showSnackBar('Error', 'Cafe not found', Colors.red);

      return;
    }

    if (selectedLookingFor.isEmpty) {
      Utils.showSnackBar(
        'Error',
        'Please select what you are looking for',
        Colors.red,
      );

      return;
    }

    if (selectedAvailableFor.isEmpty) {
      Utils.showSnackBar('Error', 'Please select availability', Colors.red);
      return;
    }

    // Optional: if additional notes are REQUIRED
    if (additional.text.trim().isEmpty) {
      Utils.showSnackBar('Error', 'Please add additional notes', Colors.red);

      return;
    }

    /// ---- API CALL ----
    isLoading.value = true;

    Map<String, dynamic> json = {
      "cafeId": cafeModel.id.toString(),
      "lookingFor": selectedLookingFor.toList(),
      "availableFor": selectedAvailableFor.toList(),
      "bookingDate": "2026-01-11T15:12:07.940719Z",
      "additionalNotes": additional.text.trim(),
    };

    log(json.toString());

    try {
      final response = await profileCreationRepository.makeABooking(json);

      log(response.toString());
      if (response != null && response['success'] == true) {
        isAlreadyBooked.value = true;
        var data = BookingModel.fromJson(response['data']);
        bookingModel = data;
        update();

        Utils.showSnackBar(
          'Congratulations!',
          'Your booking is confirmed',
          Colors.green,
        );

        if (!Get.isRegistered<CafeconnectController>()) {
          Get.put(CafeconnectController());
        }

        Get.find<CafeconnectController>().getCafeConnect();

        // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
      } else {
        Utils.showSnackBar(
          'Error',
          'Booking Failed Please Try again ',
          Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> getBookingDetails(cafId) async {
    /// ---- API CALL ----
    isBookingLoading.value = true;
    try {
      final response = await profileCreationRepository.getBooking(cafId);

      log(response.toString());
      if (response != null && response['success'] == true) {
        var data = BookingModel.fromJson(response['data']);
        bookingModel = data;
        update();
        // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
      } else {
        Utils.showSnackBar(
          'Error',
          'Booking Failed Please Try again ',
          Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isBookingLoading.value = false;
      update();
    }
  }

  Future<void> likeYou() async {
    /// ---- API CALL ----
    isLoading.value = true;
    // try {
    final response = await profileCreationRepository.likeYou(cafeModel.id);
    log('response ----- ${response.toString()}');

    likeYouModel.clear();
    if (response != null &&
        response['success'] == true &&
        response['data'] != null &&
        response['data'].isNotEmpty) {
      likeYouModel.clear();
      var data = response['data']
          .map<LikeYouModel>((e) => LikeYouModel.fromJson(e))
          .toList();
      likeYouModel = data;
      log('Length ----- ${likeYouModel.length.toString()}');
      log('Length ----- ${likeYouModel.length.toString()}');

      update();

      // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
    } else {}
    // } catch (e) {
    //   log(e.toString());
    // } finally {
    //   isLoading.value = false;
    //   update();
    // }
  }

  Future<void> available() async {
    /// ---- API CALL ----
    try {
      final response = await profileCreationRepository.available(cafeModel.id);
      availableModel.clear();
      if (response != null &&
          response['success'] == true &&
          response['data'] != null &&
          response['data'].isNotEmpty) {
        availableModel.clear();
        var data = response['data']
            .map<AvailableModel>((e) => AvailableModel.fromJson(e))
            .toList();
        availableModel = data;
        log('Length ----- ${availableModel.length.toString()}');

        update();

        // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> joinRequest(bookingId) async {
    /// ---- API CALL ----
    try {
      final response = await profileCreationRepository.joinRequest(bookingId);

      log(response.toString());
      if (response != null && response['success'] == true) {
        await getBookingDetails(cafeModel.id.toString());

        update();

        // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
      } else {
        Utils.showSnackBar(
          'Error',
          'Booking Failed Please Try again ',
          Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> createConversation(userId) async {
    /// ---- API CALL ----
    Map<String, dynamic> json = {'otherUserId': userId};

    try {
      final response = await profileCreationRepository.createConversation(json);

      log(response.toString());
      if (response != null && response['success'] == true) {
        showMatchDialog(Get.context!);
        await likeYou();

        update();

        // Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);
      } else {
        Utils.showSnackBar(
          'Error',
          'Booking Failed Please Try again ',
          Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> rejectRequestForAvailable(userId) async {
    isLoading.value = true;

    Map<String, dynamic> json = {"targetUserId": userId};

    try {
      final response = await profileCreationRepository
          .rejectRequestForAvailable(json);

      log('Reject response: $response');

      if (response != null && response['success'] == true) {
        await getBookingDetails(cafeModel.id.toString());
        update();
      } else {
        Utils.showSnackBar(
          'Error',
          response?['message']?.toString() ??
              'Booking failed. Please try again.',
          Colors.red,
        );
      }
    } catch (e, s) {
      log('Reject error: $e');
      log(s.toString());

      Utils.showSnackBar('Error', 'Something went wrong', Colors.red);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> rejectRequestForLike(bookingId) async {
    isLoading.value = true;

    try {
      final response = await profileCreationRepository.rejectRequestForLike(
        bookingId,
      );

      log('Reject response: $response');

      if (response != null && response['success'] == true) {
        await getBookingDetails(cafeModel.id.toString());
        update();
      } else {
        Utils.showSnackBar(
          'Error',
          response?['message']?.toString() ??
              'Booking failed. Please try again.',
          Colors.red,
        );
      }
    } catch (e, s) {
      log('Reject error: $e');
      log(s.toString());

      Utils.showSnackBar('Error', 'Something went wrong', Colors.red);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
