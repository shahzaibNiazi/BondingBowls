import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';

class ThirdSplashController extends GetxController {
  //TODO: Implement ThirdSplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void navigateToSignUp() {
    Get.toNamed(Routes.SIGNUP);
  }

  void onTermsOfServiceTap() {
    // Navigate to Terms of Service
  }

  void onPrivacyPolicyTap() {
    // Navigate to Privacy Policy
  }
}
