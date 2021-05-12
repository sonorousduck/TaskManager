import 'package:flutter/material.dart';
import 'package:task_manager/buttons/genericButton.dart';


class SettingsFragment extends StatelessWidget {
  const SettingsFragment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is the Settings Fragment"),


      bottomNavigationBar: Button(text: "Sign Out", press: () {}, color: Colors.greenAccent,)


    );
  }
}

