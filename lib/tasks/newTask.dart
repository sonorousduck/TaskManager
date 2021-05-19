import 'package:flutter/material.dart';
import 'package:task_manager/Database/DatabaseHelper.dart';
import 'package:task_manager/buttons/genericButton.dart';
import 'package:task_manager/commonComponents/DateTimePicker.dart';
import 'package:task_manager/tasks/TaskWidget.dart';
import 'package:task_manager/tasks/taskItem.dart';


class NewTask extends StatefulWidget {
  List<TaskWidget> taskList;
  NewTask({Key key, this.taskList}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState(this.taskList);
}

class _NewTaskState extends State<NewTask> {
  List<TaskWidget> taskList;


  

  String dateTime = DateTime.now().month.toString() +
      "/" +
      (DateTime.now().day + 1).toString() +
      "/" +
      DateTime.now().year.toString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();

  _NewTaskState(List<TaskWidget> taskList);

  void _addToDb(dateTime) async {
    String task = _taskController.text;
    var id = await DatabaseHelper.instance.insert(TaskItem(false, task, dateTime));

    setState(() {
      taskList.add(TaskWidget(isCompleted: false, task: task, dateTime: dateTime, id: id,));
    });


  }
  

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
                      return "Task cannot be left empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Task"),
                ),
              ),
              DateTimePicker(onDateTimeChanged: (newDateTime) {dateTime = newDateTime;}),
              Spacer(),
              Button(
                text: "Create Task",
                color: Colors.green,
                press: () async {
                  if (_formKey.currentState.validate()) {
                    // TODO: Create Task Here
                    _addToDb(dateTime);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Task has been added!")),
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

