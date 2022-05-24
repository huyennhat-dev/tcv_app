import 'dart:convert';

import 'package:flutter/material.dart';

import '../../urls/urls_api.dart';
import '../../model/book.dart';
import '../../pages/book_details.dart';
import 'package:http/http.dart' as http;

class JustFinished extends StatefulWidget {
  const JustFinished({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<JustFinished> createState() => _JustFinishedState();
}

final _base = ApiUrls().baseUrl;
Future<List<Book>> fetchJustFinished() async {
  final response =
      await http.get(Uri.parse('$_base/tcv/public/api/v1/just_finished'));
  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer['data'];
    return jsonResponse.map((data) => Book.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _JustFinishedState extends State<JustFinished> {
  late Future<List<Book>> futureJustFinished;

  @override
  void initState() {
    super.initState();
    futureJustFinished = fetchJustFinished();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (((widget.size.width - 20) / 4) * 1.2 * 3) + 20,
      child: FutureBuilder<List<Book>>(
        future: futureJustFinished,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: ((((widget.size.width - 20) / 4) * 1.2) /
                  (widget.size.width - 20)),
              scrollDirection: Axis.horizontal,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: ((widget.size.width - 20) / 4) - 10,
                          height: ((widget.size.width - 20) / 4) * 1.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              '$_base/tcv/public/uploads/truyen/' +
                                  (snapshot.data![i].hinhanh).toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: (widget.size.width - 20) -
                              (((widget.size.width - 20) / 4) - 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                (snapshot.data![i].tentruyen).toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Myfont',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                              const Text(
                                "Huyền Huyễn",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: 'Myfont',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    (snapshot.data![i].luotxem).toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Myfont',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Lượt đọc",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Myfont',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              )
                            ],
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
            width: widget.size.width - 20,
            height: (widget.size.width - 20) * 0.65,
            color: Colors.grey.shade100,
          );
        },
      ),
    );
  }
}
