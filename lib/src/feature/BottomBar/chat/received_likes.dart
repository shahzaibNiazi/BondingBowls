import 'package:convo_hearts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Presentation/payment_system/views/payment_system_view.dart';
import 'detail_profile.dart';

class ReceivedLikesScreen extends StatefulWidget {
  const ReceivedLikesScreen({super.key});

  @override
  State<ReceivedLikesScreen> createState() => _ReceivedLikesScreenState();
}

class _ReceivedLikesScreenState extends State<ReceivedLikesScreen> {
  bool isReligionUnlocked = false;
  // Track if religion filter is unlocked

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade100,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Callback function to handle religion unlock
  void onReligionUnlocked() {
    setState(() {
      isReligionUnlocked = true;
    });
    showSnackBar("Religion filter unlocked successfully!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA), // Light peach background
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button, title, and settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      "assets/icon/svg/back_arrow.svg",
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Received Likes",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentSystemView(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icon/svg/bowl.svg",
                          height: 33,
                          width: 33,
                        ),
                      ),
                      Text(
                        "300",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Slideshow ads space
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Center(
                child: Text(
                  '~Slideshow Ads Space',
                  style: TextStyle(
                    color: Color(0xffC672A5),
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            // User profile card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffBCBCBC), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Profile image with heart overlay
                      Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/AI-AVATAR.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),

                      // User info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name and age
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Mary',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '38',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailProfile(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/images/match_logo.png",
                                    height: 55,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),

                            // Status
                            Text(
                              'Married Female',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 2),

                            // Relationship type
                            Text(
                              'Serious',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Tags
                            Text(
                              'Software Engineer | Coffee Enthusiast | Yoga Lover',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xFFBC0072),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Click to view
                          ],
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.MATCH_PROFILE);
                    },
                    child: Text(
                      'Click to view!',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Stack(
              children: [
                // Main content - Column with profile cards
                Column(
                  children: [
                    // First profile card
                    Container(
                      margin: const EdgeInsets.only(bottom: 1),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Profile image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/AI-AVATAR.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // User info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name and age
                                    Row(
                                      children: [
                                        Text(
                                          'Mary',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '38',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),

                                    // Status
                                    Text(
                                      'Married Female',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 2),

                                    // Relationship type
                                    Text(
                                      'Serious',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Tags
                                    Text(
                                      'Software Engineer | Coffee Enthusiast | Yoga Lover',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xFFBC0072),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Click to view!',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Second profile card
                    Container(
                      margin: const EdgeInsets.only(bottom: 1),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Profile image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/AI-AVATAR.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // User info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name and age
                                    Row(
                                      children: [
                                        Text(
                                          'Mary',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '38',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),

                                    // Status
                                    Text(
                                      'Married Female',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 2),

                                    // Relationship type
                                    Text(
                                      'Serious',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Tags
                                    Text(
                                      'Software Engineer | Coffee Enthusiast | Yoga Lover',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xFFBC0072),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Click to view!',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Additional profile cards can be added here...
                  ],
                ),

                // Overlay message positioned at the top
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   right: 0,
                //   child: Expanded(
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                //       decoration: BoxDecoration(
                //         color: const Color(0xFFFFFFFF).withOpacity(0.95),
                //         border: Border(
                //           bottom: BorderSide(
                //             color: const Color(0xFFBC0072).withOpacity(0.2),
                //             width: 1,
                //           ),
                //         ),
                //       ),
                //       child: const Text(
                //         "67 more likes to review~ Click to Unlock all received likes at one go",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w700,
                //           color: Color(0xFFBC0072),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned.fill(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => ConfirmPurchaseDialog(
                          onPurchaseConfirmed: onReligionUnlocked,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF).withOpacity(0.95),
                        border: Border(
                          bottom: BorderSide(
                            color: const Color(0xFFBC0072).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            "67 more likes to review~ Click to Unlock all received likes at one go",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFBC0072),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPurchaseDialog extends StatelessWidget {
  final VoidCallback onPurchaseConfirmed;

  const ConfirmPurchaseDialog({super.key, required this.onPurchaseConfirmed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffFFEEDA),
            border: Border.all(color: Color(0xffBC0072), width: 2),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(color: Color(0xffBC0072), width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Section
                Text(
                  "Confirm Purchase of",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Product Info Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/svg/icon_message.svg",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Received Likes Unlocker +1 Month",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "= ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBC0072),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icon/svg/color_bowl.svg",
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            " 200",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBC0072),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  "This will unlock all your received likes Immediately",
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Calculation Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Available", style: TextStyle(fontSize: 10.sp)),
                    Text("Deductibles", style: TextStyle(fontSize: 10.sp)),
                    Text("Balance", style: TextStyle(fontSize: 10.sp)),
                  ],
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffC672A5),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/svg/color_bowl.svg",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "300",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("-", style: TextStyle(fontSize: 16.sp)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/svg/color_bowl.svg",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "200",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFF0000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("=", style: TextStyle(fontSize: 16.sp)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/svg/color_bowl.svg",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "100",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Terms Text
                Text(
                  "Purchase made are non refundable as per TOS",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffDA4747),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onPurchaseConfirmed(); // Call the callback to unlock religion filter
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
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
