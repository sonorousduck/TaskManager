import 'package:flutter/material.dart';

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
