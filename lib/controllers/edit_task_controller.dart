import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortpoint_todo_app/views/home.dart';

class EditTaskController extends GetxController{
  final taskController = TextEditingController();
  var taskError = "".obs;
  clearEmailError(val) => taskError.value = "";
  var isLoading = false.obs;


  validateTask(BuildContext context) {

    if (GetUtils.isLengthLessThan(taskController.text.trim(), 1)) {
      taskError.value = "Please enter some text";


    }else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomeScreen()));
    }
  }
}