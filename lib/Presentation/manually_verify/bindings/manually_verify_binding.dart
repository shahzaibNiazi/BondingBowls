import 'package:get/get.dart';

import '../controllers/manually_verify_controller.dart';

class ManuallyVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManuallyVerifyController>(
      () => ManuallyVerifyController(),
    );
  }
}
