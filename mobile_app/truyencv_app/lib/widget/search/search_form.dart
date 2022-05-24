// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_null_comparison, avoid_init_to_null, prefer_typing_uninitialized_variables, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:truyencv_app/util/loading.dart';

import '../../model/book.dart';
import '../../pages/book_details.dart';
import 'package:http/http.dart' as http;

import '../../urls/urls_api.dart';
import '../category.dart';

final _base = ApiUrls().baseUrl;
Future<List<Book>> fetchSearchBook(searchData) async {
  final response = await http.get(
      Uri.parse('$_base/tcv/public/api/v1/search_book?tukhoa=$searchData'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Book.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  late Future<List<Book>> futureSearchBook;
  final textController = TextEditingController();

  var _value = '';
  @override
  void initState() {
    super.initState();
    futureSearchBook = fetchSearchBook(_value);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.black54),
                  ),
                ),
                Container(
                  height: 50,
                  width: (size.width - 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: (size.width - 80) * 0.1,
                        child: const Icon(
                          Icons.search,
                          color: Colors.black26,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 80) * 0.9,
                        child: TextFormField(
                          controller: textController,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Tìm truyện theo tên, tác giả...",
                          ),
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              futureSearchBook = fetchSearchBook(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: FutureBuilder<List<Book>>(
              future: futureSearchBook,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (_value == '') {
                    return SizedBox(
                      height: size.height - 100,
                      width: size.width,
                      child: Container(),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return SizedBox(
                      height: size.height - 100,
                      width: size.width,
                      child: const Center(
                        child: Text(
                          "Sorry, this book doesn't exist...",
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: size.height - 100,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 20),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                return _searchItem(
                                    context, snapshot, index, size);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
                return SizedBox(
                  height: size.height - 100,
                  width: size.width,
                  child: const Center(
                    child: Loading(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _searchItem(BuildContext context, AsyncSnapshot<List<Book>> snapshot,
      int index, Size size) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(
              truyenId: snapshot.data![index].id,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 15),
        height: ((size.width - 40) / 5) * 4 / 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ((size.width - 40) / 5) * 4 / 3,
              width: (size.width - 40) / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  '$_base/tcv/public/uploads/truyen/' +
                      (snapshot.data![index].hinhanh).toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CategoryWidget(
                        cateId: snapshot.data![index].theloaiId,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: (size.width - 20) - ((size.width - 40) / 5) - 10,
                    child: Text(
                      (snapshot.data![index].tentruyen).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      (snapshot.data![index].tacgia).toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.black26,
                              size: 16,
                            ),
                            Text(
                              (snapshot.data![index].sosao)!
                                  .toInt()
                                  .toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.book,
                              color: Colors.black26,
                              size: 16,
                            ),
                            Text(
                              (snapshot.data![index].sochuong).toString(),
                              style: const TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
