// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../urls/urls_api.dart';
import '../../model/chapter.dart';
import '../chapter_detail/chapter_detail.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({Key? key, required this.truyenId}) : super(key: key);
  final truyenId;
  @override
  State<ChapterList> createState() => _ChapterListState();
}

final _base = ApiUrls().baseUrl;

class _ChapterListState extends State<ChapterList> {
  List _posts = [];
  var sortList = 'ASC';

  void _loadListChapter() async {
    try {
      var truyenId = widget.truyenId;
      final res = await http.get(Uri.parse(
          "$_base/tcv/public/api/v1/list_chapter/$truyenId/$sortList"));
      setState(() {
        final String jsonBody = res.body;
        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);

        final List libraryList = useListContainer;
        _posts = libraryList
            .map((contactRaw) => Chapter.fromJson(contactRaw))
            .toList();
      });
    } catch (err) {
      print('Something went wrong 1');
    }
  }

  @override
  void initState() {
    _loadListChapter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height - 331,
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Số chương",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(' + _posts.length.toString() + ')',
                            style: const TextStyle(
                              color: Colors.black45,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sortList == 'ASC'
                                ? sortList = 'DESC'
                                : sortList = 'ASC';
                            _loadListChapter();
                          });
                        },
                        child: Icon(
                          Icons.sort_sharp,
                          color:
                              sortList == 'ASC' ? Colors.black45 : Colors.black,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < _posts.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ChapterItem(
                      size: size,
                      listChap: _posts[i],
                      press: () {
                        var slug = int.parse(_posts[i].slug.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailChapter(
                              chapterSlug: slug,
                              truyenId: _posts[i].truyenId,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ChapterItem extends StatelessWidget {
  ChapterItem({
    Key? key,
    required this.size,
    required this.press,
    this.listChap,
  }) : super(key: key);

  Chapter? listChap;

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
        width: size.width - 60,
        margin: const EdgeInsets.only(bottom: 15),
        child: Text(
          (listChap?.slug).toString() +
              "  Chương " +
              (listChap?.slug).toString() +
              ":  " +
              (listChap?.tenchuong).toString(),
          style: const TextStyle(
            color: Colors.black87,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w300,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
