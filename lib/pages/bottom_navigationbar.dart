// ignore_for_file: prefer_const_constructors_in_immutables, annotate_overrides

import 'package:flutter/material.dart';
import 'package:oshpazuz/pages/home_page.dart';
import 'package:oshpazuz/pages/account_page.dart';
import 'package:oshpazuz/pages/saved_recipes_page.dart';
import 'package:oshpazuz/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

final List<Widget> currentWindow = [
  HomePage(),
  AccountPage(),
  SavedPage(),
  SettingsPage()
];

class _MainPageState extends State<MainPage> {
  int currentNavigation = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentWindow[currentNavigation],
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
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
      ),
    );
  }
}
