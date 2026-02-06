import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ForgotPasswordState { idle, sendingOTP, verifyingOTP, resettingPassword }

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();

  final Rx<ForgotPasswordState> currentState = ForgotPasswordState.idle.obs;
  final RxBool obscureNewPassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;
  final RxString userEmail = ''.obs;
  final RxString generatedOTP = ''.obs;
  final RxInt otpTimer = 60.obs;
  final RxBool canResendOTP = false.obs;

  Timer? _timer;
  int _resendAttempts = 0;
  static const int _maxResendAttempts = 3;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  get formKey => null;

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    _timer?.cancel();
    super.onClose();
  }

  String? validateEmail(String? value) {
    log('Validating email: $value');
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!GetUtils.isEmail(value)) return 'Please enter a valid email address';
    return null;
  }

  String? validatePassword(String? value) {
    log('Validating password');
    if (value == null || value.isEmpty) return 'Please enter a password';
    if (value.length < 8) return 'Password must be at least 8 characters long';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Must have uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(value)) return 'Must have lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Must have number';
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value))
      return 'Must have special character';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    log('Validating confirm password');
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != newPasswordController.text) return 'Passwords do not match';
    return null;
  }

  String? validateOTP(String? value) {
    log('Validating OTP: $value');
    if (value == null || value.isEmpty) return 'Enter the OTP';
    if (value.length != 6 || !RegExp(r'^\d{6}\$').hasMatch(value))
      return 'OTP must be 6 digits';
    return null;
  }

  void toggleNewPasswordVisibility() => obscureNewPassword.toggle();
  void toggleConfirmPasswordVisibility() => obscureConfirmPassword.toggle();

  String _generateOTP() {
    final random = math.Random();
    return List.generate(6, (_) => random.nextInt(10).toString()).join();
  }

  Future<void> sendPasswordResetOTP() async {
    if (!emailFormKey.currentState!.validate()) return;
    if (currentState.value != ForgotPasswordState.idle) return;

    try {
      currentState.value = ForgotPasswordState.sendingOTP;
      final email = emailController.text.trim();
      userEmail.value = email;
      log('Checking sign-in methods for: $email');

      final signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      log('Fetched sign-in methods: $signInMethods');

      if (signInMethods.isEmpty || !signInMethods.contains('password')) {
        throw Exception('No account found with email/password method');
      }

      generatedOTP.value = _generateOTP();
      log('Generated OTP: ${generatedOTP.value}');
      await _simulateEmailSending(email, generatedOTP.value);
      startOTPTimer();
      _showSuccessMessage('Code sent to ${_getMaskedEmail(email)}');
      Get.toNamed('/verify-reset-password');
    } catch (e) {
      log('Error in sendPasswordResetOTP: $e');
      _showErrorMessage(e.toString());
    } finally {
      currentState.value = ForgotPasswordState.idle;
    }
  }

  Future<void> verifyOTP() async {
    final enteredOTP = otpController.text.trim();
    final validation = validateOTP(enteredOTP);
    if (validation != null) return _showErrorMessage(validation);

    try {
      currentState.value = ForgotPasswordState.verifyingOTP;
      log('Entered OTP: $enteredOTP | Expected OTP: ${generatedOTP.value}');

      if (enteredOTP == generatedOTP.value) {
        _timer?.cancel();
        _showSuccessMessage('OTP verified successfully');
        Get.toNamed('/reset-password');
      } else {
        otpController.clear();
        _showErrorMessage('Invalid OTP');
      }
    } catch (e) {
      log('Error verifying OTP: $e');
      _showErrorMessage('OTP verification failed');
    } finally {
      currentState.value = ForgotPasswordState.idle;
    }
  }

  Future<void> resetPassword() async {
    if (!resetFormKey.currentState!.validate()) return;

    try {
      currentState.value = ForgotPasswordState.resettingPassword;
      final email = userEmail.value;
      // final password = newPasswordController.text;

      log('Sending reset email to: $email');
      await _auth.sendPasswordResetEmail(email: email);
      _showSuccessMessage('Password reset link sent to your email');

      _clearAllData();
      Get.offAllNamed('/login');
    } catch (e) {
      log('Error resetting password: $e');
      _showErrorMessage('Password reset failed');
    } finally {
      currentState.value = ForgotPasswordState.idle;
    }
  }

  Future<void> resendOTP() async {
    if (!canResendOTP.value || _resendAttempts >= _maxResendAttempts) return;

    try {
      currentState.value = ForgotPasswordState.sendingOTP;
      _resendAttempts++;
      generatedOTP.value = _generateOTP();
      log('Resending OTP: ${generatedOTP.value}');

      await _simulateEmailSending(userEmail.value, generatedOTP.value);
      startOTPTimer();
      _showSuccessMessage('New code sent');
    } catch (e) {
      log('Error resending OTP: $e');
      _showErrorMessage('Could not resend code');
    } finally {
      currentState.value = ForgotPasswordState.idle;
    }
  }

  void startOTPTimer() {
    otpTimer.value = 20;
    canResendOTP.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpTimer.value == 0) {
        timer.cancel();
        canResendOTP.value = true;
        log('OTP timer completed');
      } else {
        otpTimer.value--;
      }
    });
  }

  Future<void> _simulateEmailSending(String email, String otp) async {
    await Future.delayed(Duration(seconds: 2));
    log('Simulated email sent to $email with OTP $otp');
    Get.dialog(
      AlertDialog(
        title: Text('Development Mode'),
        content: Text('OTP sent: $otp'),
        actions: [TextButton(onPressed: () => Get.back(), child: Text('OK'))],
      ),
    );
  }

  void _clearAllData() {
    emailController.clear();
    otpController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    userEmail.value = '';
    generatedOTP.value = '';
    _timer?.cancel();
    _resendAttempts = 0;
  }

  String _getMaskedEmail(String email) {
    try {
      final parts = email.split('@');
      final name = parts[0];
      final domain = parts[1];
      final maskedName = name.length <= 2
          ? "${name[0]}***"
          : "${name.substring(0, 2)}***${name.substring(name.length - 1)}";
      final domainMasked = domain.replaceAll(RegExp(r'[^.]+'), '***');
      return '$maskedName@$domainMasked';
    } catch (_) {
      return '****@****.com';
    }
  }

  void _showSuccessMessage(String msg) => Get.snackbar(
    'Success',
    msg,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
  void _showErrorMessage(String msg) => Get.snackbar(
    'Error',
    msg,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
