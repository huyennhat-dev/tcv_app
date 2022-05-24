// ignore_for_file: must_be_immutable, avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/util/loading.dart';

import '../../urls/urls_api.dart';
import '../../model/library.dart';
import '../../pages/book_details.dart';
import 'lib_item.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({Key? key}) : super(key: key);

  @override
  State<TabTwo> createState() => _TabTwoState();
}

final _base = ApiUrls().baseUrl;

class _TabTwoState extends State<TabTwo> {
  final _baseUrl = '$_base/tcv/public/api/v1/library/tickbook';
  var userData;
  var cusId;
  bool status = false;
  late ScrollController _controller;

  int _page = 1;

  bool _hasNextPage = true;

  bool _isFirstLoadRunning = false;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var userJson = localStorage.getString('user');
      var user = json.decode(userJson!);
      cusId = user['id'].toString();
      final res = await http.get(Uri.parse("$_baseUrl/$cusId?page=$_page"));
      setState(() {
        final String jsonBody = res.body;
        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);

        final List libraryList = useListContainer['data'];
        _posts = libraryList
            .map((contactRaw) => Library.fromJson(contactRaw))
            .toList();
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
      _page += 1; // Increase _page by 1
      try {
        final res = await http.get(Uri.parse("$_baseUrl/$cusId?page=$_page"));

        final String jsonBody = res.body;

        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List libraryList = useListContainer['data'];
        final List fetchedPosts = libraryList
            .map((contactRaw) => Library.fromJson(contactRaw))
            .toList();
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

  void _postBookDetail(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetails(
          librarysheet: _posts[index],
          truyenId: _posts[index].truyenId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isFirstLoadRunning
          ? const Center(
              child: Loading(),
            )
          : Column(
              children: [
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        controller: _controller,
                        itemCount: _posts.length,
                        itemBuilder: (_, index) => itemLib(index)),
                  ),
                ),

                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Center(
                      child: Loading(),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget itemLib(index) {
    return LibItem(
      press: () {
        _postBookDetail(index);
      },
      library: _posts[index],
      ellipsisVerticalClick: () => showModalBottomSheet(
        context: context,
        builder: (context) => bottomSheet(context, index),
      ),
    );
  }

  Future<Library> deleteBook(String id, String uId) async {
    final response = await http.get(
      Uri.parse('$_base/tcv/public/api/v1/delete_tickbook/$id/$uId'),
    );
    if (response.statusCode == 200) {
      return Library.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Profile');
    }
  }

  Widget bottomSheet(BuildContext context, index) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: size.height / 2.5,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: (size.width - 40) / 5.5,
                  height: ((size.width - 40) / 5.5) * 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: '$_base/tcv/public/uploads/truyen/' +
                          _posts[index]!.hinhanh!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: (size.width - 40) - ((size.width - 40) / 5.5),
                  child: Text(
                    _posts[index]!.tentruyen!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Myfont',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.cloud_download_outlined,
                    color: Colors.black45,
                    size: 26,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Tải truyện",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Myfont',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              showInfomation(context, index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.delete_outline,
                    color: Colors.black45,
                    size: 26,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Xóa khỏi tủ truyện",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Myfont',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.notifications_off,
                      color: Colors.black45,
                      size: 26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Nhận thông báo",
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Myfont',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                FlutterSwitch(
                  width: 40.0,
                  height: 20.0,
                  valueFontSize: 10.0,
                  toggleSize: 16.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 1.5,
                  showOnOff: false,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showInfomation(BuildContext context, index) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 160,
            width: (MediaQuery.of(context).size.width - 40) * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Truyện Convert thông báo!",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Myfont',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Text(
                    "Bạn muốn xóa truyện này khỏi tủ truyện ?",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Myfont',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(_);

                          setState(() {
                            deleteBook(
                              (_posts[index]!.id).toString(),
                              (_posts[index]!.uId).toString(),
                            );
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              _firstLoad();
                            });
                          });
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Myfont',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(_);
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Myfont',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
