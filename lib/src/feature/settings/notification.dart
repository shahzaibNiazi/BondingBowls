import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xff000000),
        ),
      ),
    );
  }

  Widget notificationCard({
    required String SvgAsset,
    required String time,
    required String message,
    Color boxcolor = Colors.white,
    Color iconColor = Colors.black,
    bool boldText = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
        color: boxcolor,
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgAsset),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: '',

                      children: [
                        if (boldText)
                          TextSpan(
                            text: message,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xff000000),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        else
                          TextSpan(text: message),
                      ],
                    ),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationCard1({
    required String SvgAsset,
    required String time,
    required String message,
    Color boxcolor = Colors.white,
    Color iconColor = Colors.black,
    bool boldText = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
        color: boxcolor,
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgAsset),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: '',
                      children: [
                        if (boldText)
                          TextSpan(
                            text: message,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xff000000),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        else
                          TextSpan(text: message),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Color(0xff000000),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget offerCard({
    required String svgAssetPath,
    required String time,
    required String message,
    String extra = '',
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // ✅ Load the SVG from the provided path
          SvgPicture.asset(svgAssetPath, width: 24, height: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                    if (extra.isNotEmpty)
                      Text(
                        extra,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget offerCard1({
    required String svgAssetPath,
    required String time,
    required String message,
    String extra = '',
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // ✅ Load the SVG from the provided path
          Image.asset(svgAssetPath, width: 26, height: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                    if (extra.isNotEmpty)
                      Text(
                        extra,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEBDD),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFFCEBDD),
      //   elevation: 0,
      //   leading: const BackButton(color: Colors.black),
      //   title: const Text(
      //     'Notifications',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Stack(
                  children: [
                    // Back button positioned on the left
                    Positioned(
                      left: 10,
                      top: 20,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icon/svg/back_arrow.svg",
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    // Title centered
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF7ED),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    sectionTitle("New Matches"),

                    notificationCard(
                      SvgAsset: "assets/icon/svg/fav.svg",
                      // iconColor: Colors.red,
                      time: '7 min ago',
                      message: 'Someone has sent you a Super Like!',
                      boldText: true,
                    ),
                    notificationCard(
                      SvgAsset: "assets/icon/svg/noti_person.svg",
                      iconColor: Colors.green,
                      time: '2 min ago',
                      message: 'Alex has liked you back!',
                      boldText: true,
                    ),
                    notificationCard1(
                      SvgAsset: "assets/icon/svg/like.svg",
                      iconColor: Colors.black,
                      time: '1 min ago',
                      message: 'Someone likes you!',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFF7ED),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Special Offers Section
                    sectionTitle("Special Offers"),
                    Text(
                      "Click inside for more info!",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 8),
                    offerCard1(
                      svgAssetPath: "assets/images/cup_coffee1.jpg",
                      time: '7 min ago',
                      extra: 'T&C applies',
                      message: '50% OFF at Coffee Haven at Cafeco',
                    ),
                    offerCard(
                      svgAssetPath: "assets/icon/svg/bold_newsletter.svg",
                      time: '2 min ago',
                      extra: 'T&C applies',
                      message: 'Buy 1 Get 1 free at Bread Walk at Nea',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFF7ED),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    sectionTitle("System Taco Updates"),
                    notificationCard(
                      SvgAsset: "assets/icon/svg/verified.svg",

                      time: '2 min ago',
                      message: 'Account Verified!',
                      boldText: true,
                    ),
                    notificationCard1(
                      SvgAsset: "assets/icon/svg/privacy_policy.svg",
                      time: '1 hour ago',
                      message: 'Privacy Policy Update',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
