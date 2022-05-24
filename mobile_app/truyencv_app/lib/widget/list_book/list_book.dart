// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:truyencv_app/util/loading.dart';

import '../../model/book.dart';
import '../../pages/book_details.dart';
import '../../urls/urls_api.dart';
import '../bottom_sheet/list_book_bottomsheet.dart';
import '../category.dart';

final _base = ApiUrls().baseUrl;

class ListBook extends StatefulWidget {
  const ListBook({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  final _baseUrl = '$_base/tcv/public/api/v1/fetch_book';
  var url;
  bool status = false;
  late ScrollController _controller;

  int _page = 1;

  bool _hasNextPage = true;

  bool _isFirstLoadRunning = false;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _firstLoad() async {
    setState(() {});
    try {
      _isFirstLoadRunning = true;

      url = widget.url;

      final res = await http.get(Uri.parse("$_baseUrl/$url?page=$_page"));
      setState(() {
        final String jsonBody = res.body;
        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);

        final List libraryList = useListContainer['data'];
        _posts =
            libraryList.map((contactRaw) => Book.fromJson(contactRaw)).toList();
      });
    } catch (err) {
      print('Something went wrong 1');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1;
      try {
        final res = await http.get(Uri.parse("$_baseUrl/$url?page=$_page"));

        final String jsonBody = res.body;

        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List libraryList = useListContainer['data'];
        final List fetchedPosts =
            libraryList.map((contactRaw) => Book.fromJson(contactRaw)).toList();
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách truyện",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          SizedBox(
            width: 50,
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ListBookBottomSheet()),
              child: const Icon(
                Icons.tune,
                color: Colors.black54,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: Loading(),
            )
          : Container(
              height: size.height - 50,
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      padding: EdgeInsets.only(top: 10, bottom: 30),
                      itemCount: _posts.length,
                      itemBuilder: (_, index) {
                        return listItem(
                          size,
                          '$_base/tcv/public/uploads/truyen/' +
                              (_posts[index].hinhanh).toString(),
                          (_posts[index].tentruyen).toString(),
                          (_posts[index].tacgia).toString(),
                          _posts[index].sosao,
                          (_posts[index].sochuong).toString(),
                          _posts[index].id,
                          _posts[index].theloaiId,
                        );
                      },
                    ),
                  ),
                  if (_isLoadMoreRunning == true)
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Center(
                        child: Loading(),
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Widget listItem(
      Size size, image, name, author, rate, totalChap, truyenId, cateId) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(
              truyenId: truyenId,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
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
                  image,
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CategoryWidget(
                          cateId: cateId,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (size.width - 20) - ((size.width - 40) / 5) - 10,
                    child: Text(
                      name.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      author.toString(),
                      style: TextStyle(
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
                            Icon(
                              Icons.star,
                              color: Colors.black26,
                              size: 16,
                            ),
                            Text(
                              rate.toInt().toStringAsFixed(1),
                              style: TextStyle(
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
                            Icon(
                              Icons.book,
                              color: Colors.black26,
                              size: 16,
                            ),
                            Text(
                              totalChap.toString(),
                              style: TextStyle(
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
