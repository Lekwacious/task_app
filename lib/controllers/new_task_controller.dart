import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shortpoint_todo_app/views/home.dart';

import '../views/edit_task.dart';

class NewTaskController extends GetxController{

  RxList tasks = [].obs;

  final taskController = TextEditingController();
  var taskError = "".obs;
  clearEmailError(val) => taskError.value = "";
  var isLoading = false.obs;


  validateTask(BuildContext context) {

   if (GetUtils.isLengthLessThan(taskController.text.trim(), 1)) {
     taskError.value = "Please enter some text";


    }else {
     tasks.add(taskController.text);
     print(tasks[0]);
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (BuildContext context) =>
                 HomeScreen()));
    }
  }


}