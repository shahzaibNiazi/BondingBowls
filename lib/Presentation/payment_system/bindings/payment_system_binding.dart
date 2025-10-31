import 'package:get/get.dart';

import '../controllers/payment_system_controller.dart';

class PaymentSystemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentSystemController>(
      () => PaymentSystemController(),
    );
  }
}
