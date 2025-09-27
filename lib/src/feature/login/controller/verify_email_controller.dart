// import 'dart:async';
// import 'dart:developer';
// import 'package:convo_hearts/login/controller/signup_controller.dart';
// import 'package:convo_hearts/Profile-Creation/profile_creation1.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// enum VerificationState { idle, verifying, creating, resending }

// class VerifyEmailController extends GetxController {
//   // Observable variables
//   final RxInt start = 20.obs; // Increased to 60 seconds
//   final RxBool canResend = false.obs;
//   final RxString pinCode = ''.obs;
//   final RxString userEmail = ''.obs;
  
//   final Rx<VerificationState> currentState = VerificationState.idle.obs;

//   // Get the SignUpController instance
//   final SignUpController signUpController = Get.find<SignUpController>();

//   Timer? _timer;
//   int _resendAttempts = 0;
//   static const int _maxResendAttempts = 3;
//   static const int _initialTimerSeconds = 20;
//   static const int _resendPenaltySeconds = 120; // 2 minutes penalty after max attempts

//   @override
//   void onInit() {
//     super.onInit();
//     _initializeController();
//   }

//   @override
//   void onClose() {
//     _timer?.cancel();
//     super.onClose();
//   }

//   // Computed properties
//   bool get isProcessing => currentState.value != VerificationState.idle;
//   bool get canAttemptResend => canResend.value && _resendAttempts < _maxResendAttempts;
//   String get resendButtonText {
//     if (!canResend.value) return 'Resend in ${formattedTime}';
//     if (_resendAttempts >= _maxResendAttempts) return 'Max attempts reached';
//     return 'Resend Code';
//   }

//   void _initializeController() {
//     // Validate SignUpController state
//     if (!_validateSignUpControllerState()) {
//       _handleSessionExpired();
//       return;
//     }

//     // Set user email from SignUpController
//     userEmail.value = signUpController.tempEmail!;
//     log("VerifyEmailController initialized for email: ${userEmail.value}");
    
//     // Start the countdown timer
//     startTimer();
    
//     // Show initial instructions
//     _showWelcomeMessage();
//   }

//   bool _validateSignUpControllerState() {
//     return signUpController.tempEmail != null && 
//            signUpController.tempEmail!.isNotEmpty &&
//            signUpController.tempPassword != null &&
//            signUpController.generatedOTP != null;
//   }

//   void _handleSessionExpired() {
//     log("Session expired - SignUpController state invalid");
//     _showErrorMessage(
//       'Your session has expired. Please start the sign-up process again.',
//       seconds: 5
//     );
    
//     // Navigate back to signup after delay
//     Future.delayed(Duration(seconds: 2), () {
//       signUpController.navigateToLogin();
//     });
//   }

//   void _showWelcomeMessage() {
//     _showInfoMessage(
//       'We\'ve sent a 6-digit verification code to ${getMaskedEmail()}',
//       seconds: 4
//     );
//   }

//   void startTimer({int? customSeconds}) {
//     int timerSeconds = customSeconds ?? _initialTimerSeconds;
    
//     // If max attempts reached, use penalty time
//     if (_resendAttempts >= _maxResendAttempts) {
//       timerSeconds = _resendPenaltySeconds;
//     }
    
//     start.value = timerSeconds;
//     canResend.value = false;
    
