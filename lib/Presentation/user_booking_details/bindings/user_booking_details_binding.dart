import 'package:get/get.dart';

import '../controllers/user_booking_details_controller.dart';

class UserBookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserBookingDetailsController>(
      () => UserBookingDetailsController(),
    );
  }
}
