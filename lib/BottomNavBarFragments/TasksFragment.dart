import 'package:flutter/material.dart';
import 'package:task_manager/Database/DatabaseHelper.dart';
import 'package:task_manager/buttons/genericButton.dart';
import 'package:task_manager/commonComponents/DateSelector.dart';
import 'package:task_manager/tasks/TaskWidget.dart';

class TasksFragment extends StatefulWidget {
  const TasksFragment({Key key}) : super(key: key);

  @override
  _TasksFragmentState createState() => _TasksFragmentState();
}

class _TasksFragmentState extends State<TasksFragment> {
  List<TaskWidget> taskList;
  
  @override
  void initState() {
    super.initState();
    
    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        value.forEach((element) {taskList.add(TaskWidget(isCompleted: element['isCompleted'], task: element['taskDescription'], dateTime: element['dateTime'],));
        });
      });
    }).catchError((error) {
      print(error);
    });
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    List<Widget> test = [TaskWidget(isCompleted: false, task: "Finish this app", dateTime: selectedDate,), TaskWidget(isCompleted: false, task: "Fix the inevitable bugs", dateTime: selectedDate,)];


    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            DateSelector(),
            ListView(
              shrinkWrap: true,
              children: test.toList(),
            ),
          ],
        ),
      ),
    );
  }
}





