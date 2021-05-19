import 'package:flutter/material.dart';
import 'package:task_manager/tasks/taskItem.dart';


class TaskWidget extends StatefulWidget {
  String task;
  bool isCompleted;
  DateTime dateTime;
  int id;



  TaskWidget({Key key, this.isCompleted, this.task, this.dateTime, this.id}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState(isCompleted: this.isCompleted, task: this.task, dateTime: this.dateTime, id: this.id);
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isCompleted;
  String task;
  DateTime dateTime;
  int id;

  _TaskWidgetState({this.isCompleted, this.task, this.dateTime, this.id});


  @override
  Widget build(BuildContext context) {
    TaskItem myTask = TaskItem(this.isCompleted, this.task, this.dateTime);
    return Row(
      children: [
        IconButton(iconSize: 24, icon: this.isCompleted ? Icon(Icons.check_circle) : Icon(Icons.brightness_1_outlined), onPressed: () {
          setState(() {
            myTask.updateIsCompleted();
            this.isCompleted = myTask.isCompleted;
          });
        }),
        Text(myTask.taskDescription, style: TextStyle(fontSize: 18),)
      ],

    );
  }
}

