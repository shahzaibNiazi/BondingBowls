import 'package:get/get.dart';

import '../controllers/manually_verify_second_controller.dart';

class ManuallyVerifySecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManuallyVerifySecondController>(
      () => ManuallyVerifySecondController(),
    );
  }
}
