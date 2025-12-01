import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';
import '../../../app/utils/utils.dart';
import '../settings/settings.dart';

class ProfileDiscount extends StatelessWidget {
  const ProfileDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDEFE6), // Light peach
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              Image.asset(Utils.getImagePath('bowls_remove'), scale: 5),

              // Title + Settings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ),
                          );
                        },
                        icon: SvgPicture.asset("assets/icon/svg/setting1.svg"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Profile Card
              Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).size.height *
                    0.8, // Fixed height based on screen size
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffdd80b8)),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Avatar
                    Image.asset("assets/images/avatar.jpg"), // Your avatar
                    const SizedBox(height: 10),

                    // Email
                    Text(
                      'ahjdoud!@gmail.com',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffC672A5),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Button with notification dot
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xffF0E8DC,
                              ), // Beige color
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width:
                                      2.0, // Slightly thicker border to match image
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.PROFILE_CREATION);
                            },
                            child: Text(
                              "Set up your dating profile now!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        // Red notification dot positioned like in the image
                        Positioned(
                          top: -5,
                          right: -1,
                          child: Container(
                            width: 27,
                            height: 26,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 250, 250, 250),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        Positioned(
                          top: -5,
                          right: 0,
                          child: Container(
                            width: 23,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icon/svg/info.svg"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
