
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../matchmaking/match_matching.dart';
import 'Intro.dart';
import 'getbowls.dart';

class SettingsScreen extends StatefulWidget {
   const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
List<Widget> Screens = [
  const SizedBox(),
  MatchmakingScreen(),
  IntroScreen(),
  const GetBowlsScreen(), // Add other screens in order here
  Container(child: Text("Privacy"),), // Add other screens in order here
  const GetBowlsScreen(), // Add other screens in order here

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED), // Light peach background
      body: SafeArea(
        child: Column(
          children: [
            // Back Button Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: "Playfair",
                           fontWeight: FontWeight.w700,
                           color: Color(0xff000000)
                           ),
                      ),
                    ),
                  ],
                ),
              ),
            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.pinkAccent.withOpacity(0.4)),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Column(
                        children: [
                          _buildSettingItem("Getting Started",0),
                          _buildSettingItem("Matchmaking Settings",1),
                          _buildSettingItem("Intro", 2),
                          _buildSettingItem("Help", 3),
                          _buildSettingItem("Privacy Policy & Terms of Service", 4),
                          _buildSettingItem("Get More Bowls", 5),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              SvgPicture.asset("assets/icon/svg/telegram.svg", height: 34, width: 34,),
                              SizedBox(width: 16),
                              SvgPicture.asset("assets/icon/svg/insta.svg"),
                              SizedBox(width: 16),
                              SvgPicture.asset("assets/icon/svg/tiktok.svg"),
                            ],
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFA6D8C),
                              minimumSize: Size(130, 27),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Delete my account",
                              style: TextStyle(
                                color: Color(0xffFF0000),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xffFF0000)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("App ver 1.0",
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0))),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

Widget _buildSettingItem(String title, int index) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          if (index == 0) {
            // Show dialog for "Getting Started"
            Get.defaultDialog(
              title: "NAV tutorial (Getting started)",
              content: const Text(
                "- Food users [just food discount button]\n"
                "- Completed step dating user [phone verify button]\n"
                "- Skipped step dating user [I’ll do it later button]\n\n"
                "In short: Once user steps into app, show nav bar or when they press 'Getting Started'.\n\n"
                "To Fiverr: Bring forward and highlight the stroke, etc.",
                textAlign: TextAlign.left,
              ),
            );
          } else if (index < Screens.length) {
            Get.to(() => Screens[index],
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 800),
            );
          }
        },
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          trailing: SvgPicture.asset("assets/icon/svg/arrow.svg"),
        ),
      ),
      const Divider(thickness: 1),
    ],
  );
}
}
