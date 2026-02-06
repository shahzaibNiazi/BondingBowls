import 'package:get/get.dart';

class UserBookingDetailsController extends GetxController {
  //TODO: Implement UserBookingDetailsController

  final count = 0.obs;

  void increment() => count.value++;

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
