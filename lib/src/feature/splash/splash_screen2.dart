import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen2Controller extends GetxController {
  void navigateToSplashScreen3() {
    Get.off(() => const SplashScreen2(),transition: Transition.leftToRight ,duration: Duration(milliseconds: 800 ));
  }
}

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreen2Controller>(
      init: SplashScreen2Controller(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // const SizedBox(height: 80), // Replace Spacer
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icon/svg/alert_icon.svg',
                      height: 48,
                      width: 48,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "There's a problem\nloading this page",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Please check your Network Connection\nand reload this page. If that doesn't work\nplease visit our status page for updates\nand try again later",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 24),
                    Image.asset(
                      'assets/images/robot_taco.jpg',
                      height: 250,
                      width: 330,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => controller.navigateToSplashScreen3(),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 197,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffEB953A),
                        ),
                        child: const Text(
                          "Reload",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Spacer(), // This one is now safe because we used IntrinsicHeight
                    const Text(
                      "App Ver v1.0",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}