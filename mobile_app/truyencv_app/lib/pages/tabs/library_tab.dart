// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/library_tab/setting_page.dart';
import '../../widget/library_tab/tab_1.dart';
import '../../widget/library_tab/tab_2.dart';
import '../../widget/profile_tab/un_logged/sign_in_page.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({Key? key}) : super(key: key);

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {
  int _selectPage = 0;
  late PageController _pageController;
  var userData;

  void _changePage(int pageNum) {
    setState(() {
      _selectPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    _getUserInfo();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tủ truyện",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: 50,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              ),
              child: const Icon(
                Icons.settings,
                color: Colors.grey,
                size: 24,
              ),
            ),
          )
        ],
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            if (userData != null)
              SizedBox(
                height: size.height - 131,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 40,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TabButton(
                            text: 'Lịch sử',
                            pageNumber: 0,
                            selectedPage: _selectPage,
                            press: () {
                              _changePage(0);
                            },
                          ),
                          TabButton(
                            text: 'Đánh dấu',
                            pageNumber: 1,
                            selectedPage: _selectPage,
                            press: () {
                              _changePage(1);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: PageView(
                          onPageChanged: (int page) {
                            setState(() {
                              _selectPage = page;
                            });
                          },
                          controller: _pageController,
                          children: const [
                            TabOne(),
                            TabTwo(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (userData == null)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  height: size.height - 131,
                  color: Colors.grey.shade50,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.width,
                          child: Lottie.asset('assets/json/devops.json'),
                        ),
                        const Text(
                          'Tap to continue ...',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Myfont',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.text,
    required this.selectedPage,
    required this.pageNumber,
    required this.press,
  }) : super(key: key);
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 0,
          left: 10,
          right: 10,
        ),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: selectedPage == pageNumber
                    ? Colors.black54
                    : Colors.transparent,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selectedPage == pageNumber ? Colors.black : Colors.black54,
              fontFamily: 'Myfont',
              fontSize: 16,
              fontWeight: selectedPage == pageNumber
                  ? FontWeight.w400
                  : FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
