import 'package:flutter/material.dart';
// import 'package:todoproject/screens/tasks.dart';
// import 'package:todoproject/C/task_dat.dart';
import 'package:get/get.dart';

class TaskData extends GetxController {
  var tasks = [].obs;
  // var value = false.obs;

  void addTask(var newTask) {
    tasks.add(newTask);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }
}
