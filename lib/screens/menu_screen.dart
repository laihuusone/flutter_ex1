import 'package:flutter/material.dart';
import 'home_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //
  int _currentIndex = 0;

  final tabs = [
    HomeScreen(),
    Center(child: Text('Bookmark')),
    Center(child: Text('History')),
    Center(child: Text('Message')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              child: tabs[_currentIndex],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0, 7), blurRadius: 10, color: Colors.black54)
              ]),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(size: 30),
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border), label: 'Bookmark'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark_border), label: 'History'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.email_outlined), label: 'Message'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: 'Settings')
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            )));
  }
}
