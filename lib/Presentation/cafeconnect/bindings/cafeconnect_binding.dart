import 'package:get/get.dart';

import '../controllers/cafeconnect_controller.dart';

class CafeconnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CafeconnectController>(
      () => CafeconnectController(),
    );
  }
}
