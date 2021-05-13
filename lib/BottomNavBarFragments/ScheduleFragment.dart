import 'package:flutter/material.dart';
import 'package:task_manager/buttons/genericButton.dart';
import 'package:task_manager/tasks/taskItem.dart';

class ScheduleFragment extends StatelessWidget {
  const ScheduleFragment({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    // List<TaskItem> test = [TaskItem(false, "test 1", selectedDate), TaskItem(false, "test 2", selectedDate), TaskItem(false, "test 3", selectedDate),];
    List<Widget> test = [Button(text:"Test 1", press:(){}, color:Colors.green, width: 100,), Button(text:"Test 2", press:(){}, color:Colors.green, width: 100,)];


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

class DateSelector extends StatefulWidget {
  const DateSelector({Key key}) : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {

  _changeDateBack(dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day - 1);
  }

  _changeDateForward(dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
  }

  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
            selectedDate = _changeDateBack(selectedDate);
            setState(() {
            });
          }),
          Spacer(),
          Text(selectedDate.month.toString() + "/" + selectedDate.day.toString() + "/" + selectedDate.year.toString()),
          Spacer(),
          IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {
            selectedDate = _changeDateForward(selectedDate);
            setState(() {
            });
          }),
        ],
      ),
    );
  }
}





