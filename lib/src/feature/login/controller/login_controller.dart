// // lib/controllers/login_controller.dart
// import 'package:convo_hearts/Profile-Creation/profile_creation1.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:convo_hearts/login/utils/forgot_password.dart';
// import 'package:convo_hearts/login/utils/signup_screen.dart';

// class LoginController extends GetxController {
//   // Text editing controllers
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
  
//   // Scroll controller for smooth scrolling
//   final ScrollController scrollController = ScrollController();
  
//   // Observable variables
//   final RxBool obscurePassword = true.obs;
//   final RxBool isLoading = false.obs;
  
//   // Toggle password visibility
//   void togglePasswordVisibility() {
//     obscurePassword.value = !obscurePassword.value;
//   }
  
//   // Handle login

// Future<void> handleLogin() async {
//   if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//     Get.snackbar(
//       'Error',
//       'Please fill in all fields',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red.withOpacity(0.8),
//       colorText: Colors.white,
//       duration: Duration(seconds: 3),
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//     return;
//   }

//   try {
//     isLoading.value = true;

//     // Firebase login logic
//     final email = emailController.text.trim();
//     final password = passwordController.text;

//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     // Login successful
//     Get.snackbar(
//       'Success',
//       'Login successful!',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green.withOpacity(0.8),
//       colorText: Colors.white,
//       duration: Duration(seconds: 3),
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );

//     // Navigate to home screen (Uncomment if exists)
//     Get.to(()=> ProfileCreation());

//   } on FirebaseAuthException catch (e) {
//     String errorMsg = 'Login failed';

//     if (e.code == 'user-not-found') {
//       errorMsg = 'No user found for that email.';
//     } else if (e.code == 'wrong-password') {
//       errorMsg = 'Incorrect password.';
//     } else {
//       errorMsg = e.message ?? 'Login failed. Please try again.';
//     }

//     Get.snackbar(
//       'Error',
//       errorMsg,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red.withOpacity(0.8),
//       colorText: Colors.white,
//       duration: Duration(seconds: 3),
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   } catch (e) {
//     Get.snackbar(
//       'Error',
//       'Login failed: ${e.toString()}',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red.withOpacity(0.8),
//       colorText: Colors.white,
//       duration: Duration(seconds: 3),
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   } finally {
//     isLoading.value = false;
//   }
// }
  
//   // Handle Google login
//   Future<void> handleGoogleLogin() async {
//     try {
//       isLoading.value = true;
      
//       // Add your Google login logic here
//       await Future.delayed(Duration(seconds: 1)); // Simulate API call
      
//       Get.snackbar(
//         'Success',
//         'Google login successful!',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green.withOpacity(0.8),
//         colorText: Colors.white,
//         duration: Duration(seconds: 3),
//         margin: EdgeInsets.all(16),
//         borderRadius: 8,
//       );
      
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Google login failed: ${e.toString()}',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.8),
//         colorText: Colors.white,
//         duration: Duration(seconds: 3),
//         margin: EdgeInsets.all(16),
//         borderRadius: 8,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
  
//   // Handle Apple login
//   Future<void> handleAppleLogin() async {
//     try {
//       isLoading.value = true;
      
//       // Add your Apple login logic here
//       await Future.delayed(Duration(seconds: 1)); // Simulate API call
      
//       Get.snackbar(
//         'Success',
//         'Apple login successful!',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green.withOpacity(0.8),
//         colorText: Colors.white,
//         duration: Duration(seconds: 3),
//         margin: EdgeInsets.all(16),
//         borderRadius: 8,
//       );
      
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Apple login failed: ${e.toString()}',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.8),
//         colorText: Colors.white,
//         duration: Duration(seconds: 3),
//         margin: EdgeInsets.all(16),
//         borderRadius: 8,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
  
//   // Navigate to forgot password
//   void navigateToForgotPassword() {
    
//     Get.to(() => ForgotPassword(),
//       transition: Transition.rightToLeft,
//       duration: Duration(milliseconds: 300),
//     );
//   }
  
//   // Navigate to sign up
//   void navigateToSignUp() {
//     Get.to(() => SignUpScreen(),
//       transition: Transition.rightToLeft,
//       duration: Duration(milliseconds: 300),
//     );
//   }
  
//   // Navigate to terms of service
//   void navigateToTermsOfService() {
//     // Add navigation logic for terms of service
//     Get.snackbar(
//       'Info', 
//       'Navigate to Terms of Service',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.blue.withOpacity(0.8),
//       colorText: Colors.white,
//       duration: Duration(seconds: 2),
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   }
  
//   // Navigate to privacy policy
//   void navigateToPrivacyPolicy() {
//     // Add navigation logic for privacy policy
//     Get.snackbar(
//       'Info', 
//       'Navigate to Privacy Policy',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.blue.withOpacity(0.8),
//       colorText: Colors.white,
//       duration: Duration(seconds: 2),
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   }
  
//   // Smooth scroll to top
//   void scrollToTop() {
//     scrollController.animateTo(
//       0,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
  
//   // Smooth scroll to bottom
//   void scrollToBottom() {
//     scrollController.animateTo(
//       scrollController.position.maxScrollExtent,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
  
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     scrollController.dispose();
//     super.onClose();
//   }
// }