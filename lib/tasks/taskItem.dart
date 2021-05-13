import 'package:flutter/material.dart';


class TaskItem extends ChangeNotifier {
  bool isCompleted;
  String taskDescription;
  DateTime dateTime;

  TaskItem(this.isCompleted, this.taskDescription, this.dateTime);

  updateIsCompleted() {
    this.isCompleted = !this.isCompleted;
    notifyListeners();
  }

  modifyTaskDescription(String newTaskDescription) {
    this.taskDescription = newTaskDescription;
    notifyListeners();
  }

  modifyDateTime(DateTime newDateTime) {
    this.dateTime = newDateTime;
    notifyListeners();
  }


}
