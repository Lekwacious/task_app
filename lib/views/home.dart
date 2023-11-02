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
        child: Obx(()=>
           Container(
            color: Colors.white,
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
                    Container(
                      color: yellowColor,
                      height: 116,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/pngs/cup.png"),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Checkbox(

                                      shape: const CircleBorder(),
                                      value: true,
                                      onChanged: (bool? newValue) {
                                        // setState(() {
                                        //   checkBoxValue = newValue!;
                                        // });
                                      },
                                      activeColor: Colors.green,
                                    ),
                                    Text(controller.tasks[index]),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (BuildContext context) => EditTask(index, controller.tasks[index])));

                                        },
                                        child: Container(
                                          child: Text("Edit"),
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
