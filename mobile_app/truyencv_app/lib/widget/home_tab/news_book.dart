// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:truyencv_app/model/book.dart';

import '../../urls/urls_api.dart';
import '../../pages/book_details.dart';

class NewsBook extends StatefulWidget {
  const NewsBook({Key? key}) : super(key: key);

  @override
  State<NewsBook> createState() => _NewsBookState();
}

final _base = ApiUrls().baseUrl;
Future<List<Book>> fetchLatestNovel() async {
  final response =
      await http.get(Uri.parse('$_base/tcv/public/api/v1/latest_novel'));
  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer['data'];
    return jsonResponse.map((data) => Book.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _NewsBookState extends State<NewsBook> {
  late Future<List<Book>> futureLatestNovel;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    futureLatestNovel = fetchLatestNovel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder<List<Book>>(
        future: futureLatestNovel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < snapshot.data!.length; i++)
                        GestureDetector(
                          onTap: () => setState(() => _index = i),
                          child: Container(
                            height: 72,
                            width: 54,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: Image.network(
                                '$_base/tcv/public/uploads/truyen/' +
                                    snapshot.data![i].hinhanh!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                buildShowBook(size, snapshot, context),
              ],
            );
          }
          // By default show a loading spinner.
          return Container(
            width: size.width - 20,
            height: (size.width - 20) * 0.75,
            color: Colors.grey.shade100,
          );
        },
      ),
    );
  }

  Container buildShowBook(
      Size size, AsyncSnapshot<List<Book>> snapshot, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (size.width - 20) * 0.55,
            height: ((size.width - 20) * 0.4) * 1.3333,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (snapshot.data![_index].tentruyen).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeLeft: true,
                      removeBottom: true,
                      child: Html(
                        data: (snapshot.data![_index].mota).toString(),
                        style: {
                          "body": Style(
                            fontSize: FontSize(14.0),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Myfont',
                            color: Colors.black45,
                            maxLines: 2,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        },
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: RatingBarIndicator(
                          rating: (snapshot.data![_index].sosao)!.toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetails(
                                  truyenId: snapshot.data![_index].id,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Đọc',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Myfont',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(
                    truyenId: snapshot.data![_index].id,
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: (size.width - 20) * 0.4,
              height: ((size.width - 20) * 0.4) * 1.3333,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  '$_base/tcv/public/uploads/truyen/' +
                      (snapshot.data![_index].hinhanh).toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
