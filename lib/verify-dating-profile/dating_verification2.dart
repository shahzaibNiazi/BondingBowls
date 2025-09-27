import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../src/feature/BottomBar/bottom_bar.dart';

class Verification_DatingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Color(0xffFFF7ED),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    'Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 16),
            
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xffECEFF1), width: 2 ) 
                  ),
                  child: 
                  Column(
                    children: [
                      // Description
    
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                      // textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Users looking for  ",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6C757D),
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: "Dating/ friends 🕺💃",
                            style: const TextStyle(
                              color: Color(0xffFF0909),
                              fontSize: 16,
                              // decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                            ),
                      
                          ),
                          
                        ],
                      ),
                    ),
              ),
              Text("(further verification needed after profile setup🔐)", style: TextStyle(fontStyle: FontStyle.italic),),
                SizedBox(height: 20),
                Row(children: [
                  Text("• "),
                  Text(
                  'Profile Setup ',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 16,
                    color: Color(0xff505050),
                  ),
                ), 
                SvgPicture.asset("assets/icon/svg/tick.svg", height: 24, width: 24,),
                ]),

                Row(children: [
                  Text("• "),
                  Text(
                  'Verification',
                  style: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 16,
                    color: Color(0xff505050),
                  ),
                ), 
                ]),


                                SizedBox(height: 20),

                Text(
                  'To help find the most meaningful connections, your Age, Gender, Race, and Marital Status will be visible to all users.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 24),



                Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                      // textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "We believe in matching people through their inner beauty, while ensuring every interaction is",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: " safe and secure",
                            style: const TextStyle(
                              color: Color(0xff505050),
                              fontSize: 18,
                              // decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                            ),
                      
                          ),
                          
                        ],
                      ),
                    ),
              ),

   

                SizedBox(height: 24),

              Text("Once you're in, you’ll explore and connect through avatars, pseudonyms, and authentic conversations.Ready to get started?",style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),),

                // Myinfo Section
                
                Image.asset("assets/images/myinfo.jpg"),

                SizedBox(height: 8),

              Image.asset("assets/images/button_myinfo.jpg"),

                SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Instant Automatic Verification, ",
                          style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff505050),
                    ),
                        children: [
                          TextSpan(
                            text: "once per user",
                            style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: Color(0xff505050),
                    ),
                        
                      
                          ),
                        ],
                      ),
                    ),



       
                SizedBox(height: 16),

                Row(
              children: const [
                Expanded(child: Divider(color: Colors.black,thickness: 1,)),
                SizedBox(width: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("or", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 20,),

                Expanded(child: Divider(thickness: 1, color: Colors.black,)),
              ],
            ),
SizedBox(height: 30,),
                OutlinedButton(
                  onPressed: () {
                    // Handle Verify details manually action
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Verify details manually',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(textAlign: TextAlign.center,
                  'As form of identification is accepted. It’ll take us 2-3 working days to verify your identity',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 24),
            
                // I'll do it later button
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                      Get.to(()=>BottomNavBar() , transition: Transition.downToUp , duration: Duration(milliseconds: 800));
                      // Handle I'll do it later action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC672A5), // Approximate color based on image
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(150, 50),
                    ),
                    child: Text(
                      "I'll do it later",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

