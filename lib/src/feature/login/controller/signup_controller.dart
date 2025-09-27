// import 'dart:developer';
// import 'dart:math' hide log;
// import 'package:convo_hearts/login/utils/login_screen.dart';
// import 'package:convo_hearts/login/utils/verfy_email.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// enum SignUpState { idle, checking, sendingOTP, verifying, creating }

// class SignUpController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email', 'profile'],
//   );
  
//   // Form Controllers
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
//   // Observable States
//   var obscurePassword = true.obs;
//   var obscureConfirmPassword = true.obs;
//   var currentState = SignUpState.idle.obs;
//   var isLoading = false.obs;
  
//   // Temporary data storage
//   String? tempEmail;
//   String? tempPassword;
//   String? generatedOTP;
//   DateTime? otpGeneratedTime;
  
//   // Configuration
//   static const String _senderEmail = 'ali.sachal0322@gmail.com';
//   static const String _senderPassword = 'nvoo lbqg fvdx rohj';
//   static const String _appName = 'ConvoHearts';
//   static const int _otpValidityMinutes = 10;

//   // Computed properties
//   bool get isProcessing => currentState.value != SignUpState.idle;
//   bool get canResendOTP => generatedOTP != null && 
//       otpGeneratedTime != null && 
//       DateTime.now().difference(otpGeneratedTime!).inMinutes >= 1;
//   bool get hasValidSession => tempEmail != null && tempPassword != null;
//   String get sessionEmail => tempEmail ?? '';
//   Duration get otpTimeRemaining {
//     if (otpGeneratedTime == null) return Duration.zero;
//     final elapsed = DateTime.now().difference(otpGeneratedTime!);
//     final remaining = Duration(minutes: _otpValidityMinutes) - elapsed;
//     return remaining.isNegative ? Duration.zero : remaining;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     log('SignUpController initialized');
//   }

//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     clearTempData();
//     super.onClose();
//   }

//   // UI State Management
//   void togglePasswordVisibility() {
//     obscurePassword.value = !obscurePassword.value;
//   }

//   void toggleConfirmPasswordVisibility() {
//     obscureConfirmPassword.value = !obscureConfirmPassword.value;
//   }

//   void _setLoading(bool loading) {
//     isLoading.value = loading;
//   }

//   void _setState(SignUpState state) {
//     currentState.value = state;
//     _setLoading(state != SignUpState.idle);
//   }




//   // Validation Methods
//   String? validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Please enter your email';
//     }
//     if (!GetUtils.isEmail(value.trim())) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }

//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your password';
//     }
//     if (value.length < 12) {
//       return 'Password must be at least 12 characters';
//     }
//     if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]').hasMatch(value)) {
//       return 'Password must include uppercase, lowercase, numbers & special characters';
//     }
//     return null;
//   }

//   String? validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please confirm your password';
//     }
//     if (value != passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

//   bool _validateInputs() {
//     return formKey.currentState?.validate() ?? false;
//   }

//   // Data Management
//   void clearForm() {
//     emailController.clear();
//     passwordController.clear();
//     confirmPasswordController.clear();
//     formKey.currentState?.reset();
//   }

//   void clearTempData() {
//     tempEmail = null;
//     tempPassword = null;
//     generatedOTP = null;
//     otpGeneratedTime = null;
//   }

//   void _storeTempData() {
//     tempEmail = emailController.text.trim();
//     tempPassword = passwordController.text;
//     log('Stored temporary data for email: $tempEmail');
//   }

//   // Email Registration Check
//   Future<bool> _isEmailAlreadyRegistered(String email) async {
//     try {
//       log('Checking if email is already registered: $email');
//       _setState(SignUpState.checking);
      
//       List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
//       bool isRegistered = signInMethods.isNotEmpty;
      
//       log('Email registration status: $isRegistered (methods: $signInMethods)');
      
//       // Always set state back to idle after checking
//       _setState(SignUpState.idle);
      
//       return isRegistered;
      
