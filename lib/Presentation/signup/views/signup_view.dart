import 'dart:io';

import 'package:convo_hearts/app/shared_widgets/custom_button.dart';
import 'package:convo_hearts/app/shared_widgets/my_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/shared_widgets/textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                // Enhanced scrolling physics for smooth experience
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                // Scroll behavior configuration
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                // Consistent padding
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo/Image with constrained size
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

                    // Email Field
                    CustomTextField(
                      controller: controller.emailController,
                      hint: "Email",
                      textInputType: TextInputType.emailAddress,
                      validation: controller.validateEmail,
                      isPrefixIcon: true,
                      prefixIcon: 'mail',
                    ),
                    const SizedBox(height: 24),

                    // Password Field
                    PasswordTextField(
                      controller: controller.passwordController,
                      hint: "Type your Password",
                      isObscure: controller.obscurePassword,
                      validation: controller.validatePassword,
                      prefixIcon: 'lock',
                      isPrefixIcon: true,
                      suffixIcon: GestureDetector(
                        onTap: controller.togglePasswordVisibility,
                        child: Icon(
                          controller.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Confirm Password Field
                    PasswordTextField(
                      controller: controller.confirmPasswordController,
                      hint: "Re-Type your Password",
                      isPrefixIcon: true,
                      isObscure: controller.obscureConfirmPassword,
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
                          controller.obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password Requirements Card
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: MyText(
                          size: 14.sp,
                          clr: Color.fromARGB(221, 179, 179, 179),
                          title:
                              "Create passwords with at least 12\ncharacters, including a mix of:",
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "        • Uppercase and lowercase letters",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(221, 179, 179, 179),
                              ),
                            ),
                            Text(
                              "        • Numbers",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(221, 179, 179, 179),
                              ),
                            ),
                            Text(
                              "        • Special characters (e.g., ! @ # \$ %)",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromARGB(221, 179, 179, 179),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // OR Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFE9ECEF),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "or sign up with",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF6C757D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFE9ECEF),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Social Sign Up Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google Sign Up Button
                        IconButton(
                          icon: controller.isLoading
                              ? const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFF6C757D),
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/icon/svg/Google_icon.svg",
                                  width: 24,
                                  height: 24,
                                ),
                          onPressed: () => controller.googleSignIn(context),
                          padding: const EdgeInsets.all(12),
                        ),
                        const SizedBox(width: 16),
                        // Apple Sign Up Button
                        if (Platform.isIOS)
                          IconButton(
                            icon: controller.isLoading
                                ? const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xFF6C757D),
                                    ),
                                  )
                                : SvgPicture.asset(
                                    "assets/icon/svg/Apple.svg",
                                    width: 24,
                                    height: 24,
                                  ),
                            onPressed: controller.isLoading
                                ? null
                                : controller.appleSignIn,
                            padding: const EdgeInsets.all(12),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Terms and Privacy Policy
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFF6C757D),
                            height: 1.5,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  'By Signing up, I have read, understood and accepted the',
                            ),
                            TextSpan(
                              text: ' Terms of Service',
                              style: const TextStyle(
                                color: Color(0xFF007BFF),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.onTermsOfServiceTap,
                            ),
                            const TextSpan(text: ' and the '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: const TextStyle(
                                color: Color(0xFF007BFF),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.onPrivacyPolicyTap,
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    CustomButton(
                      isCupertinoIndicator: controller.isLoading,
                      text: 'Sign Up',
                      fontSize: 22.sp,
                      onPress: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.signUp(
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                        }
                      },
                      textColor: AppColors.white,
                      boxColor: AppColors.primary,
                    ),

                    const SizedBox(height: 24),

                    // Already have an account? Sign In
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF6C757D),
                          ),
                          children: [
                            const TextSpan(text: "Already have an account? "),
                            TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(
                                color: Color(0xFF007BFF),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.navigateToLogin,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Extra bottom padding for keyboard
                    const SizedBox(height: 32),
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
