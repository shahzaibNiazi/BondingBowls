import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MakeABookingController extends GetxController {
  // Track selected tab
  var selectedTab = 'Bookings'.obs;

  TextEditingController additional = TextEditingController();

  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  // Looking For Options
  var selectedLookingFor = ''.obs;
  void selectLookingFor(String option) {
    selectedLookingFor.value = option;
  }

  // Available For Options
  List<String> availableFor = ['Male', 'Female', 'Both'];
  // controller
  var selectedAvailableFor = <String>[].obs; // <-- RxList<String>

  void toggleAvailableFor(String option) {
    if (selectedAvailableFor.contains(option)) {
      selectedAvailableFor.remove(option);
    } else {
      selectedAvailableFor.add(option);
    }
  }
}
