import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/shared_widgets/textfield.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.put(
      ForgotPasswordController(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // Enhanced scrolling like signup screen
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Form(
              key: controller.emailFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with constrained size like signup screen
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/image_splash2.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  const Text(
                    "Password Reset",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Input
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextField(
                      controller: controller.emailController,
                      hint: "Email",
                      textInputType: TextInputType.emailAddress,
                      validation: controller.validateEmail,
                      prefixIcon: 'mail',
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Send OTP Button
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            controller.currentState.value ==
                                ForgotPasswordState.sendingOTP
                            ? null
                            : controller.sendPasswordResetOTP,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              controller.currentState.value ==
                                  ForgotPasswordState.sendingOTP
                              ? Colors.orange.withValues(alpha: 0.7)
                              : Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation:
                              controller.currentState.value ==
                                  ForgotPasswordState.sendingOTP
                              ? 0
                              : 2,
                          shadowColor: Colors.orange.withValues(alpha: 0.3),
                        ),
                        child:
                            controller.currentState.value ==
                                ForgotPasswordState.sendingOTP
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "Send OTP",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
