import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:oshpazuz/Screens/HomePage.dart';
import 'package:oshpazuz/Screens/AccountPage.dart';
import 'package:oshpazuz/Screens/SavedPage.dart';
import 'package:oshpazuz/Screens/SettingsPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

List<Widget> CurrentWindow = [
  HomePage(),
  AccountPage(),
  SavedPage(),
  SettingsPage()
];

class _MainPageState extends State<MainPage> {
  @override
  int currentNavigation = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body: CurrentWindow[currentNavigation],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0, left: 12, right: 12),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Color(0xFFEFEFEF)),
              child: BottomNavigationBar(
                selectedItemColor: Color(0xFF43AEA4),
                unselectedItemColor: Color(0xFFADACAC),
                currentIndex: currentNavigation,
                onTap: (index) {
                  setState(() {
                    currentNavigation = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Account'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark), label: 'Saved'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            ),
          ),
        ));
  }
}
