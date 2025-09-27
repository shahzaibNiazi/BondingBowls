import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../src/feature/splash/splash_screen3.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    animationController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Get.off(
        () => const SplashScreen3(),
        transition: Transition.leftToRight,
        duration: Duration(milliseconds: 800),
      );
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