//     } catch (e) {
//       log('Error checking email registration: $e');
//       _setState(SignUpState.idle);
//       _showErrorMessage('Failed to verify email. Please check your connection and try again.');
//       return false;
//     }
//   }

//   // Generate OTP with better randomness
//   String _generateOTP() {
//     final random = Random.secure(); // Use secure random for better security
//     String otp = '';
//     for (int i = 0; i < 6; i++) {
//       otp += random.nextInt(10).toString();
//     }
//     log('Generated secure OTP with length: ${otp.length}');
//     return otp;
//   }

//   bool _isOTPExpired() {
//     if (otpGeneratedTime == null) return true;
//     return DateTime.now().difference(otpGeneratedTime!).inMinutes > _otpValidityMinutes;
//   }

//   // Email Sending
//   Future<bool> _sendOTPEmail(String email, String otp) async {
//     try {
//       log('Configuring SMTP server for Gmail');
//       final smtpServer = gmail(_senderEmail, _senderPassword);
      
//       log('Creating email message with OTP: $otp');
//       final message = Message()
//         ..from = Address(_senderEmail, _appName)
//         ..recipients.add(email)
//         ..subject = '$_appName - Email Verification Code'
//         ..html = _getEmailTemplate(otp);

//       log('Attempting to send email...');
//       final sendReport = await send(message, smtpServer);
//       log('Email sent successfully: ${sendReport.toString()}');
//       return true;
      
//     } catch (e) {
//       log('Error sending email: $e');
//       return false;
//     }
//   }

//   String _getEmailTemplate(String otp) {
//     return '''
//     <html>
//       <body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5;">
//         <div style="max-width: 600px; margin: 0 auto; background-color: white; border-radius: 10px; padding: 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
//           <div style="text-align: center; margin-bottom: 30px;">
//             <h1 style="color: #333; margin: 0;">$_appName</h1>
//             <p style="color: #666; margin: 10px 0 0 0;">Email Verification</p>
//           </div>
          
//           <div style="text-align: center; margin-bottom: 30px;">
//             <div style="background-color: #f8f9fa; border-radius: 50%; width: 80px; height: 80px; margin: 0 auto 20px auto; display: flex; align-items: center; justify-content: center;">
//               <span style="font-size: 40px;">📧</span>
//             </div>
//             <h2 style="color: #333; margin: 0 0 10px 0;">Verify Your Email Address</h2>
//             <p style="color: #666; margin: 0; line-height: 1.5;">
//               Please use the verification code below to complete your registration:
//             </p>
//           </div>
          
//           <div style="text-align: center; margin: 30px 0;">
//             <div style="background-color: #007bff; color: white; font-size: 32px; font-weight: bold; letter-spacing: 8px; padding: 20px; border-radius: 8px; display: inline-block; font-family: monospace;">
//               $otp
//             </div>
//           </div>
          
//           <div style="background-color: #fff3cd; border: 1px solid #ffeaa7; border-radius: 8px; padding: 15px; margin: 20px 0;">
//             <p style="margin: 0; color: #856404; font-size: 14px;">
//               <strong>Important:</strong> This code will expire in $_otpValidityMinutes minutes for security reasons.
//             </p>
//           </div>
          
//           <div style="text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid #eee;">
//             <p style="color: #999; font-size: 12px; margin: 0;">
//               If you didn't request this verification code, please ignore this email.
//             </p>
//             <p style="color: #999; font-size: 12px; margin: 5px 0 0 0;">
//               © 2025 $_appName. All rights reserved.
//             </p>
//           </div>
//         </div>
//       </body>
//     </html>
//     ''';
//   }

//   // Message Display Methods
//   void _showSuccessMessage(String message, {int seconds = 3}) {
//     Get.snackbar(
//       'Success',
//       message,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//       duration: Duration(seconds: seconds),
//       snackPosition: SnackPosition.TOP,
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
//     );
//   }


// Future<void> _saveUserToFirestore(User user) async {
//   try {
//     final firestore = FirebaseFirestore.instance;

