import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo_hearts/Presentation/login/views/login_view.dart';
import 'package:convo_hearts/data/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../app/config/global_var.dart';
import '../../../app/routes/app_pages.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/local_storage/local_db.dart';

class SignupController extends GetxController {
  // Firebase and Auth instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  int resendAttempts = 0;

  // Constants
  int maxResendAttempts = 3;
  int resendCooldownSeconds = 60;
  String pinCode = '';
  // Form Controllers
  Timer? _timer;
  int timeRemaining = 20; // 2 minutes timer
  bool canResend = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // State variables
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  // SignUpState currentState = SignUpState.idle;
  bool isLoading = false;

  // Temporary data storage
  String? tempEmail;
  String? tempPassword;
  String? generatedOTP;
  DateTime? otpGeneratedTime;

  // Configuration
  static const String _appName = 'ConvoHearts';
  static const int _otpValidityMinutes = 10;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      emailController.text = Get.arguments['email'];
    }
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
  // bool get isProcessing => currentState != SignUpState.idle;
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

  // PIN handling
  Future onPinCompleted(String pin) async {
    pinCode = pin;
    await verifyOtp();
  }

  Future<void> resendCode() async {
    if (!canResend) return;

    if (resendAttempts >= maxResendAttempts) {
      _showErrorMessage(
        'Maximum resend attempts reached. Please restart the signup process.',
      );
      return;
    }

    try {
      resendAttempts++;

      await resendOTP();

      _showSuccessMessage('New verification code sent to $maskedEmail');

      // Start cooldown timer
      timeRemaining = resendCooldownSeconds;
      canResend = false;

      startTimer();
    } catch (e) {
      log('Resend error: $e');
      _showErrorMessage('Failed to resend code. Please try again.');
    } finally {}
  }

  void startTimer() {
    timeRemaining = 20;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeRemaining == 0) {
        timer.cancel();
      } else {
        timeRemaining--;
      }
    });
  }

  void onPinChanged(String pin) {
    pinCode = pin;
  }

  String get formattedTime {
    int minutes = timeRemaining ~/ 60;
    int seconds = timeRemaining % 60;
    return "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";
  }

  String get maskedEmail {
    try {
      if (emailController.text.isEmpty) return "****@****.com";

      List<String> parts = emailController.text.split('@');
      if (parts.length != 2) return "****@****.com";

      String username = parts[0];
      String domain = parts[1];

      // Mask username
      String maskedUsername;
      if (username.length <= 2) {
        maskedUsername = "${username[0]}*";
      } else if (username.length <= 4) {
        maskedUsername = "${username[0]}**${username[username.length - 1]}";
      } else {
        maskedUsername =
            "${username.substring(0, 2)}***${username.substring(username.length - 2)}";
      }

      // Mask domain
      List<String> domainParts = domain.split('.');
      if (domainParts.isEmpty) return "$maskedUsername@***";

      String maskedDomain =
          "${domainParts[0][0]}***.${domainParts.sublist(1).join('.')}";

      return "$maskedUsername@$maskedDomain";
    } catch (e) {
      log('Error masking email: $e');
      return "****@****.com";
    }
  }

  // UI State Management
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    update();
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

  // Show snackbar helper methods
  void _showSuccessMessage(String message, {int seconds = 3}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
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
    ScaffoldMessenger.of(Get.context!).showSnackBar(
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
    ScaffoldMessenger.of(Get.context!).showSnackBar(
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

  Future<void> signUp(String email, String password) async {
    Map<String, dynamic> json = {
      "email": email.trim().toString(),
      "password": password.trim().toString(),
    };

    try {
      final response = await authenticationRepository.signUp(json);
      log(response.toString());
      if (response['success'] == true) {
        // Store user data and OTP from API response
        userData = response['user'];
        userToken = response['token'];
        generatedOTP = response['user']['otp']?.toString();
        otpGeneratedTime = DateTime.now();

        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("Account created! Please verify your email.")),
        );

        Get.toNamed(Routes.VERIFY_OTP);
      } else {
        String errorMessage = response['message'] ?? 'Signup failed';
        if (errorMessage.contains(
              'User with this email already exists and is active',
            ) ||
            errorMessage.toLowerCase().contains('already registered')) {
          _showInfoMessage('Email already registered. Redirecting to login...');
          await Future.delayed(Duration(seconds: 2));
          navigateToLogin();
          return;
        }
      }
    } catch (e) {
      log('-----String----${e.toString()}');
    }
  }

  String? userToken;
  Map<String, dynamic>? userData;

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
      // _setState(SignUpState.sendingOTP);

      // Use the API resend function
      bool success = await resendOTPWithAPI(email: tempEmail!);

      if (success) {
        _showSuccessMessage('New verification code sent to $tempEmail');
      }

      // _setState(SignUpState.idle);
    } catch (e) {
      log('Error in resendOTP: $e');
      // _setState(SignUpState.idle);
      _showErrorMessage('Failed to resend OTP. Please try again.');
    }
  }

  // Enhanced OTP verification

  Future<bool> createFirebaseAccount() async {
    return await _createAccountAfterVerification();
  }

  Future<bool> _createAccountAfterVerification() async {
    if (tempEmail == null || tempPassword == null) {
      _showErrorMessage('Session expired. Please sign up again.');
      return false;
    }

    try {
      // _setState(SignUpState.creating);
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
        // _setState(SignUpState.idle);
        _showSuccessMessage(
          'Account created successfully! Welcome to $_appName!',
        );
        return true;
      }

      return false;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code} - ${e.message}');
      // _setState(SignUpState.idle);
      String message = _getFirebaseErrorMessage(e.code);
      _showErrorMessage(message);
      return false;
    } catch (e) {
      log('General Error: $e');
      // _setState(SignUpState.idle);
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

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignInAccount? currentUser;
    // signOut();
    try {
      final googleUser = await _googleSignIn.signIn();
      if (await _googleSignIn.isSignedIn()) {
        _googleSignIn.signOut();
      }
      if (googleUser != null) {
        currentUser = googleUser;
        final googleAuth = await googleUser.authentication;
        final _ = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        log('Acess Token ------ ${googleAuth.accessToken.toString()}');
        log('Id Token --------${googleAuth.idToken.toString()}');
        externalLoginCallBack(idToken: googleAuth.idToken ?? "");
      }
    } catch (e) {
      log('Error in google function $e');
    }
  }

  void externalLoginCallBack({String? idToken}) async {
    final SharedPreferences _ = await SharedPreferences.getInstance();
    Map<String, dynamic> json = {"provider": "google", "googleToken": idToken};

    Map<String, dynamic>? response;
    try {
      response = await authenticationRepository.socialLogin(json);
      log('Response ----------- ${response.toString()}');
      if (response != null) {
        UserModel user = UserModel.fromJson(response['user']);
        Globals.authToken = response['token'];
        await LocalDB.setData('auth_token', response['token']);
        Globals.authToken = await LocalDB.getData('auth_token');
        await LocalDB.setData('user_data', user.toJson());
        Globals.user = UserModel.fromJson(
          jsonDecode(await LocalDB.getData('user_data')),
        );
        Utils.showSnackBar('Success', "Successfully Logged In", Colors.green);

        Get.offAllNamed(Routes.PROFILE_CREATION_DECISION);
        log('-----${Globals.user!.toJson().toString()}');
      } else if (response != null && response['success'] == false) {
        Utils.showToast(message: response['message']);
      } else {
        Utils.showToast(message: "Please try again later");
      }
    } catch (e) {
      update();
    }
  }

  Future<void> appleSignIn() async {
    log('inside apple login');
    final SharedPreferences _ = await SharedPreferences.getInstance();
    Map<String, dynamic>? resp;
    try {
      if (await SignInWithApple.isAvailable()) {
        AuthorizationCredentialAppleID credential =
            await SignInWithApple.getAppleIDCredential(
              scopes: [
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName,
              ],
            );
        log('credentials idtoken: ${credential.identityToken}');
        log('credentials user identifier: ${credential.userIdentifier}');
        log(' user given name: ${credential.givenName}');
        log(' user family name: ${credential.familyName}');
        // resp = await profileRepository.appleLogin(
        //   idToken: credential.identityToken,
        //   name: credential.givenName == null
        //       ? null
        //       : '${credential.givenName} ${credential.familyName}',
        // );
        if (resp != null && resp['success'] == true) {
          log('apple login response: $resp');
          UserModel userData = UserModel.fromJson(resp['data']);
          Globals.authToken = resp['data']['tokens']['access'];
          await LocalDB.setData('auth_token', resp['data']['tokens']['access']);
          Globals.authToken = await LocalDB.getData('auth_token');
          log('User Data ------ ${userData.toJson().toString()}');
          await LocalDB.setData('user_data', userData.toJson());
          Globals.user = UserModel.fromJson(
            jsonDecode(await LocalDB.getData('user_data')),
          );
          Get.offAllNamed(Routes.HOME);
        } else {
          Utils.showToast(message: "Please try again later");
        }
      } else {
        Utils.showToast(message: "Apple login not available");
      }
    } catch (e) {
      log('Error in apple signin function $e');
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
      Get.context!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
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

  Future<void> verifyOtp() async {
    if (pinCode.length != 6) {
      _showErrorMessage('Please enter the complete 6-digit code');
      return;
    }

    Map<String, dynamic> json = {"email": emailController.text, "otp": pinCode};

    try {
      final response = await authenticationRepository.verifyOTP(json);
      log(response.toString());
      if (response != null) {
        if (response['success'] == true && response['user'] != null) {
          log(response.toString());
          UserModel user = UserModel.fromJson(response['user']);
          if (response['token'] != null) {
            Globals.authToken = response['token'];
            await LocalDB.setData('auth_token', response['token']);
            Globals.authToken = await LocalDB.getData('auth_token');
            await LocalDB.setData('user_data', user.toJson());
            Globals.user = UserModel.fromJson(
              jsonDecode(await LocalDB.getData('user_data')),
            );
            Utils.showSnackBar(
              'Success',
              "Successfully Logged In",
              Colors.green,
            );

            Get.offAllNamed(Routes.PROFILE_CREATION_DECISION);
            log('-----${Globals.user!.toJson().toString()}');
          }
        } else if (response != null && response['success'] == false) {
          if (response['message'] == "User is not verified.") {
            Get.offNamed(
              Routes.VERIFY_OTP,
              arguments: {
                "email": emailController.text.trim(),
                "fromRegister": true,
              },
            );
            Utils.showToast(
              message: "Otp sent successfully to your given email",
            );
          } else {
            Utils.showToast(message: response['message']);
          }
        }
      } else {
        log('Registration failed with status: ${response.statusCode}');
        throw Exception('Failed to register: ${response.statusMessage}');
      }
    } catch (e) {
      log('-----String----${e.toString()}');
    }
  }
}
