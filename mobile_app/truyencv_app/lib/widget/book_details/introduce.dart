// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unrelated_type_equality_checks
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:truyencv_app/util/loading.dart';

import '../../model/book.dart';
import '../../urls/urls_api.dart';

final _base = ApiUrls().baseUrl;

Future<Book> fetchBook(id) async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/books/$id'),
  );
  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Introduce extends StatefulWidget {
  const Introduce({
    Key? key,
    this.truyenId,
  }) : super(key: key);
  final truyenId;

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  late Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    setState(() {
      futureBook = fetchBook(widget.truyenId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Book>(
          future: futureBook,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: size.width,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (snapshot.data!.sochuong).toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              (snapshot.data!.tinhtrang).toString() == '0'
                                  ? 'Chương - Đang ra'
                                  : 'Chương - Hoàn thành',
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (snapshot.data!.luotxem).toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              'Lượt đọc',
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Html(
                      data: snapshot.data!.mota,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16.0),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Myfont',
                          color: Colors.black,
                        ),
                      },
                    ),
                  ),
                  Container(height: 100, color: Colors.white)
                ],
              );
            }

            return const Scaffold(
              body: Center(
                child: Loading(),
              ),
            );
          },
        ),
      ),
    );
  }
}
