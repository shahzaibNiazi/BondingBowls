import 'package:get/get.dart';

class BookingDetailsController extends GetxController {
  //TODO: Implement BookingDetailsController

  final count = 0.obs;
  var selectedTabIndex = 0.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
