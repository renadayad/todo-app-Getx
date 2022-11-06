import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoproject/C/task_dat.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  final Function addtaskcall;
  AddTask(this.addtaskcall);
  var todoController = Get.put(TaskData());

  @override
  Widget build(BuildContext context) {
    String? newTask;

    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Text('Add Task',
              style: TextStyle(
                  fontSize: 31,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          TextField(
            autofocus: true,
            onChanged: (nwevalue) {
              newTask = nwevalue;
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              todoController.addTask(newTask.toString());
              Get.back();
            },
            child: Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lime,
              primary: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
