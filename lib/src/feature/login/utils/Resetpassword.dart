import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:convo_hearts/widgets/Custom_TextField.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    const orangeColor = Color(0xFFF19153);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Logo
                Image.asset(
                  'assets/images/image_splash2.jpg',
                  // height: 160,
                  width: double.infinity,
                ),
                const SizedBox(height: 20),

                const Text(
                  "Choose a New Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),

                // New Password Field
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Type your Password",
                  obscureText: _obscurePassword,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset("assets/icon/svg/lock.svg", height: 20, width: 20),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Confirm Password Field
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: "Re-Type your Password",
                  obscureText: _obscureConfirmPassword,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset("assets/icon/svg/lock.svg", height: 20, width: 20),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    child: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Password Requirements
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create passwords with at least 12\ncharacters, including a mix of:",
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
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
                        Text("        • Uppercase and lowercase letters", 
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                        

                        ),
                        Text("        • Numbers",
                        
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                        ),
                        Text("        • Special characters (e.g., ! @ # \$ %)",
                        
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Change Password Button
                ElevatedButton(
                  onPressed: () {
                    // Handle password reset logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(284, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Change Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w700, 
                      fontSize: 23,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
