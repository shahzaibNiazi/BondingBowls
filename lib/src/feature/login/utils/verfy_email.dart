
// import 'package:convo_hearts/login/controller/verify_email_controller.dart';
// import 'package:convo_hearts/widgets/Custom_PIn_Code.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class VerifyEmail extends StatelessWidget {
//   const VerifyEmail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final VerifyEmailController verifyController = Get.put(VerifyEmailController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Logo
//                 Image.asset(
//                   'assets/images/image_splash2.jpg',
//                   // height: ,
//                   width: 700,
//                 ),
//                 const SizedBox(height: 24),
            
//                 // Title
//                 const Text(
//                   "Verify your Email",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
            
//                 // Subtext
//                 Text(
//                   "Please enter the 6 digit code sent to your\nemail : ${verifyController.getMaskedEmail()}",
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 32),
            
//                 // Custom PIN Code Input
//                 // CustomPinCodeField(
//                 //   onCompleted: controller.onPinCompleted,
//                 // ),
            

// CustomPinCodeField(
//   onCompleted: (pin) {
//     // ✅ Just store the value, don't verify yet
//     verifyController.pinCode.value = pin;
//   },
// ),

//                 const SizedBox(height: 32),
            
//                 // Verify Button
//                 ElevatedButton(
//                   onPressed: () {
//                     // Use the current pin code value for verification
//                     if (verifyController.pinCode.value.length == 6) {
//                       verifyController.verifyPin(verifyController.pinCode.value);
//                     } else {
//                       Get.snackbar(
//                         "Error", 
//                         "Please enter the verification code",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xffEB953A),
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size(284, 36),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     "Verify",
//                     style: TextStyle(fontWeight: FontWeight.w700,  
//                   fontSize: 24),
//                   ),
//                 ),
            
//                 const SizedBox(height: 24),
            
//                 const Text(
//                   "Haven't received your code?",
//                   style: TextStyle(fontSize: 16,
//                   fontWeight: FontWeight.w700, color: Colors.black),
//                 ),
            
//                 const SizedBox(height: 18),
            
