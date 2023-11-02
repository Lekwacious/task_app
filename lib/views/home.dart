import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortpoint_todo_app/controllers/new_task_controller.dart';
import 'package:shortpoint_todo_app/views/edit_task.dart';
import 'package:shortpoint_todo_app/views/new_task.dart';

import '../components/app_colors.dart';
import '../components/scrow_behaviour.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  var controller = Get.put(NewTaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Container(
            // color: Colors.white,
            child: ScrollConfiguration(
                behavior: RemoveScrollBubbleBehavior(),
                child: ListView(
                  children: [
                    Container(
                      color: appBlueColor,
                      height: 116,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/pngs/user.png"),
                            SizedBox(
                              width: 15,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hello, Jhon \n',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "What are your plans\n for today?",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Material(
                          elevation: 5,
                          child: Container(
                            color: yellowColor,
                            height: 116,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/pngs/cup.png"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Go Pro (No Ads)? \n',
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              color: appDarkBlueColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "No fuss, no ads, for only \$1 a month",
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
                          ),
                        ),
                        Positioned(
                          right: 23,
                          bottom: 45,
                          child: Container(
                            width: 66.11,
                            height: 71,
                            color: appDarkBlueColor,
                            child: Center(
                                child: Text(
                              "\$1",
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  color: yellowColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(2),
                              elevation: 5,
                              child: Container(
                                height: 91,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Checkbox(
                                      shape: const CircleBorder(),
                                      value: controller.ischeck.value,
                                      onChanged: (bool? newValue) {
                                        controller.ischeck == true;
                                        // setState(() {
                                        //   checkBoxValue = newValue!;
                                        // });
                                      },
                                      activeColor: Colors.green,
                                    ),
                                    Text(controller.tasks[index],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: appDarkBlueColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          EditTask(
                                                              index,
                                                              controller.tasks[
                                                                  index])));
                                          controller.ischeck == true;
                                        },
                                        style: ElevatedButton.styleFrom(
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: appDarkBlueColor,
                                            ),
                                            primary: Colors.white,
                                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                            textStyle: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                        child: Container(
                                          child: Text(
                                            "Edit",
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: appDarkBlueColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                )),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBlueColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => NewTask()));
        },
      ),
    );
  }
}
