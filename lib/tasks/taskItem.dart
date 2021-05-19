import 'package:flutter/material.dart';


class TaskItem extends ChangeNotifier {
  bool isCompleted;
  String taskDescription;
  DateTime dateTime;
  int id;

  TaskItem(this.isCompleted, this.taskDescription, this.dateTime);


  updateIsCompleted() {
    print(this.isCompleted);
    this.isCompleted = !this.isCompleted;
    print(this.isCompleted);
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'taskDescription': this.taskDescription, 'isCompleted': this.isCompleted, 'dateTime': this.dateTime};
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
