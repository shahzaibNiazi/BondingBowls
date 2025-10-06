import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../widgets/Custom_TextField.dart';
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
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: controller.validateEmail,
                      prefixIcon: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/icon/svg/login_person.svg",
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Password Field
                    CustomTextField(
                      controller: controller.passwordController,
                      hintText: "Type your Password",
                      obscureText: controller.obscurePassword,
                      validator: controller.validatePassword,
                      prefixIcon: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                      ),
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
                    CustomTextField(
                      controller: controller.confirmPasswordController,
                      hintText: "Re-Type your Password",
                      obscureText: controller.obscureConfirmPassword,
                      validator: controller.validateConfirmPassword,
                      onChanged: (value) {
                        // Trigger validation for confirm password when password changes
                        if (controller.formKey.currentState != null) {
                          controller.formKey.currentState!.validate();
                        }
                      },
                      prefixIcon: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                      ),
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
                        child: Text(
                          "Create passwords with at least 12\ncharacters, including a mix of:",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color.fromARGB(221, 179, 179, 179),
                          ),
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
                          onPressed: controller.isLoading
                              ? null
                              : controller.onGoogleSignUp,
                          padding: const EdgeInsets.all(12),
                        ),
                        const SizedBox(width: 16),
                        // Apple Sign Up Button
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
                              : controller.onAppleSignUp,
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

                    // Sign Up Button
                    SizedBox(
                      width: 285,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : controller.onEmailSignUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEB953A),
                          minimumSize: Size(285, 40),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shadowColor: const Color(
                            0xFF007BFF,
                          ).withValues(alpha: 0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBackgroundColor: const Color(0xFF6C757D),
                        ),
                        child: controller.isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
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
