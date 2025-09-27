import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/feature/Profile-Creation/profile_creation1.dart';
import '../../../src/feature/login/utils/forgot_password.dart';
import '../../../src/feature/login/utils/signup_screen.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Scroll controller for smooth scrolling
  final ScrollController scrollController = ScrollController();

  // State variables
  bool obscurePassword = true;
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
  }

  // Show snackbar helper method
  void showSnackbar(String title, String message, Color backgroundColor) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text('$title: $message'),
        backgroundColor: backgroundColor.withOpacity(0.8),
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // Handle login
  Future<void> handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackbar('Error', 'Please fill in all fields', Colors.red);
      return;
    }

    isLoading = true;

    try {
      // Firebase login logic
      final email = emailController.text.trim();
      final password = passwordController.text;

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login successful
      showSnackbar('Success', 'Login successful!', Colors.green);

      // Navigate to profile creation screen
      // Uncomment when you have the actual screen
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) => ProfileCreation()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMsg = 'Login failed';

      if (e.code == 'user-not-found') {
        errorMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Incorrect password.';
      } else {
        errorMsg = e.message ?? 'Login failed. Please try again.';
      }

      showSnackbar('Error', errorMsg, Colors.red);
    } catch (e) {
      showSnackbar('Error', 'Login failed: ${e.toString()}', Colors.red);
    } finally {
      isLoading = false;
    }
  }

  // Handle Google login
  Future<void> handleGoogleLogin() async {
    isLoading = true;

    try {
      // Add your Google login logic here
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      showSnackbar('Success', 'Google login successful!', Colors.green);
    } catch (e) {
      showSnackbar('Error', 'Google login failed: ${e.toString()}', Colors.red);
    } finally {
      isLoading = false;
    }
  }

  // Handle Apple login
  Future<void> handleAppleLogin() async {
    isLoading = true;

    try {
      // Add your Apple login logic here
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      showSnackbar('Success', 'Apple login successful!', Colors.green);
    } catch (e) {
      showSnackbar('Error', 'Apple login failed: ${e.toString()}', Colors.red);
    } finally {
      isLoading = false;
    }
  }

  // Navigate to forgot password
  void navigateToForgotPassword() {
    // Uncomment when you have the actual screen
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ForgotPassword(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
      ),
    );

    // Temporary placeholder
    showSnackbar('Info', 'Navigate to Forgot Password', Colors.blue);
  }

  // Navigate to sign up
  void navigateToSignUp() {
    // Uncomment when you have the actual screen
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
      ),
    );

    // Temporary placeholder
    showSnackbar('Info', 'Navigate to Sign Up', Colors.blue);
  }

  // Navigate to terms of service
  void navigateToTermsOfService() {
    showSnackbar('Info', 'Navigate to Terms of Service', Colors.blue);
  }

  // Navigate to privacy policy
  void navigateToPrivacyPolicy() {
    showSnackbar('Info', 'Navigate to Privacy Policy', Colors.blue);
  }
}
