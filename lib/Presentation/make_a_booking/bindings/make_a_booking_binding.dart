import 'package:get/get.dart';

import '../controllers/make_a_booking_controller.dart';

class MakeABookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MakeABookingController>(
      () => MakeABookingController(),
    );
  }
}
