import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';
import '../controllers/third_splash_controller.dart';

class ThirdSplashView extends GetView<ThirdSplashController> {
  const ThirdSplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThirdSplashController>(
      init: ThirdSplashController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/image_splash.jpg',
                    width: 700,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Sign Up button
                    OutlinedButton(
                      onPressed: () => controller.navigateToSignUp(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Log In button
                    ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shadowColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const Text(
                  "App Ver v1.0",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 53),
                // Terms & Privacy Text
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "I have read, understood and accepted the\n",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.onTermsOfServiceTap,
                      ),
                      const TextSpan(text: " and the "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.onPrivacyPolicyTap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
