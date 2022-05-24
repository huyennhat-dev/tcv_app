import 'dart:convert';

import 'package:flutter/material.dart';

import '../../urls/urls_api.dart';
import 'package:http/http.dart' as http;

import '../../model/book.dart';
import '../../pages/book_details.dart';

class JustPosted extends StatefulWidget {
  const JustPosted({Key? key}) : super(key: key);

  @override
  State<JustPosted> createState() => _JustPostedState();
}

final _base = ApiUrls().baseUrl;
Future<List<Book>> fetchJustPosted() async {
  final response =
      await http.get(Uri.parse('$_base/tcv/public/api/v1/just_posted'));
  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer['data'];
    return jsonResponse.map((data) => Book.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _JustPostedState extends State<JustPosted> {
  late Future<List<Book>> futureJustPosted;

  @override
  void initState() {
    super.initState();
    futureJustPosted = fetchJustPosted();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<List<Book>>(
      future: futureJustPosted,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < snapshot.data!.length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetails(
                                truyenId: snapshot.data![i].id,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 140 + 50,
                          width: 115,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: 115,
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    '$_base/tcv/public/uploads/truyen/' +
                                        (snapshot.data![i].hinhanh).toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Text(
                                  (snapshot.data![i].tentruyen).toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Myfont',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          );
        }
        // By default show a loading spinner.
        return Container(
          width: size.width - 20,
          height: (size.width - 20) * 0.3,
          color: Colors.grey.shade100,
        );
      },
    );
  }
}
