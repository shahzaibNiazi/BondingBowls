import 'dart:developer';

import 'package:convo_hearts/data/model/cafeConnect_model.dart';
import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';

class MakeABookingController extends GetxController {
  // Track selected tab
  var selectedTab = 'Bookings'.obs;

  TextEditingController additional = TextEditingController();
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  RxBool isLoading = false.obs;

  CafeModel cafeModel = CafeModel();

  @override
  void onInit() {
    super.onInit();
    cafeModel = Get.arguments['cafe'];

    log('Cafe --- ${cafeModel.id.toString()}');
  }

  void selectTab(String tab) {
    selectedTab.value = tab;
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
    isLoading.value = true;

    Map<String, dynamic> json = {
      "cafeId": cafeModel.id ?? "{{cafeId}}",
      "lookingFor": selectedLookingFor.first, // Pass as array
      "availableFor": selectedAvailableFor.toList(), // Pass as array
      "bookingDate": "2024-12-25T18:00:00.000Z",
      "additionalNotes": additional.text,
    };
    log(json.toString());

    // try {
    final response = await profileCreationRepository.makeABooking(json);

    if (response != null && response['success'] == true) {
      // log(response.toString());

      // var data = response['data']
      //     .map<CafeModel>((e) => CafeModel.fromJson(e))
      //     .toList();

      Get.toNamed(Routes.CAFECONNECT_BOOKING_DETAILS);

      update();
    }
    isLoading.value = false;
    update();
    log(response.toString());
    // } catch (e) {
    //   isLoading.value = false;
    //   log(e.toString());
    // }
  }
}
