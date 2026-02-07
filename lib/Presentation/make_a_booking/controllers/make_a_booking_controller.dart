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
  RangeValues ageRange = const RangeValues(25, 40);

  TextEditingController additional = TextEditingController();
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  RxBool isLoading = false.obs;
  RxBool isBookingLoading = false.obs;

  RxBool isAlreadyBooked = false.obs;

  CafeModel cafeModel = CafeModel();
  BookingModel bookingModel = BookingModel();
  List<AvailableModel> availableModel = [
    AvailableModel.fromJson({
      "_id": "avail_1",
      "userId": {
        "_id": "user_1",
        "nickname": "Mary",
        "profilePhoto": "https://i.pravatar.cc/150?img=1",
        "maritalStatus": "Single",
        "location": "Lahore",
        "occupation": "Designer",
        "datingIntentions": "Friendship",
      },
      "cafeId": {
        "_id": "cafe_1",
        "name": "Coffee Spot",
        "category": "Cafe",
        "averagePrice": 1200,
        "image": "",
        "location": {"exactLocation": "Main Boulevard", "region": "DHA"},
        "reviews": {
          "rating": 4.5,
          "reviewCount": 120,
          "reviewText": "Nice place",
        },
      },
      "lookingFor": ["Male", "Female"],
      "availableFor": ["Coffee", "Dinner"],
      "additionalNotes": "Love deep conversations",
      "status": "active",
      "isExpired": false,
      "hasJoinRequest": false,
    }),

    AvailableModel.fromJson({
      "_id": "avail_2",
      "userId": {
        "_id": "user_2",
        "nickname": "Mary",
        "profilePhoto": "https://i.pravatar.cc/150?img=5",
        "maritalStatus": "Divorced",
        "location": "Karachi",
        "occupation": "Teacher",
        "datingIntentions": "Serious",
      },
      "cafeId": {
        "_id": "cafe_2",
        "name": "Brew House",
        "category": "Cafe",
        "averagePrice": 900,
        "image": "",
        "location": {"exactLocation": "Clifton", "region": "Block 5"},
        "reviews": {"rating": 4.2, "reviewCount": 80, "reviewText": "Cozy"},
      },
      "lookingFor": ["Male", "Female"],
      "availableFor": ["Lunch"],
      "additionalNotes": "Prefer calm places",
      "status": "active",
      "isExpired": false,
      "hasJoinRequest": true,
    }),

    AvailableModel.fromJson({
      "_id": "avail_3",
      "userId": {
        "_id": "user_3",
        "nickname": "Mary",
        "profilePhoto": "",
        "maritalStatus": "Single",
        "location": "Islamabad",
        "occupation": "Software Engineer",
        "datingIntentions": "Marriage",
      },
      "cafeId": {
        "_id": "cafe_3",
        "name": "Bean Lounge",
        "category": "Cafe",
        "averagePrice": 1500,
        "image": "",
        "location": {"exactLocation": "F-7", "region": "DHA"},
        "reviews": {
          "rating": 4.8,
          "reviewCount": 210,
          "reviewText": "Excellent",
        },
      },
      "lookingFor": ["Male", "Female"],
      "availableFor": ["Dinner", "Coffee"],
      "additionalNotes": "Family oriented",
      "status": "active",
      "isExpired": false,
      "hasJoinRequest": false,
    }),
  ];
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

    // if (selectedTab.value == 'Likes you') {
    //   likeYou();
    // }
    // if (selectedTab.value == 'Available') {
    //   available();
    // }
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

      log(response.toString());

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
        log('Length ----- ${availableModel.toString()}');

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
    Map<String, dynamic> json = {'type': 'cafe', 'otherUserId': userId};

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

  void ageUpdate(details, context, trackWidth, startPos, endPos) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    double localPosition =
        renderBox.globalToLocal(details.globalPosition).dx - 24;
    double percentage = (localPosition / trackWidth).clamp(0.0, 1.0);
    double newValue = 18 + (percentage * 49); // 18 to 67 range (49 years)

    // Determine which thumb is closer
    double startDistance = (startPos - localPosition).abs();
    double endDistance = (endPos - localPosition).abs();

    if (startDistance < endDistance) {
      // Move start thumb
      double newStart = newValue.clamp(18.0, ageRange.end - 1);
      ageRange = RangeValues(newStart, ageRange.end);
    } else {
      // Move end thumb
      double newEnd = newValue.clamp(ageRange.start + 1, 67.0);
      ageRange = RangeValues(ageRange.start, newEnd);
    }
    update();
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
