
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/forgot_password_controller.dart';

class VerifyResetPasswordScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {




    final ForgotPasswordController controller = Get.find<ForgotPasswordController>();
    //  final VerifyEmailController VerifyOtp = Get.find<VerifyEmailController>();


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 300,
                  ),
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
                const SizedBox(height: 16),

                // Subtitle
                Obx(() => Text(
                  "Please enter the 6-digit code sent to\n${controller.userEmail.isNotEmpty 
                  // ? VerifyOtp.getMaskedEmail() : 'your email'
                  }",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6C757D),
                    height: 1.5,
                  ),
                )),
                const SizedBox(height: 32),

                // OTP Input Field
                Container(
                  height: 60,
                  child: TextFormField(
                    controller: controller.otpController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 8,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "- - - - - -",
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 24,
                        letterSpacing: 8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.orange, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE9ECEF)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onChanged: (value) {
                      if (value.length == 6) {
                        // Auto-verify when 6 digits are entered
                        controller.verifyOTP();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Timer and Resend
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.canResendOTP.value 
                          ? "Didn't receive code?" 
                          : "Resend code in ${controller.startOTPTimer}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                    if (controller.canResendOTP.value)
                      TextButton(
                        onPressed: controller.currentState.value == ForgotPasswordState.sendingOTP
                            ? null
                            : controller.resendOTP,
                        child: Text(
                          controller.currentState.value == ForgotPasswordState.sendingOTP
                              ? "Sending..."
                              : "Resend",
                          style: TextStyle(
                            color: controller.currentState.value == ForgotPasswordState.sendingOTP
                                ? Colors.grey
                                : Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                )),
                const SizedBox(height: 32),

                // Verify Button
                Obx(() => Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.currentState.value == ForgotPasswordState.verifyingOTP
                        ? null
                        : controller.verifyOTP,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.currentState.value == ForgotPasswordState.verifyingOTP
                          ? Colors.orange.withOpacity(0.7)
                          : Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: controller.currentState.value == ForgotPasswordState.verifyingOTP ? 0 : 2,
                      shadowColor: Colors.orange.withOpacity(0.3),
                    ),
                    child: controller.currentState.value == ForgotPasswordState.verifyingOTP
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                )),
                const SizedBox(height: 32),

                // Back to Email
                Center(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      splashFactory: InkRipple.splashFactory,
                      overlayColor: Colors.blue.withOpacity(0.1),
                    ),
                    child: const Text(
                      "Change Email Address",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                // Bottom padding
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}