import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_colors.dart';
import '../components/custom_button.dart';
import '../components/scrow_behaviour.dart';
import '../components/task_input_form.dart';
import '../controllers/home_screen_controller.dart';
import '../controllers/new_task_controller.dart';

class EditTask extends StatelessWidget {
  var controller = Get.put(NewTaskController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlueColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            // Navigator.pop(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             ProfileView()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            "Edit Task",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ScrollConfiguration(
              behavior: RemoveScrollBubbleBehavior(),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 73,
                    ),
                    FormTextField(
                      headerText: "Task name",
                      errortxt: controller.taskError.value.isEmpty
                          ? null
                          : controller.taskError.value,
                      textCapitalization: TextCapitalization.none,
                      //labelText: 'johndoe@example.com',
                      hintText: 'johndoe@example.com',
                      textInputAction: TextInputAction.next,
                      onChange: controller.clearEmailError,
                      textInputType: TextInputType.text,
                      controller: controller.taskController,
                      validator: (String) {},
                    ),


                    const SizedBox(
                      height: 361,
                    ),

                    CustomButton(
                      text: "Done",
                      isLoading: controller.isLoading.value,
                      onTap: () {
                        // controller.validateSignUp(context);
                      },
                      color: appBlueColor,
                      textColor: Colors.white,
                      loadingColor: Colors.white,
                    ),

                  ],
                ),
              )),
        ),
      ),
    );
  }
}