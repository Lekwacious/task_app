import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortpoint_todo_app/controllers/new_task_controller.dart';
import 'package:shortpoint_todo_app/views/home.dart';

class EditTaskController extends GetxController{
  final taskController = TextEditingController();
  var taskError = "".obs;
  clearTaskError(val) => taskError.value = "";
  var isLoading = false.obs;
  var controller = Get.put(NewTaskController());


  validateTask(BuildContext context, int index) {

    if (GetUtils.isLengthLessThan(taskController.text.trim(), 1)) {
      taskError.value = "Please enter some text";


    }else {
       controller.tasks[index]= taskController.text;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomeScreen()));
    }
  }


}