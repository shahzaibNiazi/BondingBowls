import 'package:get/get.dart';

import '../../../src/feature/login/utils/signup_screen.dart';

class ThirdSplashController extends GetxController {
  //TODO: Implement ThirdSplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void navigateToSignUp() {
    Get.to(
      () => SignUpScreen(),
      transition: Transition.leftToRight,
      duration: Duration(milliseconds: 800),
    );
  }

  void onTermsOfServiceTap() {
    // Navigate to Terms of Service
  }

  void onPrivacyPolicyTap() {
    // Navigate to Privacy Policy
  }
}