//     await firestore.collection('users').doc(user.uid).set({
//       'uid': user.uid,
//       'email': user.email,
//       'createdAt': FieldValue.serverTimestamp(),
//       'isVerified': user.emailVerified,
//     });

//     log('✅ User data saved to Firestore');
//   } catch (e) {
//     log('❌ Error saving user data to Firestore: $e');
//     _showErrorMessage('Failed to save user data.');
//   }
// }



//   // Main Sign Up Flow - FIXED VERSION
//   Future<void> onEmailSignUp() async {
//     if (!_validateInputs()) return;
    
//     try {
//       final email = emailController.text.trim();
      
//       // Step 1: Check if email is already registered
//       bool isRegistered = await _isEmailAlreadyRegistered(email);
      
//       if (isRegistered) {
//         _setState(SignUpState.idle);
//         _showInfoMessage(
//           'This email is already registered. Taking you to login...',
//           seconds: 3
//         );
        
//         // Clear form before navigating
//         clearForm();
        
//         // Wait for 2 seconds then navigate to login
//         await Future.delayed(Duration(seconds: 2));
        
//         Get.off(
//           () => LoginScreen(),
//           transition: Transition.leftToRight,
//           duration: Duration(milliseconds: 800)
//         );
//         return;
//       }
      
//       // Step 2: Store temporary data
//       _storeTempData();
      
//       // Step 3: Generate and send OTP
//       bool otpSent = await sendOTPToEmail();
      
//       if (otpSent) {
//         // Step 4: Clear form and navigate to verification
//         clearForm();
//         _setState(SignUpState.idle);
        
//         _showSuccessMessage('Verification code sent to $email');
        
//         // Navigate to email verification screen
//         Get.to(
//           () => VerifyEmail(), 
//           transition: Transition.rightToLeft, 
//           duration: Duration(milliseconds: 800)
//         );
//       } else {
//         // Clear temp data if OTP sending failed
//         clearTempData();
//         _setState(SignUpState.idle);
//       }
      
//     } catch (e) {
//       log('Error in onEmailSignUp: $e');
//       _setState(SignUpState.idle);
//       clearTempData();
//       _showErrorMessage('Something went wrong. Please try again.');
//     }
//   }

//   // Send OTP to stored email
//   Future<bool> sendOTPToEmail() async {
//     if (tempEmail == null) {
//       _showErrorMessage('Session expired. Please try again.');
//       return false;
//     }
    
//     try {
//       log('Starting OTP send process for: $tempEmail');
//       _setState(SignUpState.sendingOTP);
      
//       // Generate new OTP
//       generatedOTP = _generateOTP();
//       otpGeneratedTime = DateTime.now();
//       log('Generated OTP: $generatedOTP at ${otpGeneratedTime.toString()}');
      
//       // Send OTP via email
//       bool emailSent = await _sendOTPEmail(tempEmail!, generatedOTP!);
      
//       if (!emailSent) {
//         _showErrorMessage(
//           'Failed to send verification email. Please check your internet connection and try again.',
//           seconds: 5
//         );
//         generatedOTP = null;
//         otpGeneratedTime = null;
//       }
      
//       return emailSent;
      
//     } catch (e) {
//       log('Error in _sendOTPToEmail: $e');
//       _showErrorMessage('Failed to send OTP: ${e.toString()}');
//       generatedOTP = null;
//       otpGeneratedTime = null;
//       return false;
//     }
//   }

//   // Resend OTP
//   Future<void> resendOTP() async {
//     if (!canResendOTP) {
//       _showInfoMessage('Please wait before requesting a new code.');
//       return;
//     }
    
//     bool sent = await sendOTPToEmail();
//     if (sent) {
//       _showSuccessMessage('New verification code sent to $tempEmail');
//     }
//   }

