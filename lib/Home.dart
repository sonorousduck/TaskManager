import 'package:flutter/material.dart';
import 'package:task_manager/BottomNavBarFragments/HomePageFragment.dart';
import 'package:task_manager/BottomNavBarFragments/ScheduleFragment.dart';
import 'package:task_manager/BottomNavBarFragments/SettingsFragment.dart';
import 'package:task_manager/BottomNavBarFragments/TasksFragment.dart';
import 'package:task_manager/schedule/NewScheduleItem.dart';
import 'package:task_manager/tasks/newTask.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: "Todo's App",
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;
  bool shouldShow = false;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePageFragment(),
    ScheduleFragment(),
    TasksFragment(),
    SettingsFragment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 3 || index == 0) {
        shouldShow = false;
      } else {
        shouldShow = true;
      }

      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Todo's App"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Schedule",
            backgroundColor: Colors.purple

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "Tasks",
            backgroundColor: Colors.cyan

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            backgroundColor: Colors.red,

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        // showUnselectedLabels: true,
        onTap: _onItemTapped,
        elevation: 10.0,
      ),

      floatingActionButton: Visibility(
        visible: shouldShow,

        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // If on Schedule Page
            if (_selectedIndex == 1) {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(35), bottom: Radius.circular(25))
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) => NewScheduleItem());
            }


            // If on Task Page
            if (_selectedIndex == 2) {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(35), bottom: Radius.circular(25))
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => NewTask());
            }


          },
          ),

    ),

    );
  }
}


