// ignore_for_file: prefer_typing_uninitialized_variables, unrelated_type_equality_checks, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/pages/home.dart';
import 'package:truyencv_app/util/loading.dart';
import 'package:truyencv_app/widget/chapter_detail/bottom_sheet.dart';

import '../../urls/urls_api.dart';
import '../../model/chapter.dart';
import 'package:http/http.dart' as http;

class DetailChapter extends StatefulWidget {
  const DetailChapter({
    Key? key,
    this.truyenId,
    this.chapterSlug,
    this.countChapter,
  }) : super(key: key);
  final truyenId;
  final chapterSlug;
  final countChapter;

  @override
  State<DetailChapter> createState() => _DetailChapterState();
}

final _base = ApiUrls().baseUrl;

class _DetailChapterState extends State<DetailChapter> {
  var slug = 1;
  var userJson;
  var user;
  var cusId;
  Size get size => MediaQuery.of(context).size;

  ScrollController _scrollController = ScrollController();

  late Future<Chapter> futureChapter;

  Future<Chapter> fetchChapter(slug) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    userJson = localStorage.getString('user');
    if (userJson != null) {
      user = json.decode(userJson!);
    }
    if (user != null) {
      cusId = user['id'].toString();
    } else {
      cusId = '-1';
    }
    var truyenId = widget.truyenId.toString();

    final response = await http.get(
        Uri.parse('$_base/tcv/public/api/v1/books/$cusId/$truyenId/$slug'));
    if (response.statusCode == 200) {
      return Chapter.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load chap');
    }
  }

  void _changeSlug(_slug) {
    setState(() {
      slug = _slug;
      futureChapter = fetchChapter(slug);
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.chapterSlug != null) {
      slug = widget.chapterSlug;
    }
    futureChapter = fetchChapter(slug);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Chapter>(
      future: futureChapter,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                const SizedBox(height: 30),
                HeaderDetailChapterPage(
                  size: size,
                  title: snapshot.data!.tenchuong!,
                  slug: snapshot.data!.slug!,
                ),
                Container(
                  color: Colors.black,
                  height: size.height - 100,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetChapter(
                                truyenId: widget.truyenId,
                              );
                            },
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Html(
                              data: snapshot.data!.noidung!,
                              style: {
                                "body": Style(
                                  fontSize: const FontSize(18.0),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Myfont',
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 100)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: SizedBox(
                        width: size.width / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (slug > 1) {
                                  _changeSlug(slug - 1);
                                  _scrollDown();
                                }
                              },
                              child: const Icon(
                                Icons.arrow_circle_left_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Home()),
                                  ModalRoute.withName('/'),
                                );
                              },
                              child: const Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (slug == widget.countChapter) {
                                  _changeSlug(slug);
                                } else {
                                  _changeSlug(slug + 1);
                                }
                                _scrollDown();
                              },
                              child: const Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: Loading(),
          ),
        );
      },
    );
  }
}

class HeaderDetailChapterPage extends StatelessWidget {
  const HeaderDetailChapterPage({
    Key? key,
    required this.size,
    this.title,
    this.slug,
  }) : super(key: key);

  final Size size;
  final title;
  final slug;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: (size.width - 20) * 0.9,
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 14,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: ((size.width - 20) * 0.9) * 0.9,
                    child: Text(
                      'Chương ' + slug + ': ' + title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: (size.width - 20) * 0.1,
              child: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