//   // Enhanced OTP verification with better logging
//   bool verifyOTP(String enteredOTP) {
//     try {
//       log('=== Starting OTP Verification ===');
//       log('Entered OTP: $enteredOTP');
//       log('Stored OTP: $generatedOTP');
//       log('OTP Generated Time: $otpGeneratedTime');
//       log('Current Time: ${DateTime.now()}');
      
//       if (generatedOTP == null) {
//         log('❌ No OTP found in memory');
//         _showErrorMessage('No OTP found. Please request a new one.');
//         return false;
//       }

//       if (_isOTPExpired()) {
//         log('❌ OTP has expired');
//         // final timeRemaining = otpTimeRemaining;
//         _showErrorMessage('OTP has expired. Please request a new one.');
//         generatedOTP = null;
//         otpGeneratedTime = null;
//         return false;
//       }

//       final cleanEnteredOTP = enteredOTP.trim();
//       bool isValid = generatedOTP == cleanEnteredOTP;
      
//       log('Clean entered OTP: $cleanEnteredOTP');
//       log('OTP Match: $isValid');
//       log('=== OTP Verification Complete ===');
      
//       if (!isValid) {
//         _showErrorMessage('Invalid OTP. Please check and try again.');
//       } else {
//         _showSuccessMessage('OTP verified successfully!', seconds: 2);
//       }
      
//       return isValid;
//     } catch (e) {
//       log('❌ Error verifying OTP: $e');
//       _showErrorMessage('Failed to verify OTP. Please try again.');
//       return false;
//     }
//   }

//   // Create Firebase Account
//   // Future<bool> createFirebaseAccount() async {
//   //   if (tempEmail == null || tempPassword == null) {
//   //     _showErrorMessage('Session expired. Please sign up again.');
//   //     return false;
//   //   }

//   //   try {
//   //     _setState(SignUpState.creating);
//   //     log('Creating Firebase account for: $tempEmail');
      
//   //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//   //       email: tempEmail!,
//   //       password: tempPassword!,
//   //     );
      
//   //     if (userCredential.user != null) {
//   //       log('Firebase account created successfully');
        
//   //       // Clear all data
//   //       clearTempData();
//   //       _setState(SignUpState.idle);
        
//   //       _showSuccessMessage('Account created successfully! Welcome to $_appName!');
        
//   //       // Navigate to home screen
//   //       // Get.offAll(() => HomeScreen());
        
//   //       return true;
//   //     }
//   //     return false;
      
//   //   } on FirebaseAuthException catch (e) {
//   //     log('Firebase Auth Error: ${e.code} - ${e.message}');
//   //     _setState(SignUpState.idle);
      
//   //     String message = _getFirebaseErrorMessage(e.code);
//   //     _showErrorMessage(message);
//   //     return false;
//   //   } catch (e) {
//   //     log('General Error: $e');
//   //     _setState(SignUpState.idle);
//   //     _showErrorMessage('Something went wrong. Please try again.');
//   //     return false;
//   //   }
//   // }


// Future<bool> createFirebaseAccount() async {
//   if (tempEmail == null || tempPassword == null) {
//     _showErrorMessage('Session expired. Please sign up again.');
//     return false;
//   }

//   try {
//     _setState(SignUpState.creating);
//     log('Creating Firebase account for: $tempEmail');

//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: tempEmail!,
//       password: tempPassword!,
//     );

//     final user = userCredential.user;

//     if (user != null) {
//       // ✅ Save user to Firestore
//       await _saveUserToFirestore(user);

//       log('Firebase account created and data saved successfully');
//       clearTempData();
//       _setState(SignUpState.idle);

//       _showSuccessMessage('Account created successfully! Welcome to $_appName!');

//       // Navigate to home screen
//       // Get.offAll(() => HomeScreen());

//       return true;
//     }

//     return false;

//   } on FirebaseAuthException catch (e) {
//     log('Firebase Auth Error: ${e.code} - ${e.message}');
//     _setState(SignUpState.idle);
//     String message = _getFirebaseErrorMessage(e.code);
//     _showErrorMessage(message);
//     return false;

