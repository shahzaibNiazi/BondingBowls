import 'dart:async';
import 'package:convo_hearts/widgets/Custom_PIn_Code.dart';
import 'package:flutter/material.dart';

import 'Reset_password.dart';

class VerifyResetPassword extends StatefulWidget {
  const VerifyResetPassword({super.key});

  @override
  State<VerifyResetPassword> createState() => _VerifyResetPasswordState();
}

class _VerifyResetPasswordState extends State<VerifyResetPassword> {
  int _start = 20;
  late Timer _timer;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 20;
    canResend = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          canResend = true;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onPinCompleted(String pin) {
    debugPrint("PIN Entered: $pin");
    // Verify logic here
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
                  // height: ,
                  width: 700,
                ),
                const SizedBox(height: 24),
            
                // Title
                const Text(
                  "Password Reset ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
            
                // Subtext
                const Text(
                  "Please enter the 6 digit code sent to your\nemail : *****hf20@**ail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),
            
                // Custom PIN Code Input
                CustomPinCodeField(
                  onCompleted: _onPinCompleted,
                ),
            
                const SizedBox(height: 32),
            
                // Verify Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEB953A),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(284, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontWeight: FontWeight.w700,  
                  fontSize: 24),
                  ),
                ),
            
                const SizedBox(height: 24),
            
                const Text(
                  "Haven’t received your code?",
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w700, color: Colors.black),
                ),
            
                const SizedBox(height: 18),
            
                // Timer + Resend
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "00:${_start.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: canResend
                          ? () {
                              _startTimer();
                              // Call resend code logic
                            }
                          : null,
                      child: Text(
                        "Resend!",
                        style: TextStyle(
                          fontSize: 15,
                          color: canResend ? Color(0xff0900FF) : Colors.grey,
                          fontWeight: FontWeight.w700,
                        decorationColor: canResend ? Color(0xff0900FF) : Colors.grey,
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
