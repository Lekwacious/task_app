import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NewTaskController extends GetxController{

  final taskController = TextEditingController();
  var taskError = "".obs;
  clearEmailError(val) => taskError.value = "";
  var isLoading = false.obs;


  validateTask(BuildContext context) {

   if (GetUtils.isLengthLessThan(taskController.text.trim(), 5)) {
      passwordError.value = "Please enter a valid password";

    }else {
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (BuildContext context) =>
                 EditTask()));
    }
  }


}