import 'dart:convert';
import 'dart:developer';

import 'package:convo_hearts/Presentation/signup/views/signup_view.dart';
import 'package:convo_hearts/app/utils/utils.dart';
import 'package:convo_hearts/data/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../app/config/global_var.dart';
import '../../../app/routes/app_pages.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/local_storage/local_db.dart';
import '../../../src/feature/login/utils/forgot_password.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId:
        '344604724259-4ctlqu5d4ps6q4c2p5oi7bptpedtj1v0.apps.googleusercontent.com',
  );

  final count = 0.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  RxBool obscurePassword = true.obs;
  bool isLoading = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  // Handle login

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Utils.showSnackBar('Error', 'Please fill in all fields', Colors.red);
      return;
    }

    Map<String, dynamic> json = {
      "email": emailController.text.toString(),
      "password": passwordController.text.toString(),
    };

    try {
      final response = await authenticationRepository.login(json);
      log(response.toString());
      if (response != null) {
        if (response['success'] == true && response['user'] != null) {
          log(response.toString());
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
          if (response['message'] ==
              "Account is inactive. OTP has been resent. Please verify your email.") {
            Get.toNamed(
              Routes.VERIFY_OTP,
              arguments: {
                "email": emailController.text.trim(),
                "fromRegister": true,
              },
            );
            Utils.showSnackBar(
              'Success',
              "Otp sent successfully to your given email",
              Colors.green,
            );
          } else {
            Utils.showSnackBar('Error', response['message'], Colors.red);
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
        final credentials = GoogleAuthProvider.credential(
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
          if (userData != null) {
            await LocalDB.setData(
              'auth_token',
              resp['data']['tokens']['access'],
            );
            Globals.authToken = await LocalDB.getData('auth_token');
            log('User Data ------ ${userData.toJson().toString()}');
            await LocalDB.setData('user_data', userData.toJson());
            Globals.user = UserModel.fromJson(
              jsonDecode(await LocalDB.getData('user_data')),
            );
            Get.offAllNamed(Routes.HOME);
          } else {
            // Get.toNamed(Routes.PROFILE, arguments: [userData]);
          }
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
    Utils.showSnackBar('Info', 'Navigate to Forgot Password', Colors.blue);
  }

  // Navigate to sign up
  void navigateToSignUp() {
    // Uncomment when you have the actual screen
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignupView(),
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
    Utils.showSnackBar('Info', 'Navigate to Sign Up', Colors.blue);
  }

  // Navigate to terms of service
  void navigateToTermsOfService() {
    Utils.showSnackBar('Info', 'Navigate to Terms of Service', Colors.blue);
  }

  // Navigate to privacy policy
  void navigateToPrivacyPolicy() {
    Utils.showSnackBar('Info', 'Navigate to Privacy Policy', Colors.blue);
  }
}
