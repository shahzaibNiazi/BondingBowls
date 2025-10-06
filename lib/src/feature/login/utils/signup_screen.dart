import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_hearts/src/feature/login/utils/verfy_email.dart';
import 'package:convo_hearts/widgets/Custom_TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'login_screen.dart';

enum SignUpState { idle, checking, sendingOTP, verifying, creating }

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Firebase and Auth instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

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
  static const String _senderEmail = 'ali.sachal0322@gmail.com';
  static const String _senderPassword = 'nvoo lbqg fvdx rohj';
  static const String _appName = 'ConvoHearts';
  static const int _otpValidityMinutes = 10;

  @override
  void initState() {
    super.initState();
    log('SignUpController initialized');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    clearTempData();
    super.dispose();
  }

  // Computed properties
  bool get isProcessing => currentState != SignUpState.idle;
  bool get canResendOTP =>
      generatedOTP != null &&
      otpGeneratedTime != null &&
      DateTime.now().difference(otpGeneratedTime!).inMinutes >= 1;
  bool get hasValidSession => tempEmail != null && tempPassword != null;
  String get sessionEmail => tempEmail ?? '';
  Duration get otpTimeRemaining {
    if (otpGeneratedTime == null) return Duration.zero;
    final elapsed = DateTime.now().difference(otpGeneratedTime!);
    final remaining = Duration(minutes: _otpValidityMinutes) - elapsed;
    return remaining.isNegative ? Duration.zero : remaining;
  }

  // UI State Management
  void togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  // void _setLoading(bool loading) {
  //   setState(() {
  //     isLoading = loading;
  //   });
  // }

  void _setState(SignUpState state) {
    setState(() {
      currentState = state;
      isLoading = state != SignUpState.idle;
    });
  }

  // Validation Methods
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 12) {
      return 'Password must be at least 12 characters';
    }
    if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]',
    ).hasMatch(value)) {
      return 'Password must include uppercase, lowercase, numbers & special characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool _validateInputs() {
    return formKey.currentState?.validate() ?? false;
  }

  // Data Management
  void clearForm() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    formKey.currentState?.reset();
  }

  void clearTempData() {
    tempEmail = null;
    tempPassword = null;
    generatedOTP = null;
    otpGeneratedTime = null;
    userToken = null; // Add this line
    userData = null; // Add this line
  }

  void _storeTempData() {
    tempEmail = emailController.text.trim();
    tempPassword = passwordController.text;
    log('Stored temporary data for email: $tempEmail');
  }

  // Show snackbar helper methods
  void _showSuccessMessage(String message, {int seconds = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Success: $message'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: seconds),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showErrorMessage(String message, {int seconds = 4}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $message'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: seconds),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showInfoMessage(String message, {int seconds = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Info: $message'),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: seconds),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // Email Registration Check

  Future<Map<String, dynamic>?> SignupUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    const String baseUrl = "  https://d1a4cb5f78a8.ngrok-free.app  ";
    const String signupUrl = "$baseUrl/api/v1/users/create";

    try {
      final response = await http.post(
        Uri.parse(signupUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email.trim(), "password": password.trim()}),
      );

      final data = jsonDecode(response.body);
      log("API Response: $data");

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['success'] == true) {
          // Store user data and OTP from API response
          userData = data['user'];
          userToken = data['token'];
          generatedOTP = data['user']['otp']?.toString();
          otpGeneratedTime = DateTime.now();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Account created! Please verify your email."),
            ),
          );
          return data; // Return the response data
        }
      } else {
        // Check if user already exists
        String errorMessage = data['message'] ?? 'Signup failed';
        if (errorMessage.toLowerCase().contains('already exists') ||
            errorMessage.toLowerCase().contains('already registered')) {
          _showInfoMessage('Email already registered. Redirecting to login...');
          await Future.delayed(Duration(seconds: 2));
          navigateToLogin();
          return null;
        }

        log("Network Error: ${response.statusCode}");
        log("Error Body: ${response.body}");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } catch (e) {
      log("Exception: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Network error occurred")));
    }
    return null;
  }

  String? userToken;
  Map<String, dynamic>? userData;

  bool verifyOTPWithAPI(String enteredOTP) {
    if (tempEmail == null) {
      _showErrorMessage('Session expired. Please sign up again.');
      return false;
    }

    // Start async verification without waiting
    _performAsyncOTPVerification(enteredOTP);

    return true;
  }

  Future<void> _performAsyncOTPVerification(String enteredOTP) async {
    try {
      log('=== Starting API OTP Verification ===');
      log('Entered OTP: $enteredOTP');

      _setState(SignUpState.verifying);

      const String baseUrl = "https://d1a4cb5f78a8.ngrok-free.app";
      const String verifyUrl = "$baseUrl/api/v1/users/verify-otp";

      final response = await http.post(
        Uri.parse(verifyUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": tempEmail!.trim(),
          "otp": enteredOTP.trim(),
        }),
      );

      final data = jsonDecode(response.body);
      log("Verify OTP API Response: $data");

      if (response.statusCode == 200 && data['status'] == true) {
        userData = data['user'] ?? data['data'];
        userToken = data['token'];

        _setState(SignUpState.idle);
        _showSuccessMessage('Email verified successfully!', seconds: 2);

        await _createAccountAfterVerification();
      } else {
        _setState(SignUpState.idle);
        String errorMessage = data['message'] ?? 'Invalid OTP';
        _showErrorMessage(errorMessage);

        if (mounted) {}
      }
    } catch (e) {
      log("Exception in _performAsyncOTPVerification: $e");
      _setState(SignUpState.idle);
      _showErrorMessage("Failed to verify OTP. Please try again.");
    }
  }

  Future<bool> resendOTPWithAPI({required String email}) async {
    const String baseUrl = "https://d1a4cb5f78a8.ngrok-free.app";
    const String resendUrl = "$baseUrl/api/v1/users/resend-otp";

    try {
      final response = await http.post(
        Uri.parse(resendUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email.trim()}),
      );

      final data = jsonDecode(response.body);
      log("Resend OTP API Response: $data");

      if (response.statusCode == 200 && data['status'] == true) {
        // Update stored OTP and timestamp if provided
        if (data['user'] != null && data['user']['otp'] != null) {
          generatedOTP = data['user']['otp']?.toString();
          otpGeneratedTime = DateTime.now();
        }

        return true;
      } else {
        String errorMessage = data['message'] ?? 'Failed to resend OTP';
        _showErrorMessage(errorMessage);
      }
    } catch (e) {
      log("Exception in resendOTPWithAPI: $e");
      _showErrorMessage("Network error. Failed to resend OTP.");
    }

    return false;
  }

  // Future<bool> _isEmailAlreadyRegistered(String email) async {
  //   try {
  //     log('Checking if email is already registered: $email');
  //     _setState(SignUpState.checking);

  //     List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
  //     bool isRegistered = signInMethods.isNotEmpty;

  //     log('Email registration status: $isRegistered (methods: $signInMethods)');

  //     _setState(SignUpState.idle);
  //     return isRegistered;

  //   } catch (e) {
  //     log('Error checking email registration: $e');
  //     _setState(SignUpState.idle);
  //     _showErrorMessage('Failed to verify email. Please check your connection and try again.');
  //     return false;
  //   }
  // }

  // Generate OTP with better randomness
  String _generateOTP() {
    final random = Random.secure();
    String otp = '';
    for (int i = 0; i < 6; i++) {
      otp += random.nextInt(10).toString();
    }
    log('Generated secure OTP with length: ${otp.length}');
    return otp;
  }

  bool _isOTPExpired() {
    if (otpGeneratedTime == null) return true;
    return DateTime.now().difference(otpGeneratedTime!).inMinutes >
        _otpValidityMinutes;
  }

  // Email Sending
  Future<bool> _sendOTPEmail(String email, String otp) async {
    try {
      log('Configuring SMTP server for Gmail');
      final smtpServer = gmail(_senderEmail, _senderPassword);

      log('Creating email message with OTP: $otp');
      final message = Message()
        ..from = Address(_senderEmail, _appName)
        ..recipients.add(email)
        ..subject = '$_appName - Email Verification Code'
        ..html = _getEmailTemplate(otp);

      log('Attempting to send email...');
      final sendReport = await send(message, smtpServer);
      log('Email sent successfully: ${sendReport.toString()}');
      return true;
    } catch (e) {
      log('Error sending email: $e');
      return false;
    }
  }

  String _getEmailTemplate(String otp) {
    return '''
    <html>
      <body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5;">
        <div style="max-width: 600px; margin: 0 auto; background-color: white; border-radius: 10px; padding: 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
          <div style="text-align: center; margin-bottom: 30px;">
            <h1 style="color: #333; margin: 0;">$_appName</h1>
            <p style="color: #666; margin: 10px 0 0 0;">Email Verification</p>
          </div>
          
          <div style="text-align: center; margin-bottom: 30px;">
            <div style="background-color: #f8f9fa; border-radius: 50%; width: 80px; height: 80px; margin: 0 auto 20px auto; display: flex; align-items: center; justify-content: center;">
              <span style="font-size: 40px;">📧</span>
            </div>
            <h2 style="color: #333; margin: 0 0 10px 0;">Verify Your Email Address</h2>
            <p style="color: #666; margin: 0; line-height: 1.5;">
              Please use the verification code below to complete your registration:
            </p>
          </div>
          
          <div style="text-align: center; margin: 30px 0;">
            <div style="background-color: #007bff; color: white; font-size: 32px; font-weight: bold; letter-spacing: 8px; padding: 20px; border-radius: 8px; display: inline-block; font-family: monospace;">
              $otp
            </div>
          </div>
          
          <div style="background-color: #fff3cd; border: 1px solid #ffeaa7; border-radius: 8px; padding: 15px; margin: 20px 0;">
            <p style="margin: 0; color: #856404; font-size: 14px;">
              <strong>Important:</strong> This code will expire in $_otpValidityMinutes minutes for security reasons.
            </p>
          </div>
          
          <div style="text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid #eee;">
            <p style="color: #999; font-size: 12px; margin: 0;">
              If you didn't request this verification code, please ignore this email.
            </p>
            <p style="color: #999; font-size: 12px; margin: 5px 0 0 0;">
              © 2025 $_appName. All rights reserved.
            </p>
          </div>
        </div>
      </body>
    </html>
    ''';
  }

  // Save user to Firestore
  Future<void> _saveUserToFirestore(User user) async {
    try {
      final firestore = FirebaseFirestore.instance;

      await firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
        'isVerified': user.emailVerified,
      });

      log('✅ User data saved to Firestore');
    } catch (e) {
      log('❌ Error saving user data to Firestore: $e');
      _showErrorMessage('Failed to save user data.');
    }
  }

  Future<void> updateOTPInAPI(String email, String otp) async {
    try {
      const String baseUrl = "https://d1a4cb5f78a8.ngrok-free.app";
      const String updateOTPUrl =
          "$baseUrl/api/v1/users/update-otp"; // You'll need this endpoint

      final response = await http.post(
        Uri.parse(updateOTPUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "otp": otp}),
      );

      if (response.statusCode == 200) {
        log('OTP updated in API successfully');
      } else {
        log('Failed to update OTP in API: ${response.statusCode}');
      }
    } catch (e) {
      log('Error updating OTP in API: $e');
    }
  }

  Future<void> resendOTPViaGmail() async {
    if (tempEmail == null) {
      _showErrorMessage('Session expired. Please sign up again.');
      return;
    }

    if (!canResendOTP) {
      _showInfoMessage('Please wait before requesting a new code.');
      return;
    }

    try {
      _setState(SignUpState.sendingOTP);

      // Generate new OTP
      generatedOTP = _generateOTP();
      otpGeneratedTime = DateTime.now();

      // Send via Gmail
      bool emailSent = await _sendOTPEmail(tempEmail!, generatedOTP!);

      if (emailSent) {
        // Update the OTP in your API as well
        await updateOTPInAPI(tempEmail!, generatedOTP!);
        _setState(SignUpState.idle);
        _showSuccessMessage('New verification code sent to $tempEmail');
      } else {
        _setState(SignUpState.idle);
        _showErrorMessage('Failed to resend OTP. Please try again.');
        generatedOTP = null;
        otpGeneratedTime = null;
      }
    } catch (e) {
      log('Error in resendOTPViaGmail: $e');
      _setState(SignUpState.idle);
      _showErrorMessage('Failed to resend OTP. Please try again.');
    }
  }

  Future<void> onEmailSignUp() async {
    if (!_validateInputs()) return;

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      _setState(SignUpState.checking);
      _storeTempData();

      // Create user with API and send OTP
      final result = await SignupUserWithCustomOTP(
        email: email,
        password: password,
        context: context,
      );

      if (result != null && result['success'] == true) {
        clearForm();
        _setState(SignUpState.idle);

        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                VerifyEmail(
                  tempEmail: tempEmail!,
                  tempPassword: tempPassword!,
                  generatedOTP: generatedOTP!,
                  verifyOTP: verifyOTPWithAPI, // Now synchronous wrapper
                  resendOTP: resendOTP,
                  createFirebaseAccount: createFirebaseAccount,
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            transitionDuration: Duration(milliseconds: 800),
          ),
        );
      } else {
        clearTempData();
        _setState(SignUpState.idle);
      }
    } catch (e) {
      log('Error in onEmailSignUp: $e');
      _setState(SignUpState.idle);
      clearTempData();
      _showErrorMessage('Something went wrong. Please try again.');
    }
  }

  // Send OTP to stored email
  Future<bool> sendOTPToEmail() async {
    if (tempEmail == null) {
      _showErrorMessage('Session expired. Please try again.');
      return false;
    }

    try {
      log('Starting OTP send process for: $tempEmail');
      _setState(SignUpState.sendingOTP);

      generatedOTP = _generateOTP();
      otpGeneratedTime = DateTime.now();
      log('Generated OTP: $generatedOTP at ${otpGeneratedTime.toString()}');

      bool emailSent = await _sendOTPEmail(tempEmail!, generatedOTP!);

      if (!emailSent) {
        _showErrorMessage(
          'Failed to send verification email. Please check your internet connection and try again.',
          seconds: 5,
        );
        generatedOTP = null;
        otpGeneratedTime = null;
      }

      return emailSent;
    } catch (e) {
      log('Error in _sendOTPToEmail: $e');
      _showErrorMessage('Failed to send OTP: ${e.toString()}');
      generatedOTP = null;
      otpGeneratedTime = null;
      return false;
    }
  }

  Future<Map<String, dynamic>?> SignupUserWithCustomOTP({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    const String baseUrl = "https://d1a4cb5f78a8.ngrok-free.app";
    const String signupUrl = "$baseUrl/api/v1/users/create";

    // Generate OTP locally
    generatedOTP = _generateOTP();
    otpGeneratedTime = DateTime.now();

    try {
      // First, send OTP via Gmail
      _setState(SignUpState.sendingOTP);
      bool emailSent = await _sendOTPEmail(email, generatedOTP!);

      if (!emailSent) {
        _showErrorMessage(
          'Failed to send verification email. Please try again.',
        );
        return null;
      }

      // Then create user account with the generated OTP
      final response = await http.post(
        Uri.parse(signupUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.trim(),
          "password": password.trim(),
          "otp": generatedOTP, // Send our generated OTP to API
        }),
      );

      final data = jsonDecode(response.body);
      log("API Response: $data");

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['success'] == true) {
          // Store user data from API response
          userData = data['user'];
          userToken = data['token'];

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Account created! Please verify your email."),
            ),
          );
          return data;
        }
      } else {
        // Check if user already exists
        String errorMessage = data['message'] ?? 'Signup failed';
        if (errorMessage.toLowerCase().contains('already exists') ||
            errorMessage.toLowerCase().contains('already registered')) {
          _showInfoMessage('Email already registered. Redirecting to login...');
          await Future.delayed(Duration(seconds: 2));
          navigateToLogin();
          return null;
        }

        log("Network Error: ${response.statusCode}");
        log("Error Body: ${response.body}");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } catch (e) {
      log("Exception: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Network error occurred")));
    }
    return null;
  }

  Future<void> resendOTP() async {
    if (tempEmail == null) {
      _showErrorMessage('Session expired. Please sign up again.');
      return;
    }

    if (!canResendOTP) {
      _showInfoMessage('Please wait before requesting a new code.');
      return;
    }

    try {
      _setState(SignUpState.sendingOTP);

      // Use the API resend function
      bool success = await resendOTPWithAPI(email: tempEmail!);

      if (success) {
        _showSuccessMessage('New verification code sent to $tempEmail');
      }

      _setState(SignUpState.idle);
    } catch (e) {
      log('Error in resendOTP: $e');
      _setState(SignUpState.idle);
      _showErrorMessage('Failed to resend OTP. Please try again.');
    }
  }

  // Enhanced OTP verification
  bool verifyOTP(String enteredOTP) {
    try {
      log('=== Starting OTP Verification ===');
      log('Entered OTP: $enteredOTP');
      log('Stored OTP: $generatedOTP');

      if (generatedOTP == null) {
        log('❌ No OTP found in memory');
        _showErrorMessage('No OTP found. Please request a new one.');
        return false;
      }

      if (_isOTPExpired()) {
        log('❌ OTP has expired');
        _showErrorMessage('OTP has expired. Please request a new one.');
        generatedOTP = null;
        otpGeneratedTime = null;
        return false;
      }

      final cleanEnteredOTP = enteredOTP.trim();
      bool isValid = generatedOTP == cleanEnteredOTP;

      if (!isValid) {
        _showErrorMessage('Invalid OTP. Please check and try again.');
      } else {
        _showSuccessMessage('OTP verified successfully!', seconds: 2);
      }

      return isValid;
    } catch (e) {
      log('❌ Error verifying OTP: $e');
      _showErrorMessage('Failed to verify OTP. Please try again.');
      return false;
    }
  }

  Future<bool> createFirebaseAccount() async {
    return await _createAccountAfterVerification();
  }

  Future<bool> _createAccountAfterVerification() async {
    if (tempEmail == null || tempPassword == null) {
      _showErrorMessage('Session expired. Please sign up again.');
      return false;
    }

    try {
      _setState(SignUpState.creating);
      log('Creating Firebase account for verified user');

      // Create Firebase account
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: tempEmail!,
            password: tempPassword!,
          );

      final user = userCredential.user;

      if (user != null) {
        // Prepare user data for Firestore
        Map<String, dynamic> firestoreData = {
          'uid': user.uid,
          'email': user.email,
          'createdAt': FieldValue.serverTimestamp(),
          'isVerified': true,
          'loginType': 'email',
        };

        // Add API data if available
        if (userData != null) {
          firestoreData.addAll({
            'role': userData!['role'] ?? 'user',
            'status': userData!['status'] ?? 'Active',
            'profilePhoto': userData!['profilePhoto'] ?? '',
            'apiUserId': userData!['_id'] ?? userData!['id'],
            'apiToken': userToken,
          });
        }

        // Save to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(firestoreData);

        log('✅ Firebase account created and data saved successfully');
        clearTempData();
        _setState(SignUpState.idle);
        _showSuccessMessage(
          'Account created successfully! Welcome to $_appName!',
        );
        return true;
      }

      return false;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code} - ${e.message}');
      _setState(SignUpState.idle);
      String message = _getFirebaseErrorMessage(e.code);
      _showErrorMessage(message);
      return false;
    } catch (e) {
      log('General Error: $e');
      _setState(SignUpState.idle);
      _showErrorMessage('Something went wrong. Please try again.');
      return false;
    }
  }

  String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      default:
        return 'An error occurred during account creation';
    }
  }

  // Social Sign Up Methods
  Future<void> onGoogleSignUp() async {
    try {
      _setState(SignUpState.creating);

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _setState(SignUpState.idle);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        await _saveUserToFirestore(userCredential.user!);
        clearForm();
        clearTempData();
        _setState(SignUpState.idle);
        _showSuccessMessage('Signed up with Google successfully!');
      }
    } on FirebaseAuthException catch (e) {
      _setState(SignUpState.idle);
      _showErrorMessage(e.message ?? 'Google sign up failed');
    } catch (e) {
      _setState(SignUpState.idle);
      _showErrorMessage('Something went wrong with Google sign up.');
    }
  }

  Future<void> onAppleSignUp() async {
    try {
      _setState(SignUpState.creating);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        oauthCredential,
      );

      if (userCredential.user != null) {
        await _saveUserToFirestore(userCredential.user!);
        clearForm();
        clearTempData();
        _setState(SignUpState.idle);
        _showSuccessMessage('Signed up with Apple successfully!');
      }
    } on FirebaseAuthException catch (e) {
      _setState(SignUpState.idle);
      _showErrorMessage(e.message ?? 'Apple sign up failed');
    } catch (e) {
      _setState(SignUpState.idle);
      _showErrorMessage('Something went wrong with Apple sign up.');
    }
  }

  // Navigation Methods
  void onTermsOfServiceTap() {
    _showInfoMessage('Navigate to Terms of Service');
  }

  void onPrivacyPolicyTap() {
    _showInfoMessage('Navigate to Privacy Policy');
  }

  void navigateToLogin() {
    clearForm();
    clearTempData();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
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
        transitionDuration: Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            // Enhanced scrolling physics for smooth experience
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            // Scroll behavior configuration
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  controller: emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  prefixIcon: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/icon/svg/login_person.svg"),
                  ),
                ),
                const SizedBox(height: 24),

                // Password Field
                CustomTextField(
                  controller: passwordController,
                  hintText: "Type your Password",
                  obscureText: obscurePassword,
                  validator: validatePassword,
                  prefixIcon: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: togglePasswordVisibility,
                    child: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Confirm Password Field
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Re-Type your Password",
                  obscureText: obscureConfirmPassword,
                  validator: validateConfirmPassword,
                  onChanged: (value) {
                    // Trigger validation for confirm password when password changes
                    if (formKey.currentState != null) {
                      formKey.currentState!.validate();
                    }
                  },
                  prefixIcon: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: toggleConfirmPasswordVisibility,
                    child: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Requirements Card
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Create passwords with at least 12\ncharacters, including a mix of:",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(221, 179, 179, 179),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "        • Uppercase and lowercase letters",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(221, 179, 179, 179),
                          ),
                        ),
                        Text(
                          "        • Numbers",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(221, 179, 179, 179),
                          ),
                        ),
                        Text(
                          "        • Special characters (e.g., ! @ # \$ %)",
                          style: TextStyle(
                            fontSize: 12,
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
                  children: const [
                    Expanded(
                      child: Divider(color: Color(0xFFE9ECEF), thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or sign up with",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6C757D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xFFE9ECEF), thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Social Sign Up Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Sign Up Button
                    Container(
                      child: IconButton(
                        icon: isLoading
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
                        onPressed: isLoading ? null : onGoogleSignUp,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Apple Sign Up Button
                    Container(
                      child: IconButton(
                        icon: isLoading
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
                        onPressed: isLoading ? null : onAppleSignUp,
                        padding: const EdgeInsets.all(12),
                      ),
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
                      style: const TextStyle(
                        fontSize: 12,
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
                            ..onTap = onTermsOfServiceTap,
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
                            ..onTap = onPrivacyPolicyTap,
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
                    onPressed: isLoading ? null : onEmailSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEB953A),
                      minimumSize: Size(285, 40),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shadowColor: const Color(0xFF007BFF).withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBackgroundColor: const Color(0xFF6C757D),
                    ),
                    child: isLoading
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
                        : const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 24,
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
                      style: const TextStyle(
                        fontSize: 14,
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
                            ..onTap = navigateToLogin,
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
  }
}