//   } catch (e) {
//     log('General Error: $e');
//     _setState(SignUpState.idle);
//     _showErrorMessage('Something went wrong. Please try again.');
//     return false;
//   }
// }






//   String _getFirebaseErrorMessage(String code) {
//     switch (code) {
//       case 'weak-password':
//         return 'The password provided is too weak.';
//       case 'email-already-in-use':
//         return 'An account already exists with this email.';
//       case 'invalid-email':
//         return 'The email address is not valid.';
//       case 'operation-not-allowed':
//         return 'Email/password accounts are not enabled.';
//       default:
//         return 'An error occurred during account creation';
//     }
//   }

//   // Social Sign Up Methods
//   Future<void> onGoogleSignUp() async {
//     try {
//       _setState(SignUpState.creating);
      
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         _setState(SignUpState.idle);
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       UserCredential userCredential = await _auth.signInWithCredential(credential);
      
//       if (userCredential.user != null) {
//         clearForm();
//         clearTempData();
//         _setState(SignUpState.idle);
        
//         _showSuccessMessage('Signed up with Google successfully!');
        
//         // Navigate to home screen
//         // Get.offAll(() => HomeScreen());
//       }
      
//     } on FirebaseAuthException catch (e) {
//       _setState(SignUpState.idle);
//       _showErrorMessage(e.message ?? 'Google sign up failed');
//     } catch (e) {
//       _setState(SignUpState.idle);
//       _showErrorMessage('Something went wrong with Google sign up.');
//     }
//   }

//   Future<void> onAppleSignUp() async {
//     try {
//       _setState(SignUpState.creating);
      
//       final credential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );

//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: credential.identityToken,
//         accessToken: credential.authorizationCode,
//       );

//       UserCredential userCredential = await _auth.signInWithCredential(oauthCredential);
      
//       if (userCredential.user != null) {
//         clearForm();
//         clearTempData();
//         _setState(SignUpState.idle);
        
//         _showSuccessMessage('Signed up with Apple successfully!');
        
//         // Navigate to home screen
//         // Get.offAll(() => HomeScreen());
//       }
      
//     } on FirebaseAuthException catch (e) {
//       _setState(SignUpState.idle);
//       _showErrorMessage(e.message ?? 'Apple sign up failed');
//     } catch (e) {
//       _setState(SignUpState.idle);
//       _showErrorMessage('Something went wrong with Apple sign up.');
//     }
//   }

//   // Navigation Methods
//   void onTermsOfServiceTap() {
//     // Navigate to Terms of Service
//     // Get.to(() => TermsOfServiceScreen());
//   }

//   void onPrivacyPolicyTap() {
//     // Navigate to Privacy Policy
//     // Get.to(() => PrivacyPolicyScreen());
//   }

//   void navigateToLogin() {
//     clearForm();
//     clearTempData();
//     Get.off(
//       () => LoginScreen(), 
//       transition: Transition.downToUp, 
//       duration: Duration(milliseconds: 800)
//     );
//   }

//   // Debug and utility methods
//   void debugPrintOTPState() {
//     log('=== OTP Debug State ===');
//     log('Generated OTP: $generatedOTP');
//     log('OTP Generated Time: $otpGeneratedTime');
//     log('Current Time: ${DateTime.now()}');
//     log('Is OTP Expired: ${_isOTPExpired()}');
//     log('Can Resend OTP: $canResendOTP');
//     log('OTP Time Remaining: ${otpTimeRemaining.inMinutes} minutes');
//     log('Temp Email: $tempEmail');
//     log('Has Valid Session: $hasValidSession');
//     log('Current State: ${currentState.value}');
//     log('====================');
//   }

//   // Method to manually clear expired OTP
//   void clearExpiredOTP() {
//     if (_isOTPExpired()) {
//       log('Clearing expired OTP');
//       generatedOTP = null;
//       otpGeneratedTime = null;
//       _showInfoMessage('Previous verification code has expired.');
//     }
//   }
// }