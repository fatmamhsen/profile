import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      title: 'Profile',
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final tabs = [
    Center(
      child: Text('phone'),
    ),
    Center(
      child: Text('Home'),
    ),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        //    backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone_android,
              color: _currentIndex == 0 ? Colors.redAccent : Colors.grey,
            ),
            title: Text('Phone',
              style: TextStyle(
                color: _currentIndex == 0 ? Colors.redAccent : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 1 ? Colors.redAccent : Colors.grey,
            ),
            title: Text('Home',
              style: TextStyle(
                color: _currentIndex == 1 ? Colors.redAccent : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 2 ? Colors.redAccent : Colors.grey,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: _currentIndex == 2 ? Colors.redAccent : Colors.grey,
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
