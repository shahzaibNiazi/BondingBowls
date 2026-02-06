import 'package:convo_hearts/Presentation/second_splash/views/second_splash_view.dart';
import 'package:get/get.dart';

class SecondSplashController extends GetxController {
  //TODO: Implement SecondSplashController

  final count = 0.obs;

  void navigateToSplashScreen3() {
    Get.off(
      () => const SecondSplashView(),
      transition: Transition.leftToRight,
      duration: Duration(milliseconds: 800),
    );
  }
}
