import 'package:convo_hearts/src/feature/splash/splash_screen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit()
  {
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
      Get.off(() => const SplashScreen3(), transition: Transition.leftToRight ,duration: Duration(milliseconds: 800 ));
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AnimatedBuilder(
                animation: controller.scaleAnimation,
                builder: (context, child) => Transform.scale(
                  scale: controller.scaleAnimation.value,
                  child: Image.asset(
                    'assets/images/image_splash2.jpg',
                    width: double.infinity,
                  ),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'App Ver v1.0',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}