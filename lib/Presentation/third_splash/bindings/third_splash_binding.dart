import 'package:get/get.dart';

import '../controllers/third_splash_controller.dart';

class ThirdSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThirdSplashController>(
      () => ThirdSplashController(),
    );
  }
}