//                 // Timer + Resend
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(() => Text(
//                       verifyController.formattedTime,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 14),
//                     )),
//                     const SizedBox(height: 16),
//                     Obx(() => GestureDetector(
//                       onTap: verifyController.canResend.value ? verifyController.resendCode : null,
//                       child: Text(
//                         "Resend!",
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: verifyController.canResend.value ? Color(0xff0900FF) : Colors.grey,
//                           fontWeight: FontWeight.w700,
//                         decorationColor: verifyController.canResend.value ? Color(0xff0900FF) : Colors.grey,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     )),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }











// import 'dart:async';
// import 'dart:developer';
// import 'package:convo_hearts/widgets/Custom_PIn_Code.dart';
// import 'package:convo_hearts/Profile-Creation/profile_creation1.dart';
// import 'package:flutter/material.dart';

// enum VerificationState { idle, verifying, creating, resending }

// class VerifyEmail extends StatefulWidget {
//   final String tempEmail;
//   final String tempPassword;
//   final String generatedOTP;
//   final Function(String) verifyOTP;
//   final Function() resendOTP;
//   final Function() createFirebaseAccount;

//   const VerifyEmail({
//     super.key,
//     required this.tempEmail,
//     required this.tempPassword,
//     required this.generatedOTP,
//     required this.verifyOTP,
//     required this.resendOTP,
//     required this.createFirebaseAccount,
//   });

//   @override
//   _VerifyEmailState createState() => _VerifyEmailState();
// }

// class _VerifyEmailState extends State<VerifyEmail> {
//   // State variables
//   int start = 20;
//   bool canResend = false;
//   String pinCode = '';
//   VerificationState currentState = VerificationState.idle;
  
//   Timer? _timer;
//   int _resendAttempts = 0;
//   static const int _maxResendAttempts = 3;
//   static const int _initialTimerSeconds = 20;
//   static const int _resendPenaltySeconds = 120;

//   @override
//   void initState() {
//     super.initState();
//     _initializeController();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   // Computed properties
//   bool get isProcessing => currentState != VerificationState.idle;
//   bool get canAttemptResend => canResend && _resendAttempts < _maxResendAttempts;
//   String get resendButtonText {
//     if (!canResend) return 'Resend in $formattedTime';
//     if (_resendAttempts >= _maxResendAttempts) return 'Max attempts reached';
//     return 'Resend Code';
//   }

//   void _initializeController() {
//     log("VerifyEmail initialized for email: ${widget.tempEmail}");
    
//     // Start the countdown timer
//     startTimer();
    
//     // Show initial instructions
//     _showWelcomeMessage();
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
    
//     setState(() {
//       start = timerSeconds;
//       canResend = false;
//     });
    
//     _timer?.cancel(); // Cancel any existing timer
    
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (start == 0) {
//           canResend = true;
//           timer.cancel();
//           log("Timer completed - resend now available");
//         } else {
//           start--;
//         }
//       });
//     });
    
//     log("Timer started for $timerSeconds seconds");
//   }

//   void onPinCompleted(String pin) {
//     setState(() {
//       pinCode = pin;
//     });
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
    
//     try {
//       setState(() {
//         currentState = VerificationState.verifying;
//       });
      
//       log("Verifying OTP - Expected: ${widget.generatedOTP}, Entered: ${pin.trim()}");
      
//       // Use the passed verifyOTP function
//       bool isValid = widget.verifyOTP(pin);
      
//       if (isValid) {
//         await _handleSuccessfulVerification();
//       } else {
//         _handleFailedVerification();
//       }
      
//     } catch (e) {
//       log('Error during PIN verification: $e');
//       _handleVerificationError(e);
//     } finally {
//       if (currentState == VerificationState.verifying) {
//         setState(() {
//           currentState = VerificationState.idle;
//         });
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
//     log("PIN verification successful for email: ${widget.tempEmail}");
    
//     // Stop the timer since verification is successful
//     _timer?.cancel();
//     setState(() {
//       canResend = false;
//     });
    
//     _showSuccessMessage('Email verified successfully! Creating your account...', seconds: 2);
    
//     // Create Firebase account
//     await _createUserAccount();
//   }

//   void _handleFailedVerification() {
//     log("PIN verification failed");
    
//     // Clear the entered PIN for re-entry
//     setState(() {
//       pinCode = '';
//     });
    
//     _showErrorMessage('Invalid verification code. Please check and try again.');
//   }

//   void _handleVerificationError(dynamic error) {
//     log("Verification error: $error");
//     setState(() {
//       pinCode = '';
//     });
//     _showErrorMessage('Verification failed. Please try again.');
//   }

//   Future<void> _createUserAccount() async {
//     try {
//       setState(() {
//         currentState = VerificationState.creating;
//       });
//       log("Creating Firebase account for: ${widget.tempEmail}");
      
//       bool accountCreated = await widget.createFirebaseAccount();
      
//       if (accountCreated) {
//         log("Account created successfully");
//         _navigateToNextScreen();
//       } else {
//         log("Failed to create Firebase account");
//         setState(() {
//           currentState = VerificationState.idle;
//         });
//         _showErrorMessage(
//           'Failed to create account. Please try the verification again.',
//           seconds: 4
//         );
//       }
      
//     } catch (e) {
//       log('Error creating account: $e');
//       setState(() {
//         currentState = VerificationState.idle;
//       });
//       _showErrorMessage('Account creation failed. Please try again.');
//     }
//   }

//   void _navigateToNextScreen() {
//     // Navigate to profile creation or home screen
//     Navigator.pushAndRemoveUntil(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => ProfileCreation(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.ease;
//           var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//           return SlideTransition(position: animation.drive(tween), child: child);
//         },
//         transitionDuration: Duration(milliseconds: 800),
//       ),
//       (route) => false,
//     );
//   }

//   Future<void> resendCode() async {
//     if (isProcessing) {
//       log("Another operation in progress, ignoring resend request");
//       return;
//     }

//     // Validate resend eligibility
//     if (!_canResendCode()) return;

//     try {
//       setState(() {
//         currentState = VerificationState.resending;
//         _resendAttempts++;
//       });
      
//       log("Attempting to resend code (attempt $_resendAttempts/$_maxResendAttempts) to: ${widget.tempEmail}");
      
//       // Start timer immediately to prevent spam
//       startTimer();
      
//       // Use the passed resend method
//       await widget.resendOTP();
      
//       _showSuccessMessage(
//         'Verification code sent to ${getMaskedEmail()}',
//         seconds: 3
//       );
      
//     } catch (e) {
//       log('Error in resendCode: $e');
//       _handleResendError();
//     } finally {
//       setState(() {
//         currentState = VerificationState.idle;
//       });
//     }
//   }

//   bool _canResendCode() {
//     if (!canResend) {
//       _showInfoMessage(
//         'Please wait $formattedTime before requesting a new code.',
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
//     setState(() {
//       start = 30;
//       canResend = false;
//     });
//     startTimer(customSeconds: 30);
    
//     _showErrorMessage('Failed to resend code. Please try again in 30 seconds.');
//   }

//   // Email masking method
//   String getMaskedEmail() {
//     String email = widget.tempEmail;
    
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
//   String get formattedTime => _formatTime(start);
  
//   String _formatTime(int seconds) {
//     int minutes = seconds ~/ 60;
//     int remainingSeconds = seconds % 60;
//     return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
//   }

//   // Message display methods
//   void _showSuccessMessage(String message, {int seconds = 3}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Success: $message'),
//         backgroundColor: Colors.green,
//         duration: Duration(seconds: seconds),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }

//   void _showErrorMessage(String message, {int seconds = 4}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: $message'),
//         backgroundColor: Colors.red,
//         duration: Duration(seconds: seconds),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }

//   void _showInfoMessage(String message, {int seconds = 3}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Info: $message'),
//         backgroundColor: Colors.blue,
//         duration: Duration(seconds: seconds),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Logo
//                 Image.asset(
//                   'assets/images/image_splash2.jpg',
//                   width: 700,
//                 ),
//                 const SizedBox(height: 24),
            
//                 // Title
//                 const Text(
//                   "Verify your Email",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
            
//                 // Subtext
//                 Text(
//                   "Please enter the 6 digit code sent to your\nemail : ${getMaskedEmail()}",
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 32),
            
//                 // Custom PIN Code Input
//                 CustomPinCodeField(
//                   onCompleted: (pin) {
//                     // Just store the value, don't verify yet
//                     setState(() {
//                       pinCode = pin;
//                     });
//                   },
//                 ),

//                 const SizedBox(height: 32),
            
//                 // Verify Button
//                 ElevatedButton(
//                   onPressed: () {
//                     // Use the current pin code value for verification
//                     if (pinCode.length == 6) {
//                       verifyPin(pinCode);
//                     } else {
//                       _showErrorMessage("Please enter the verification code");
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xffEB953A),
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size(284, 36),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     "Verify",
//                     style: TextStyle(fontWeight: FontWeight.w700,  
//                   fontSize: 24),
//                   ),
//                 ),
            
//                 const SizedBox(height: 24),
            
//                 const Text(
//                   "Haven't received your code?",
//                   style: TextStyle(fontSize: 16,
//                   fontWeight: FontWeight.w700, color: Colors.black),
//                 ),
            
//                 const SizedBox(height: 18),
            
//                 // Timer + Resend
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       formattedTime,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 14),
//                     ),
//                     const SizedBox(height: 16),
//                     GestureDetector(
//                       onTap: canResend ? resendCode : null,
//                       child: Text(
//                         "Resend!",
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: canResend ? Color(0xff0900FF) : Colors.grey,
//                           fontWeight: FontWeight.w700,
//                         decorationColor: canResend ? Color(0xff0900FF) : Colors.grey,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }








