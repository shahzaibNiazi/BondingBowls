import 'package:get/get.dart';

import '../controllers/second_splash_controller.dart';

class SecondSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondSplashController>(
      () => SecondSplashController(),
    );
  }
}
