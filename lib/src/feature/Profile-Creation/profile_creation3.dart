// import 'dart:developer';
// import 'package:convo_hearts/Profile-Creation/profile_creation4.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ProfileCreation3 extends StatelessWidget {
//   const ProfileCreation3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics() ,
//           child: Column(
//             children: [
//               // Custom Header
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: Row(
//                   children: [
//                     // Back Button
//                     GestureDetector(
//                       onTap: () => Get.back(),
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         child: SvgPicture.asset("assets/icon/svg/back_arrow.svg")
//                       ),
//                     ),
                    
//                     // Title
//                     const Expanded(
//                       child: Text(
//                         'AI avatar creation',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
                    
//                     // Spacer for alignment
//                     const SizedBox(width: 40),
//                   ],
//                 ),
//               ),
//                SizedBox(height: 30,),
//               // Instruction Text
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, ),
//                 child: Text(
//                   'Feel free to create this at a later step',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey.shade600,
//                     height: 1.4,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, ),
//                 child: Text(
//                   'Your image will be AI generated in a cartoon theme',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w700,
//                     color: const Color.fromARGB(255, 0, 0, 0),
//                     height: 1.4,
//                   ),
//                 ),
//               ),
//                SizedBox(height: 60,),
              
//               // Main Content Area - Removed Expanded widget
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Image Container
//                     Container(
//                       width: double.infinity,
//                       height: 480,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(24),
                        
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             // Avatar Image
//                             Image.asset(
//                               'assets/images/camer_avatar.jpg', // Replace with your image
//                               fit: BoxFit.cover,
//                             ),
                            
//                             // Subtle gradient overlay for better contrast
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.transparent,
//                                     Colors.black.withOpacity(0.1),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
                    
//                     // const SizedBox(height: 40),
                    
//                     // Camera Button
//                     InkWell(
//                       onTap: () {
//                         Get.to(()=>ProfileCreation4(), transition: Transition.fadeIn, duration: Duration(milliseconds: 800));
//                         // Handle camera action
//                         log('Camera button pressed');
//                       },
//                       child: Image.asset("assets/images/camera.jpg"),
//                     ),
                    
//                     // const SizedBox(height: 16),
                    
//                     // Camera Label
//                     const Text(
//                       'Camera',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



















import 'dart:developer';

import 'package:convo_hearts/src/feature/Profile-Creation/profile_creation4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCreation3 extends StatelessWidget {
  const ProfileCreation3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset("assets/icon/svg/back_arrow.svg"), // Replace with SVG if needed
                      ),
                    ),
                    
                    // Title
                    const Expanded(
                      child: Text(
                        'AI avatar creation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    
                    // Spacer for alignment
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              SizedBox(height: 30),
              
              // Instruction Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Feel free to create this at a later step',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Your image will be AI generated in a cartoon theme',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(height: 60),
              
              // Main Content Area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image Container
                    Container(
                      width: double.infinity,
                      height: 480,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Avatar Image
                            Image.asset(
                              'assets/images/camer_avatar.jpg', // Replace with your image
                              fit: BoxFit.cover,
                            ),
                            
                            // Subtle gradient overlay for better contrast
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.1),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Camera Button
                    InkWell(
                      onTap: () {
                        // Navigate to next page
                        log('Camera button pressed pp3 ');
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileCreation4()));
                      },
                      child: Image.asset("assets/images/camera.jpg"),
                    ),
                    
                    // Camera Label
                    const Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}