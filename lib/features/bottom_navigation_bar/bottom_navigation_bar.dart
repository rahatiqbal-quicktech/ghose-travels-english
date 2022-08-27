import 'package:flutter/material.dart';
import 'package:ghosh_travels/features/home/uber_home_screen.dart';
import 'package:ghosh_travels/features/profile/my_profile_screen.dart';
import 'package:ghosh_travels/features/purchase_history/activity_screen.dart';
import 'package:ghosh_travels/utils/app_config.dart';
// import 'package:ghosh_travels/features/home/uber_home_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List<Widget> screensList = <Widget>[
    UberHomeScreen(),
    ActivityScreen(),
    MyProfileScreen(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.grey.shade200,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
