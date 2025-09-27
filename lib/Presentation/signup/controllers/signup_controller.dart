import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../src/feature/login/utils/signup_screen.dart' show SignUpState;

class SignupController extends GetxController {
  //TODO: Implement SignupController

  // Firebase and Auth instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  // Form Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // State variables
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  SignUpState currentState = SignUpState.idle;
  bool isLoading = false;

  // Temporary data storage
  String? tempEmail;
  String? tempPassword;
  String? generatedOTP;
  DateTime? otpGeneratedTime;

  // Configuration
  static const String senderEmail = 'ali.sachal0322@gmail.com';
  static const String senderPassword = 'nvoo lbqg fvdx rohj';
  static const String appName = 'ConvoHearts';
  static const int otpValidityMinutes = 10;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
