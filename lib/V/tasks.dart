import 'package:flutter/material.dart';
import 'package:todoproject/C/task_dat.dart';
import 'package:todoproject/V/add_task.dart';
import 'package:todoproject/C/task_dat.dart';
import 'package:get/get.dart';

class Tasks extends StatelessWidget {
  @override
  var todoController = Get.put(TaskData());
  bool value = false;
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // ignore: prefer_const_constructors
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTask((newTask) {}))),
            );
          },
          backgroundColor: Colors.indigo,
          // ignore: prefer_const_constructors
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.lime,
        body: Container(
            padding:
                const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Icon(Icons.playlist_add_check, size: 40, color: Colors.black),
                  SizedBox(width: 20),
                  Text(
                    "My Task",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Obx((() => Text(
                    '${todoController.tasks.length} Tasks',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ))),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Obx((() => ListView.builder(
                          itemCount: todoController.tasks.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text('${todoController.tasks[index]}'),
                                leading: Checkbox(
                                  value: value,
                                  onChanged: (value) => this.value = value!,
                                )
                                // GestureDetector(
                                //   child: Icon(Icons.check_box_outline_blank),
                                //   onTap: () {
                                //     print('I want to select task');
                                //   },
                                // ),
                                ,
                                trailing: IconButton(
                                  onPressed: () {
                                    todoController.deleteTask(index);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            );
                          })))))
            ])));
  }
}
