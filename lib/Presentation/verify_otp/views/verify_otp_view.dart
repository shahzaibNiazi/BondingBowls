import 'package:convo_hearts/Presentation/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/Custom_PIn_Code.dart';

class VerifyOtpView extends GetView<SignupController> {
  const VerifyOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset('assets/images/image_splash2.jpg', width: 700),
                    const SizedBox(height: 24),

                    // Title
                    const Text(
                      "Verify your Email",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtext
                    Text(
                      "Please enter the 6 digit code sent to your\nemail : ${controller.maskedEmail}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 32),

                    // Custom PIN Code Input
                    CustomPinCodeField(
                      onCompleted: controller.onPinCompleted,
                      onChanged: controller.onPinChanged,
                    ),

                    const SizedBox(height: 32),

                    // Verify Button
                    SizedBox(
                      width: 284,
                      height: 36,
                      child: ElevatedButton(
                        onPressed: controller.verifyOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEB953A),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      "Haven't received your code?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Timer + Resend
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   controller.formattedTime,
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 14,
                        //   ),
                        // ),
                        // const SizedBox(height: 16),424
                        GestureDetector(
                          onTap: controller.resendCode,
                          child: Text(
                            "Resend!",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              decorationColor: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
