// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyencv_app/widget/home_tab/just_finished.dart';

import '../../widget/home_tab/just_posted.dart';
import '../../widget/home_tab/news_book.dart';
import '../../widget/home_tab/nomination_home_tab.dart';
import '../../widget/home_tab/popular_home_tab.dart';
import '../../widget/home_tab/slide_home_tab.dart';
import '../../widget/list_book/list_book.dart';
import '../../widget/search/search_form.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  void pushListBook(url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListBook(url: url),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const titleTextStyle = TextStyle(
      color: Colors.black54,
      fontFamily: 'Myfont',
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );

    const titleIcon = Icon(
      Icons.arrow_forward_ios,
      color: Colors.black54,
      size: 16,
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo2.png"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 3,
              ),
              child: const Text(
                "Truyện Convert",
                style: TextStyle(
                  fontFamily: 'Myfont',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchForm(),
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
                size: 24,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: GestureDetector(
              onTap: () => pushListBook('fetch_all_book'),
              child: const Icon(
                Icons.filter_list_rounded,
                color: Colors.grey,
                size: 24,
              ),
            ),
          ),
        ],
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        height: size.height - 100,
        width: size.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 5),
            SlideHomeTab(size: size),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => pushListBook('new_book'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mới nhất",
                    style: titleTextStyle,
                  ),
                  Container(
                    child: titleIcon,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const NewsBook(),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => pushListBook('nomination'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Đề cử",
                    style: titleTextStyle,
                  ),
                  Container(
                    child: titleIcon,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            NominationHomeTab(size: size),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => pushListBook('popular'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Thịnh hành",
                    style: titleTextStyle,
                  ),
                  Container(
                    child: titleIcon,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            PopularHomeTab(size: size),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => pushListBook('just_posted'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mới đăng",
                    style: titleTextStyle,
                  ),
                  Container(
                    child: titleIcon,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const JustPosted(),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => pushListBook('just_finished'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mới hoàn thành",
                    style: titleTextStyle,
                  ),
                  Container(
                    child: titleIcon,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            JustFinished(size: size),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
