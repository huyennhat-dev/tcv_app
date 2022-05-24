import 'dart:convert';

import 'package:flutter/material.dart';

import '../../urls/urls_api.dart';
import 'package:http/http.dart' as http;

import '../../model/book.dart';
import '../../pages/book_details.dart';

class NominationHomeTab extends StatefulWidget {
  const NominationHomeTab({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<NominationHomeTab> createState() => _NominationHomeTabState();
}

final _base = ApiUrls().baseUrl;
Future<List<Book>> fetchNominations() async {
  final response =
      await http.get(Uri.parse('$_base/tcv/public/api/v1/nominations'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Book.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _NominationHomeTabState extends State<NominationHomeTab> {
  late Future<List<Book>> futureNominations;

  @override
  void initState() {
    super.initState();
    futureNominations = fetchNominations();
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (widget.size.width - 40) / 3;
    final double itemHeight = itemWidth * 2;
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: ((widget.size.width - 40) / 3) * 4.2,
      child: FutureBuilder<List<Book>>(
        future: futureNominations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: (itemWidth / itemHeight),
                controller: ScrollController(keepScrollOffset: false),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    GestureDetector(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (widget.size.width - 40) / 3,
                            height: ((widget.size.width - 40) / 3) * 1.33,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                '$_base/tcv/public/uploads/truyen/' +
                                    (snapshot.data![i].hinhanh).toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            (snapshot.data![i].tentruyen).toString(),
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 2,
                          ),
                          const Text(
                            "Huyền Huyễn",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          }
          // By default show a loading spinner.
          return Container(
            width: size.width - 20,
            height: (size.width - 20) * 1.2,
            color: Colors.grey.shade100,
          );
        },
      ),
    );
  }
}
