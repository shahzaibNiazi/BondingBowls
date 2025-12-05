import 'package:get/get.dart';

import '../controllers/cafeconnect_booking_details_controller.dart';

class CafeconnectBookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CafeconnectBookingDetailsController>(
      () => CafeconnectBookingDetailsController(),
    );
  }
}
