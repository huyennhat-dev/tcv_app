// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../urls/urls_api.dart';
import '../../model/chapter.dart';
import 'package:http/http.dart' as http;

import 'chapter_detail.dart';

class ListChapter extends StatefulWidget {
  const ListChapter({Key? key, this.truyenId}) : super(key: key);
  final truyenId;

  @override
  State<ListChapter> createState() => _ListChapterState();
}

final _base = ApiUrls().baseUrl;
Future<List<Chapter>> fetchListChapter(truyenId, sortList) async {
  final response = await http.get(
      Uri.parse("$_base/tcv/public/api/v1/list_chapter/$truyenId/$sortList"));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Chapter.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _ListChapterState extends State<ListChapter> {
  late Future<List<Chapter>> futureListChapter;
  var sortList = 'ASC';

  @override
  void initState() {
    super.initState();
    futureListChapter = fetchListChapter(widget.truyenId, sortList);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách chương",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<Chapter>>(
        future: futureListChapter,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: size.width,
              height: size.height - 50,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                              '(' + snapshot.data!.length.toString() + ')',
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
                              futureListChapter =
                                  fetchListChapter(widget.truyenId, sortList);
                            });
                          },
                          child: Icon(
                            Icons.sort_sharp,
                            color: sortList == 'ASC'
                                ? Colors.black45
                                : Colors.black,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height - 118,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            var slug = int.parse(
                                snapshot.data![index].slug.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailChapter(
                                  chapterSlug: slug,
                                  truyenId: snapshot.data![index].truyenId,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: size.width - 60,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Text(
                              (snapshot.data![index].slug!).toString() +
                                  "  Chương " +
                                  (snapshot.data![index].slug!).toString() +
                                  ":  " +
                                  (snapshot.data![index].tenchuong).toString(),
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
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          // By default show a loading spinner.
          return SizedBox(
            height: size.height - 50,
            width: size.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
