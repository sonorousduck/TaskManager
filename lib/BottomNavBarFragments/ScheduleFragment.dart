import 'package:flutter/material.dart';
import 'package:task_manager/buttons/genericButton.dart';
import 'package:task_manager/commonComponents/DateSelector.dart';
import 'package:task_manager/tasks/taskItem.dart';

class ScheduleFragment extends StatelessWidget {
  const ScheduleFragment({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    // List<TaskItem> test = [TaskItem(false, "test 1", selectedDate), TaskItem(false, "test 2", selectedDate), TaskItem(false, "test 3", selectedDate),];
    List<Widget> test = [Button(text:"Test 3", press:(){}, color: Colors.blue, width: 100,), Button(text:"Test 4", press:(){}, color: Colors.blue, width: 100,)];


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







