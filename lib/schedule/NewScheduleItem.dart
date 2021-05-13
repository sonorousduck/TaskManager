import 'package:flutter/material.dart';
import 'package:task_manager/buttons/genericButton.dart';
import 'package:task_manager/commonComponents/DateTimePicker.dart';

class NewScheduleItem extends StatelessWidget {
  const NewScheduleItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SchedulerItem(),
    );
  }
}

class SchedulerItem extends StatefulWidget {
  const SchedulerItem({Key key}) : super(key: key);

  @override
  _SchedulerItemState createState() => _SchedulerItemState();
}

class _SchedulerItemState extends State<SchedulerItem> {

  String dateTime = DateTime.now().month.toString() +
      "/" +
      (DateTime.now().day + 1).toString() +
      "/" +
      DateTime.now().year.toString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _taskController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Schedule Item cannot be left empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Schedule Item"),
                ),
              ),
              DateTimePicker(onDateTimeChanged: (newDateTime) {dateTime = newDateTime;}),
              Spacer(),
              Button(
                text: "Create Task",
                color: Colors.green,
                press: () async {
                  if (_formKey.currentState.validate()) {
                    // TODO: Create Schedule Item Here
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Schedule item has been added!")),
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _taskController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }
}




