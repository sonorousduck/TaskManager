import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  final ValueChanged<String> onDateTimeChanged;

  DateTimePicker({
    Key key,
    this.onDateTimeChanged}) : super(key: key);


  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  double _height = 500;
  double _width = 500;

  String _setTime;
  String _setDate;

  String dateTime;

  //TODO: Implement some setting or something that changes default to the day you want.
  // DateTime selectedDate = DateTime.now();
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);


  TextEditingController _dateController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
        widget.onDateTimeChanged(_dateController.text);

      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Choose Date',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5),
          ),
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Card(
              elevation: 2.0,
              child: Container(
                width: _width / 1.7,
                height: _height / 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: TextFormField(
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  onChanged: (String val) {
                    print(val);
                    widget.onDateTimeChanged(val.toString());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// }
