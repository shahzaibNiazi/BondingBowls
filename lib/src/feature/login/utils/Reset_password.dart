import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/shared_widgets/textfield.dart';
import '../controller/forgot_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.find<ForgotPasswordController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
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
                    "Choose a New Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // New Password Field
                  Obx(
                    () => PasswordTextField(
                      controller: controller.confirmPasswordController,
                      hint: "Re-Type your Password",
                      isObscure: controller.obscureConfirmPassword.value,
                      validation: controller.validateConfirmPassword,
                      onchange: (value) {
                        if (controller.formKey.currentState != null) {
                          controller.formKey.currentState!.validate();
                        }
                        return null;
                      },
                      prefixIcon: 'lock',
                      suffixIcon: GestureDetector(
                        onTap: controller.toggleConfirmPasswordVisibility,
                        child: Icon(
                          controller.obscureConfirmPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Re-type Password Field
                  Obx(
                    () => PasswordTextField(
                      controller: controller.confirmPasswordController,
                      hint: "Re-Type your Password",
                      isObscure: controller.obscureConfirmPassword.value,
                      validation: controller.validateConfirmPassword,
                      onchange: (value) {
                        if (controller.formKey.currentState != null) {
                          controller.formKey.currentState!.validate();
                        }
                        return null;
                      },
                      prefixIcon: 'lock',
                      suffixIcon: GestureDetector(
                        onTap: controller.toggleConfirmPasswordVisibility,
                        child: Icon(
                          controller.obscureConfirmPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Requirements
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE9ECEF)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create password with at least 8 characters, containing a mix of letters, numbers and symbols for better security",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6C757D),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Special Characters (e.g., !@#\$%)",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6C757D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Change Password Button
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            controller.currentState.value ==
                                ForgotPasswordState.resettingPassword
                            ? null
                            : controller.resetPassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              controller.currentState.value ==
                                  ForgotPasswordState.resettingPassword
                              ? Colors.orange.withValues(alpha: 0.7)
                              : Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation:
                              controller.currentState.value ==
                                  ForgotPasswordState.resettingPassword
                              ? 0
                              : 2,
                          shadowColor: Colors.orange.withValues(alpha: 0.3),
                        ),
                        child:
                            controller.currentState.value ==
                                ForgotPasswordState.resettingPassword
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
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
      ),
    );
  }
}
