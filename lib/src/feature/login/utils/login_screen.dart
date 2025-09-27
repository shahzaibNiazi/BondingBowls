// import 'package:convo_hearts/login/controller/login_controller.dart';
// import 'package:convo_hearts/widgets/Custom_TextField.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Initialize controller
//     final LoginController controller = Get.put(LoginController());
    
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             controller: controller.scrollController,
//             // Enhanced smooth scrolling like signup screen
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             // Keyboard dismiss behavior like signup screen
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             // Consistent padding like signup screen
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Logo/Image with constrained size like signup screen
//                 ConstrainedBox(
//                   constraints: const BoxConstraints(
//                     maxHeight: 200,
//                     maxWidth: 300,
//                   ),
//                   child: Image.asset(
//                     'assets/images/image_splash2.jpg',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
                
//                 const SizedBox(height: 32),

//                 // Email/Mobile TextField (no animation like signup)
//                 CustomTextField(
//                   controller: controller.emailController,
//                   hintText: "Email or Mobile Number",
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: SizedBox(
//                     height: 25,
//                     width: 25,
//                     child: SvgPicture.asset("assets/icon/svg/login_person.svg"),
//                   ),
//                 ),
        
//                 const SizedBox(height: 24),

//                 // Password TextField with reactive visibility (simplified like signup)
//                 Obx(() => CustomTextField(
//                   controller: controller.passwordController,
//                   hintText: "Type your Password",
//                   obscureText: controller.obscurePassword.value,
//                   prefixIcon: SizedBox(
//                     height: 20,
//                     width: 20,
//                     child: SvgPicture.asset("assets/icon/svg/lock.svg"),
//                   ),
//                   suffixIcon: GestureDetector(
//                     onTap: controller.togglePasswordVisibility,
//                     child: Icon(
//                       controller.obscurePassword.value 
//                           ? Icons.visibility_off 
//                           : Icons.visibility,
//                       color: Colors.grey,
//                       size: 20,
//                     ),
//                   ),
//                 )),

//                 const SizedBox(height: 20),

//                 // Forgot Password (simplified like signup)
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: controller.navigateToForgotPassword,
//                     style: TextButton.styleFrom(
//                       splashFactory: InkRipple.splashFactory,
//                       overlayColor: Colors.orange.withOpacity(0.1),
//                     ),
//                     child: const Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black
//                       ),
//                     ),
//                   ),
//                 ),
                
//                 const SizedBox(height: 32),
        
//                 // Log In Button with loading state (simplified like signup)
//                 Obx(() => Container(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: controller.isLoading.value 
//                         ? null 
//                         : controller.handleLogin,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: controller.isLoading.value 
//                           ? Colors.orange.withOpacity(0.7)
//                           : Colors.orange,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       elevation: controller.isLoading.value ? 0 : 2,
//                       shadowColor: Colors.orange.withOpacity(0.3),
//                     ),
//                     child: controller.isLoading.value
//                         ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                             ),
//                           )
//                         : const Text(
//                             "Log In",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600
//                             ),
//                           ),
//                   ),
//                 )),
                
//                 const SizedBox(height: 32),
        
//                 // OR Divider (matching signup style exactly)
//                 Row(
//                   children: const [
//                     Expanded(
//                       child: Divider(
//                         color: Color(0xFFE9ECEF),
//                         thickness: 1,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         "or log in with",
//                         style: TextStyle(
//                           fontSize: 12, 
//                           color: Color(0xFF6C757D),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: Color(0xFFE9ECEF),
//                         thickness: 1,
//                       ),
//                     ),
//                   ],
//                 ),
                
//                 const SizedBox(height: 24),
        
//                 // Social Login Buttons (matching signup style exactly)
//                 Obx(() => Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Google Login Button
//                     Container(
//                       child: IconButton(
//                         icon: controller.isLoading.value 
//                             ? const SizedBox(
//                                 width: 24, 
//                                 height: 24, 
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Color(0xFF6C757D),
//                                 ),
//                               )
//                             : SvgPicture.asset(
//                                 "assets/icon/svg/Google_icon.svg",
//                                 width: 24,
//                                 height: 24,
//                               ),
//                         onPressed: controller.isLoading.value ? null : controller.handleGoogleLogin,
//                         padding: const EdgeInsets.all(12),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     // Apple Login Button
//                     Container(
//                       child: IconButton(
//                         icon: controller.isLoading.value 
//                             ? const SizedBox(
//                                 width: 24, 
//                                 height: 24, 
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Color(0xFF6C757D),
//                                 ),
//                               )
//                             : SvgPicture.asset(
//                                 "assets/icon/svg/Apple.svg",
//                                 width: 24,
//                                 height: 24,
//                               ),
//                         onPressed: controller.isLoading.value ? null : controller.handleAppleLogin,
//                         padding: const EdgeInsets.all(12),
//                       ),
//                     ),
//                   ],
//                 )),
                
//                 const SizedBox(height: 32),
        
//                 // Sign Up Prompt (simplified like signup)
//                 Center(
//                   child: RichText(
//                     text: TextSpan(
//                       text: "Don't have an account? ",
//                       style: const TextStyle(
//                         color: Color(0xFF6C757D),
//                         fontSize: 14,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: "Sign Up!",
//                           style: const TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = controller.navigateToSignUp,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
                
//                 const SizedBox(height: 32),
        
//                 // Terms & Privacy (matching signup style exactly)
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     text: "I have read, understood and accepted the\n",
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Color(0xFF6C757D),
//                       fontWeight: FontWeight.w400,
//                       height: 1.5,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "Terms of Service",
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = controller.navigateToTermsOfService,
//                       ),
//                       const TextSpan(text: " and the "),
//                       TextSpan(
//                         text: "Privacy Policy",
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = controller.navigateToPrivacyPolicy,
//                       ),
//                     ],
//                   ),
//                 ),
                
//                 // Bottom padding for better scroll experience
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:convo_hearts/src/feature/login/utils/signup_screen.dart';
import 'package:convo_hearts/widgets/Custom_TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Profile-Creation/profile_creation1.dart';
import 'forgot_password.dart';
// Import your screens
// import 'package:convo_hearts/Profile-Creation/profile_creation1.dart';
// import 'package:convo_hearts/login/utils/forgot_password.dart';
// import 'package:convo_hearts/login/utils/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // Scroll controller for smooth scrolling
  final ScrollController scrollController = ScrollController();
  
  // State variables
  bool obscurePassword = true;
  bool isLoading = false;
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    scrollController.dispose();
    super.dispose();
  }
  
  // Toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
  
  // Show snackbar helper method
  void showSnackbar(String title, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
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

    setState(() {
      isLoading = true;
    });

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
        context,
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
      setState(() {
        isLoading = false;
      });
    }
  }
  
  // Handle Google login
  Future<void> handleGoogleLogin() async {
    setState(() {
      isLoading = true;
    });
    
    try {
      // Add your Google login logic here
      await Future.delayed(Duration(seconds: 1)); // Simulate API call
      
      showSnackbar('Success', 'Google login successful!', Colors.green);
      
    } catch (e) {
      showSnackbar('Error', 'Google login failed: ${e.toString()}', Colors.red);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  
  // Handle Apple login
  Future<void> handleAppleLogin() async {
    setState(() {
      isLoading = true;
    });
    
    try {
      // Add your Apple login logic here
      await Future.delayed(Duration(seconds: 1)); // Simulate API call
      
      showSnackbar('Success', 'Apple login successful!', Colors.green);
      
    } catch (e) {
      showSnackbar('Error', 'Apple login failed: ${e.toString()}', Colors.red);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  
  // Navigate to forgot password
  void navigateToForgotPassword() {
    // Uncomment when you have the actual screen
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ForgotPassword(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(position: animation.drive(tween), child: child);
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
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(position: animation.drive(tween), child: child);
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            controller: scrollController,
            // Enhanced smooth scrolling like signup screen
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            // Keyboard dismiss behavior like signup screen
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            // Consistent padding like signup screen
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo/Image with constrained size like signup screen
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

                // Email/Mobile TextField (no animation like signup)
                CustomTextField(
                  controller: emailController,
                  hintText: "Email or Mobile Number",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/icon/svg/login_person.svg"),
                  ),
                ),
        
                const SizedBox(height: 24),

                // Password TextField with visibility toggle (replacing Obx)
                CustomTextField(
                  controller: passwordController,
                  hintText: "Type your Password",
                  obscureText: obscurePassword,
                  prefixIcon: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: togglePasswordVisibility,
                    child: Icon(
                      obscurePassword 
                          ? Icons.visibility_off 
                          : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Forgot Password (simplified like signup)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: navigateToForgotPassword,
                    style: TextButton.styleFrom(
                      splashFactory: InkRipple.splashFactory,
                      overlayColor: Colors.orange.withOpacity(0.1),
                    ),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
        
                // Log In Button with loading state (replacing Obx)
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading 
                        ? null 
                        : handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLoading 
                          ? Colors.orange.withOpacity(0.7)
                          : Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: isLoading ? 0 : 2,
                      shadowColor: Colors.orange.withOpacity(0.3),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                  ),
                ),
                
                const SizedBox(height: 32),
        
                // OR Divider (matching signup style exactly)
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Color(0xFFE9ECEF),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or log in with",
                        style: TextStyle(
                          fontSize: 12, 
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
        
                // Social Login Buttons (replacing Obx)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Login Button
                    Container(
                      child: IconButton(
                        icon: isLoading 
                            ? const SizedBox(
                                width: 24, 
                                height: 24, 
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
                        onPressed: isLoading ? null : handleGoogleLogin,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Apple Login Button
                    Container(
                      child: IconButton(
                        icon: isLoading 
                            ? const SizedBox(
                                width: 24, 
                                height: 24, 
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
                        onPressed: isLoading ? null : handleAppleLogin,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
        
                // Sign Up Prompt (simplified like signup)
                Center(
                  child:
                  
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up!",
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = navigateToSignUp,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
        
                // Terms & Privacy (matching signup style exactly)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "I have read, understood and accepted the\n",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6C757D),
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToTermsOfService,
                      ),
                      const TextSpan(text: " and the "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToPrivacyPolicy,
                      ),
                    ],
                  ),
                ),
                
                // Bottom padding for better scroll experience
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}