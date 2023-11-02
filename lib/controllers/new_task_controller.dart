import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shortpoint_todo_app/views/home.dart';

import '../views/edit_task.dart';

class NewTaskController extends GetxController{

  RxList tasks = [].obs;

  var ischeck = false.obs;

  late  TextEditingController newTaskController = TextEditingController();
  var taskError = "".obs;
  clearTaskError(val) => taskError.value = "";
  clearTaskValue(val) => newTaskController.text = "";
  var isLoading = false.obs;


  validateTask(BuildContext context) {

   if (GetUtils.isLengthLessThan(newTaskController.text.trim(), 1)) {
     taskError.value = "Please enter some text";


    }else {
     tasks.add(newTaskController.text);
     print(tasks[0]);
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (BuildContext context) =>
                 HomeScreen()));
    }
  }


}