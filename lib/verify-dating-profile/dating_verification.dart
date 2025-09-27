import 'package:convo_hearts/verify-dating-profile/verify_manullay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../src/feature/BottomBar/bottom_bar.dart';

class Verification_DatingScreen extends StatefulWidget {
  const Verification_DatingScreen({super.key});

  @override
  State<Verification_DatingScreen> createState() => _Verification_DatingScreenState();
}

class _Verification_DatingScreenState extends State<Verification_DatingScreen> {
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

              InkWell( onTap: (){
                  _showSingpassDialog(context);
              },
                child: Image.asset("assets/images/button_myinfo.jpg")),

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerifyManullayScreen()
                    ) 
                  );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: const Color.fromARGB(255, 104, 103, 103),width: 1.5),
                    shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Verify details manually',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
                ElevatedButton(
                  
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar() ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffC672A5),
                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Approximate color based on image
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text(
                    "I'll do it later",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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

void _showSingpassDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: _buildSingpassInfoWidget(),
      );
    },
  );
}

Widget _buildSingpassInfoWidget() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xffE5E5E5), // Light grey background
      borderRadius: BorderRadius.circular(12),
        
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section with red background
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Center(
              child: Image.asset("assets/images/singpass/singpass_logo_fullcolours-2.png") 
              
              // RichText(
              //           text: TextSpan(
              //             text: "s",
              //             style: const TextStyle(
              //               color: Color.fromARGB(255, 255, 71, 15),
              //               fontSize: 44,
              //             ),
              //             children: [
              //               TextSpan(
              //                 text: "i",
              //                 style: const TextStyle(
              //                   color: Color.fromARGB(255, 255, 29, 22),
              //                   // decoration: TextDecoration.underline,
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 44,
              //                 ),
                             
              //               ),
              //               TextSpan(
              //                 text: "ngpass",
              //                 style: const TextStyle(
              //                   color: Color.fromARGB(255, 255, 29, 22),
              //                   // decoration: TextDecoration.underline,
              //                   // fontWeight: FontWeight.w600,
              //                   fontSize: 44,
              //                 ),
                             
              //               ),
              //             ],
              //           ),
              //         ),
            ),
      
      
          ),
          
          // Content section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description text
                const Text(
                  'Singpass retrieves personal data from relevant government agencies to pre-fill the relevant fields, making digital transactions faster and more convenient.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Bold text
                const Text(
                  'This digital service is requesting the following information from Singpass, for the purpose of demonstrating MyInfo APIs',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // White container with information list
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem('Full name'),
                      _buildInfoItem('Gender'),
                      _buildInfoItem('Date of birth'),
                      _buildInfoItem('Race'),
                      _buildInfoItem('Marital status'),
                      _buildInfoItem('Nationality', isLast: true),
                    ],
                  ),
                ),
      
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Center(
                   child: RichText(
                        text: TextSpan(
                          text: 'Clicking "I Agree\" button permit the teacher\'s service to receive your data based on the',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 145, 144, 144),
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: " Term of Use",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 29, 22),
                                // decoration: TextDecoration.underline,
                                // fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                             
                            ),
                          ],
                        ),
                      ),
                    ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(width: .5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text("Cancel",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade500
                          ),
                          )
                        ),
                    ),
                      
                      
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        color: const Color.fromARGB(255, 168, 10, 10),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("I Agree",
                      style: TextStyle(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 255, 255, 255)
                        ),
                        )
                      ),
                
              


                    ],
                  )  
      
      
                  ],
                )
      
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildInfoItem(String text, {bool isLast = false}) {
  return Padding(
    padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '› ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
}

