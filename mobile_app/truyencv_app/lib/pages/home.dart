// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyencv_app/pages/tabs/library_tab.dart';
import 'package:truyencv_app/pages/tabs/notify_tab.dart';

import 'tabs/home_tab.dart';
import 'tabs/profile_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomeTab(),
    const LibraryTab(),
    const NotifyTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: _currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(CupertinoIcons.house_fill),
                icon: Icon(CupertinoIcons.house),
                label: 'Trang chủ',
              ),
              NavigationDestination(
                selectedIcon: Icon(CupertinoIcons.square_favorites_alt_fill),
                icon: Icon(CupertinoIcons.square_favorites_alt),
                label: 'Tủ truyện',
              ),
              NavigationDestination(
                selectedIcon: Icon(CupertinoIcons.bell_fill),
                icon: Icon(CupertinoIcons.bell),
                label: 'Thông báo',
              ),
              NavigationDestination(
                selectedIcon: Icon(CupertinoIcons.person_fill),
                icon: Icon(CupertinoIcons.person),
                label: 'Cá nhân',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
