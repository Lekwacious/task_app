import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortpoint_todo_app/views/new_task.dart';

import '../components/app_colors.dart';
import '../components/scrow_behaviour.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  var controller = Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: appBlueColor),
      //   leading: GestureDetector(
      //     onTap: () {
      //       // Navigator.pop(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //         builder: (BuildContext context) =>
      //       //             ProfileView()));
      //     },
      //     child: const Icon(
      //       Icons.arrow_back,
      //     ),
      //   ),
      //   title: Center(
      //     child: Text(
      //       "Inbox",
      //       style: GoogleFonts.lato(
      //         textStyle: const TextStyle(
      //           fontSize: 22,
      //           color: Colors.black,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ScrollConfiguration(
              behavior: RemoveScrollBubbleBehavior(),
              child: ListView(
                children: [

                  Container(
                    color: appBlueColor,
                    height: 116,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/pngs/cup.png"),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello, Jhon? \n', style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: appDarkBlueColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),),

                              TextSpan(
                                text: "What are your plan for today?",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    color: appLightBlueColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    color: yellowColor,
                    height: 116,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/pngs/cup.png"),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Go Pro (No Ads)? \n', style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: appDarkBlueColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),),

                              TextSpan(
                                text: "No fuss, no ads, for only \$1 a month",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: appLightBlueColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  Column(
                    children: [

                      Text("No Messages Found", style:GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Take the first steps and contact a broker", style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),),
                    ],
                  )



                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBlueColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      NewTask()));
        },
    ),
    );
  }
}