import 'dart:async';
import 'dart:developer';
import 'package:convo_hearts/widgets/Custom_PIn_Code.dart';
import 'package:flutter/material.dart';

import '../../Profile-Creation/profile_creation1.dart';

enum VerificationState { idle, verifying, creating, resending }

class VerifyEmail extends StatefulWidget {
  final String tempEmail;
  final String tempPassword;
  final String generatedOTP;
  final Function(String) verifyOTP;
  final Function() resendOTP;
  final Function() createFirebaseAccount;

  const VerifyEmail({
    super.key,
    required this.tempEmail,
    required this.tempPassword,
    required this.generatedOTP,
    required this.verifyOTP,
    required this.resendOTP,
    required this.createFirebaseAccount,
  });

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  // State variables
  Timer? _timer;
  int _timeRemaining = 20; // 2 minutes timer
  bool _canResend = false;
  String _pinCode = '';
  VerificationState _currentState = VerificationState.idle;
  int _resendAttempts = 0;
  
  // Constants
  static const int _maxResendAttempts = 3;
  static const int _resendCooldownSeconds = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _showInitialMessage();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Getters
  bool get _isProcessing => _currentState != VerificationState.idle;
  
  //
  // String get _formattedTime {
  //   int minutes = _timeRemaining ~/ 60;
  //   int seconds = _timeRemaining % 60;
  //   return "${seconds.toString().padLeft(0, '0')}:${seconds.toString().padLeft(20, '0')}";
  // }