//     _timer?.cancel(); // Cancel any existing timer
    
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (start.value == 0) {
//         canResend.value = true;
//         timer.cancel();
//         log("Timer completed - resend now available");
//       } else {
//         start.value--;
//       }
//     });
    
//     log("Timer started for $timerSeconds seconds");
//   }

//   void onPinCompleted(String pin) {
//     pinCode.value = pin;
//     log("PIN completed: ${pin.length} digits entered");
//     verifyPin(pin);
//   }

//   void verifyPin(String pin) async {
//     if (isProcessing) {
//       log("Verification already in progress, ignoring duplicate request");
//       return;
//     }

//     log("Starting PIN verification: $pin");
    
//     // Validate input format
//     if (!_validatePinFormat(pin)) return;
    
//     // Validate session state
//     if (!_validateSignUpControllerState()) {
//       _handleSessionExpired();
//       return;
//     }
    
//     try {
//       currentState.value = VerificationState.verifying;
      
//       log("Verifying OTP - Expected: ${signUpController.generatedOTP}, Entered: ${pin.trim()}");
      
//       // Use SignUpController's verifyOTP method
//       bool isValid = signUpController.verifyOTP(pin);
      
//       if (isValid) {
//         await _handleSuccessfulVerification();
//       } else {
//         _handleFailedVerification();
//       }
      
//     } catch (e) {
//       log('Error during PIN verification: $e');
//       _handleVerificationError(e);
//     } finally {
//       if (currentState.value == VerificationState.verifying) {
//         currentState.value = VerificationState.idle;
//       }
//     }
//   }

//   bool _validatePinFormat(String pin) {
//     if (pin.isEmpty || pin.length != 6) {
//       _showErrorMessage('Please enter a valid 6-digit verification code.');
//       return false;
//     }
    
//     if (!RegExp(r'^\d{6}$').hasMatch(pin)) {
//       _showErrorMessage('Verification code must contain only numbers.');
//       return false;
//     }
    
//     return true;
//   }

//   Future<void> _handleSuccessfulVerification() async {
//     log("PIN verification successful for email: ${signUpController.tempEmail}");
    
//     // Stop the timer since verification is successful
//     _timer?.cancel();
//     canResend.value = false;
    
//     _showSuccessMessage('Email verified successfully! Creating your account...', seconds: 2);
    
//     // Create Firebase account
//     await _createUserAccount();
//   }

//   void _handleFailedVerification() {
//     log("PIN verification failed");
    
//     // Clear the entered PIN for re-entry
//     pinCode.value = '';
    
//     _showErrorMessage('Invalid verification code. Please check and try again.');
//   }

//   void _handleVerificationError(dynamic error) {
//     log("Verification error: $error");
//     pinCode.value = '';
//     _showErrorMessage('Verification failed. Please try again.');
//   }

//   Future<void> _createUserAccount() async {
//     try {
//       currentState.value = VerificationState.creating;
//       log("Creating Firebase account for: ${signUpController.tempEmail}");
      
//       bool accountCreated = await signUpController.createFirebaseAccount();
      
//       if (accountCreated) {
//         log("Account created successfully");
//         _navigateToNextScreen();
//       } else {
//         log("Failed to create Firebase account");
//         currentState.value = VerificationState.idle;
//         _showErrorMessage(
//           'Failed to create account. Please try the verification again.',
//           seconds: 4
//         );
//       }
      
//     } catch (e) {
//       log('Error creating account: $e');
//       currentState.value = VerificationState.idle;
//       _showErrorMessage('Account creation failed. Please try again.');
//     }
//   }

//   void _navigateToNextScreen() {
//     // Navigate to profile creation or home screen
//     Get.offAll(
//       () => ProfileCreation(),
//       transition: Transition.rightToLeft,
//       duration: Duration(milliseconds: 800)
//     );
//   }

//   Future<void> resendCode() async {
//     if (isProcessing) {
//       log("Another operation in progress, ignoring resend request");
//       return;
//     }

//     // Validate resend eligibility
//     if (!_canResendCode()) return;
    
//     // Validate session
//     if (!_validateSignUpControllerState()) {
//       _handleSessionExpired();
//       return;
//     }

//     try {
//       currentState.value = VerificationState.resending;
//       _resendAttempts++;
      
//       log("Attempting to resend code (attempt $_resendAttempts/$_maxResendAttempts) to: ${signUpController.tempEmail}");
      
//       // Start timer immediately to prevent spam
//       startTimer();
      
//       // Use SignUpController's resend method
//       await signUpController.resendOTP();
      
//       _showSuccessMessage(
//         'Verification code sent to ${getMaskedEmail()}',
//         seconds: 3
//       );
      
//     } catch (e) {
//       log('Error in resendCode: $e');
//       _handleResendError();
//     } finally {
//       currentState.value = VerificationState.idle;
//     }
//   }

//   bool _canResendCode() {
//     if (!canResend.value) {
//       _showInfoMessage(
//         'Please wait ${formattedTime} before requesting a new code.',
//         seconds: 2
//       );
//       return false;
//     }

//     if (_resendAttempts >= _maxResendAttempts) {
//       _showErrorMessage(
//         'Maximum resend attempts reached. Please wait ${_formatTime(_resendPenaltySeconds)} or restart the sign-up process.',
//         seconds: 5
//       );
//       return false;
//     }

//     return true;
//   }

//   void _handleResendError() {
//     // If sending failed, allow user to try again sooner
//     _timer?.cancel();
//     start.value = 30; // Shorter retry time on failure
//     canResend.value = false;
//     startTimer(customSeconds: 30);
    
//     _showErrorMessage('Failed to resend code. Please try again in 30 seconds.');
//   }

//   // Navigation methods
//   void goBackToSignUp() {
//     _timer?.cancel();
//     signUpController.clearTempData();
//     Get.back();
//   }

//   void restartSignUpProcess() {
//     _timer?.cancel();
//     signUpController.clearTempData();
//     signUpController.navigateToLogin();
//   }

//   // Email masking method - improved version
//   String getMaskedEmail() {
//     String email = signUpController.tempEmail ?? "";
    
//     if (email.isEmpty) {
//       return "****@****.com";
//     }
    
//     try {
//       List<String> parts = email.split('@');
//       if (parts.length != 2) {
//         return "****@****.com";
//       }
      
//       String username = parts[0];
//       String domain = parts[1];
      
//       // Mask username - show first 2 and last 2 characters
//       String maskedUsername;
//       if (username.length <= 4) {
//         maskedUsername = username.substring(0, 1) + "***" + username.substring(username.length - 1);
//       } else {
//         String first = username.substring(0, 2);
//         String last = username.substring(username.length - 2);
//         maskedUsername = first + "***" + last;
//       }
      
//       // Mask domain - show first character and extension
//       List<String> domainParts = domain.split('.');
//       String maskedDomain = domainParts[0].substring(0, 1) + "***." + domainParts.sublist(1).join('.');
      
//       return maskedUsername + "@" + maskedDomain;
      
//     } catch (e) {
//       log('Error masking email: $e');
//       return "****@****.com";
//     }
//   }

//   // Time formatting methods
//   String get formattedTime => _formatTime(start.value);
  
//   String _formatTime(int seconds) {
//     int minutes = seconds ~/ 60;
//     int remainingSeconds = seconds % 60;
//     return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
//   }

//   // Message display methods
//   void _showSuccessMessage(String message, {int seconds = 3}) {
//     Get.snackbar(
//       'Success',
//       message,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//       duration: Duration(seconds: seconds),
//       snackPosition: SnackPosition.TOP,
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   }

//   void _showErrorMessage(String message, {int seconds = 4}) {
//     Get.snackbar(
//       'Error',
//       message,
//       backgroundColor: Colors.red,
//       colorText: Colors.white,
//       duration: Duration(seconds: seconds),
//       snackPosition: SnackPosition.TOP,
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   }

//   void _showInfoMessage(String message, {int seconds = 3}) {
//     Get.snackbar(
//       'Info',
//       message,
//       backgroundColor: Colors.blue,
//       colorText: Colors.white,
//       duration: Duration(seconds: seconds),
//       snackPosition: SnackPosition.TOP,
//       margin: EdgeInsets.all(16),
//       borderRadius: 8,
//     );
//   }

//   // Debug methods
//   void debugPrintState() {
//     log('=== VerifyEmailController Debug State ===');
//     log('Current State: ${currentState.value}');
//     log('User Email: ${userEmail.value}');
//     log('Can Resend: ${canResend.value}');
//     log('Timer: ${start.value}');
//     log('Resend Attempts: $_resendAttempts/$_maxResendAttempts');
//     log('SignUp Controller Email: ${signUpController.tempEmail}');
//     log('SignUp Controller OTP: ${signUpController.generatedOTP}');
//     log('==========================================');
//   }
// }