    String get _formattedTime {
    int minutes = _timeRemaining ~/ 60;
    int seconds = _timeRemaining % 60;
    return "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";
  }

  String get _maskedEmail {
    try {
      if (widget.tempEmail.isEmpty) return "****@****.com";
      
      List<String> parts = widget.tempEmail.split('@');
      if (parts.length != 2) return "****@****.com";
      
      String username = parts[0];
      String domain = parts[1];
      
      // Mask username
      String maskedUsername;
      if (username.length <= 2) {
        maskedUsername = username[0] + "*";
      } else if (username.length <= 4) {
        maskedUsername = username[0] + "**" + username[username.length - 1];
      } else {
        maskedUsername = username.substring(0, 2) + "***" + username.substring(username.length - 2);
      }
      
      // Mask domain
      List<String> domainParts = domain.split('.');
      if (domainParts.isEmpty) return maskedUsername + "@***";
      
      String maskedDomain = domainParts[0][0] + "***." + domainParts.sublist(1).join('.');
      
      return maskedUsername + "@" + maskedDomain;
    } catch (e) {
      log('Error masking email: $e');
      return "****@****.com";
    }
  }

  // Timer methods
  // void _startTimer() {
  //   _timer?.cancel();
    
  //   setState(() {
  //     _timeRemaining = _initialTimerSeconds;
  //     _canResend = false;
  //   });
    
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (!mounted) {
  //       timer.cancel();
  //       return;
  //     }
      
  //     setState(() {
  //       if (_timeRemaining > 0) {
  //         _timeRemaining--;
  //       } else {
  //         _canResend = true;
  //         timer.cancel();
  //       }
  //     });
  //   });
  // }


  void _startTimer() {
    _timeRemaining = 20;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _timeRemaining--;
        });
      }
    });
  }

  void _showInitialMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _showInfoMessage('We\'ve sent a 6-digit verification code to $_maskedEmail');
      }
    });
  }

  // PIN handling
  void _onPinCompleted(String pin) {
    setState(() {
      _pinCode = pin;
    });
    _verifyPin(pin);
  }

  void _onPinChanged(String pin) {
    setState(() {
      _pinCode = pin;
    });
  }

  Future<void> _verifyPin(String pin) async {
    if (_isProcessing) return;
    
    if (!_isValidPin(pin)) {
      _showErrorMessage('Please enter a valid 6-digit code');
      return;
    }

    try {
      setState(() {
        _currentState = VerificationState.verifying;
      });

      // Call the verification function passed from parent
      bool isValid = widget.verifyOTP(pin.trim());
      
      if (isValid) {
        await _handleSuccessfulVerification();
      } else {
        _handleFailedVerification();
      }
    } catch (e) {
      log('Verification error: $e');
      _showErrorMessage('Verification failed. Please try again.');
      setState(() {
        _currentState = VerificationState.idle;
        _pinCode = '';
      });
    }
  }

  bool _isValidPin(String pin) {
    return pin.length == 6 && RegExp(r'^\d{6}$').hasMatch(pin);
  }

  Future<void> _handleSuccessfulVerification() async {
    _timer?.cancel();
    _showSuccessMessage('Email verified successfully!');
    
    // Wait a moment before creating account
    await Future.delayed(const Duration(milliseconds: 500));
    
    await _createAccount();
  }

  void _handleFailedVerification() {
    setState(() {
      _currentState = VerificationState.idle;
      _pinCode = '';
    });
    _showErrorMessage('Invalid verification code. Please try again.');
  }

  Future<void> _createAccount() async {
    try {
      setState(() {
        _currentState = VerificationState.creating;
      });

      bool success = await widget.createFirebaseAccount();
      
      if (success) {
        if (mounted) {
          _navigateToProfile();
        }
      } else {
        setState(() {
          _currentState = VerificationState.idle;
        });
        _showErrorMessage('Failed to create account. Please try again.');
      }
    } catch (e) {
      log('Account creation error: $e');
      setState(() {
        _currentState = VerificationState.idle;
      });
      _showErrorMessage('Account creation failed. Please try again.');
    }
  }

  void _navigateToProfile() {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ProfileCreation(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
      (route) => false,
    );
  }

  // Resend functionality
  Future<void> _resendCode() async {
    if (_isProcessing || !_canResend) return;
    
    if (_resendAttempts >= _maxResendAttempts) {
      _showErrorMessage('Maximum resend attempts reached. Please restart the signup process.');
      return;
    }

    try {
      setState(() {
        _currentState = VerificationState.resending;
        _resendAttempts++;
      });

      await widget.resendOTP();
      
      _showSuccessMessage('New verification code sent to $_maskedEmail');
      
      // Start cooldown timer
      setState(() {
        _timeRemaining = _resendCooldownSeconds;
        _canResend = false;
      });
      
      _startTimer();
      
    } catch (e) {
      log('Resend error: $e');
      _showErrorMessage('Failed to resend code. Please try again.');
    } finally {
      setState(() {
        _currentState = VerificationState.idle;
      });
    }
  }

  // Verify button handler
  void _onVerifyPressed() {
    if (_pinCode.length != 6) {
      _showErrorMessage('Please enter the complete 6-digit code');
      return;
    }
    _verifyPin(_pinCode);
  }

  // Message helpers
  void _showSuccessMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showErrorMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showInfoMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/image_splash2.jpg',
                  width: 700,
                ),
                const SizedBox(height: 24),
            
                // Title
                const Text(
                  "Verify your Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
            
                // Subtext
                Text(
                  "Please enter the 6 digit code sent to your\nemail : $_maskedEmail",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),
            
                // Custom PIN Code Input
                CustomPinCodeField(
                  onCompleted: _onPinCompleted,
                  onChanged: _onPinChanged,
                ),

                const SizedBox(height: 32),
            
                // Verify Button
                SizedBox(
                  width: 284,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: _isProcessing ? null : _onVerifyPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEB953A),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: _currentState == VerificationState.verifying
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : _currentState == VerificationState.creating
                            ? const Text(
                                "Creating Account...",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              )
                            : const Text(
                                "Verify",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                  ),
                ),
            
                const SizedBox(height: 24),
            
                const Text(
                  "Haven't received your code?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
            
                const SizedBox(height: 18),
            
                // Timer + Resend
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formattedTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: (_canResend && !_isProcessing && _resendAttempts < _maxResendAttempts) 
                          ? _resendCode 
                          : null,
                      child: _currentState == VerificationState.resending
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(0xff0900FF),
                              ),
                            )
                          : Text(
                              _resendAttempts >= _maxResendAttempts
                                  ? "Max attempts reached"
                                  : "Resend!",
                              style: TextStyle(
                                fontSize: 15,
                                color: (_canResend && _resendAttempts < _maxResendAttempts)
                                    ? const Color(0xff0900FF)
                                    : Colors.grey,
                                fontWeight: FontWeight.w700,
                                decorationColor: (_canResend && _resendAttempts < _maxResendAttempts)
                                    ? const Color(0xff0900FF)
                                    : Colors.grey,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}