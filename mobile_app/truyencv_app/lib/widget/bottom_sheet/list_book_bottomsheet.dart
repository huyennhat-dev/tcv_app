// ignore_for_file: prefer_const_constructors, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:truyencv_app/model/category.dart';
import 'package:http/http.dart' as http;
import 'package:truyencv_app/model/personality.dart';
import 'package:truyencv_app/model/sect.dart';
import 'package:truyencv_app/model/world_scene.dart';

import '../../urls/urls_api.dart';

class ListBookBottomSheet extends StatefulWidget {
  const ListBookBottomSheet({Key? key}) : super(key: key);

  @override
  State<ListBookBottomSheet> createState() => _ListBookBottomSheetState();
}

final _base = ApiUrls().baseUrl;

Future<List<Category>> fetchCategory() async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/load_category'),
  );

  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer;
    return jsonResponse.map((data) => Category.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Profile');
  }
}

Future<List<WorldScene>> fetchWorldScene() async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/load_worldScene'),
  );

  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer;
    return jsonResponse.map((data) => WorldScene.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Profile');
  }
}

Future<List<Personality>> fetchPersonality() async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/load_personality'),
  );

  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer;
    return jsonResponse.map((data) => Personality.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Profile');
  }
}

Future<List<Sect>> fetchSect() async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/load_current'),
  );

  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer;
    return jsonResponse.map((data) => Sect.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Profile');
  }
}

class _ListBookBottomSheetState extends State<ListBookBottomSheet> {
  late Future<List<Category>> _futureCategory;
  late Future<List<Sect>> _futureSect;
  late Future<List<WorldScene>> _futureWorldScene;
  late Future<List<Personality>> _futurePersonality;

  String sortNewBookUrl = 'thoigiancapnhat';
  String sortStatusUrl = 'tat-ca';
  String sortCategoryUrl = 'canh-ky';
  String sortCurrentUrl = 'ban-tho';
  String sortPersonalityUrl = 'co-tri';
  String sortWorldSceneUrl = 'cao-vo-the-gioi';

  @override
  void initState() {
    super.initState();
    _futureCategory = fetchCategory();
    _futureSect = fetchSect();
    _futureWorldScene = fetchWorldScene();
    _futurePersonality = fetchPersonality();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 40, bottom: 50, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sắp xếp",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          buildItemSort(
                            'Mới nhất',
                            'thoigiancapnhat',
                          ),
                          buildItemSort(
                            'Mới đăng',
                            'ngaydang',
                          ),
                          buildItemSort(
                            'Đánh giá',
                            'sodanhgia',
                          ),
                          buildItemSort(
                            'Lượt đọc',
                            'luotxem',
                          ),
                          buildItemSort(
                            'Đề cử',
                            'luotdecu',
                          ),
                          buildItemSort(
                            'Bình luận',
                            'sobinhluan',
                          ),
                          buildItemSort(
                            'Số chương',
                            'sochuong',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tình trạng",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          buildItemStatus(
                            'Tất cả',
                            'tat-ca',
                          ),
                          buildItemStatus(
                            'Hoàn thành',
                            'hoan-thanh',
                          ),
                          buildItemStatus(
                            'Đang ra',
                            'dang-ra',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Thể loại",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      FutureBuilder<List<Category>>(
                        future: _futureCategory,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.length;
                                      i++)
                                    buildItemCategory(
                                      (snapshot.data![i].tentheloai).toString(),
                                      (snapshot.data![i].slug).toString(),
                                    ),
                                ],
                              );
                            }
                          }

                          return Center(
                              child: const CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tính cách nhân vật chính",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      FutureBuilder<List<Personality>>(
                        future: _futurePersonality,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.length;
                                      i++)
                                    buildItemPersonality(
                                      (snapshot.data![i].tentinhcach)
                                          .toString(),
                                      (snapshot.data![i].slug).toString(),
                                    ),
                                ],
                              );
                            }
                          }

                          return Center(
                              child: const CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bối cảnh thế giới",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      FutureBuilder<List<WorldScene>>(
                        future: _futureWorldScene,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.length;
                                      i++)
                                    buildItemWorldScene(
                                      (snapshot.data![i].tenthegioi).toString(),
                                      (snapshot.data![i].slug).toString(),
                                    ),
                                ],
                              );
                            }
                          }

                          return Center(
                              child: const CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lưu phái",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      FutureBuilder<List<Sect>>(
                        future: _futureSect,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.length;
                                      i++)
                                    buildItemCurrent(
                                      (snapshot.data![i].tenluuphai).toString(),
                                      (snapshot.data![i].slug).toString(),
                                    ),
                                ],
                              );
                            }
                          }

                          return Center(
                              child: const CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: size.width / 1.5,
        height: 40,
        padding:
            const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        margin: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Gửi",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Myfont',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildItemSort(text, url) {
    return InkWell(
      onTap: () {
        setState(() {
          sortNewBookUrl = url;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color: url == sortNewBookUrl ? Color(0xFF1F5492) : Colors.black45,
            decoration: url == sortNewBookUrl
                ? TextDecoration.underline
                : TextDecoration.none,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget buildItemStatus(text, url) {
    return InkWell(
      onTap: () {
        setState(() {
          sortStatusUrl = url;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color: url == sortStatusUrl ? Color(0xFF1F5492) : Colors.black45,
            decoration: url == sortStatusUrl
                ? TextDecoration.underline
                : TextDecoration.none,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget buildItemCategory(text, url) {
    return InkWell(
      onTap: () {
        setState(() {
          sortCategoryUrl = url;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color: url == sortCategoryUrl ? Color(0xFF1F5492) : Colors.black45,
            decoration: url == sortCategoryUrl
                ? TextDecoration.underline
                : TextDecoration.none,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget buildItemPersonality(text, url) {
    return InkWell(
      onTap: () {
        setState(() {
          sortPersonalityUrl = url;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color:
                url == sortPersonalityUrl ? Color(0xFF1F5492) : Colors.black45,
            decoration: url == sortPersonalityUrl
                ? TextDecoration.underline
                : TextDecoration.none,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget buildItemWorldScene(text, url) {
    return InkWell(
      onTap: () {
        setState(() {
          sortWorldSceneUrl = url;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color:
                url == sortWorldSceneUrl ? Color(0xFF1F5492) : Colors.black45,
            decoration: url == sortWorldSceneUrl
                ? TextDecoration.underline
                : TextDecoration.none,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget buildItemCurrent(text, url) {
    return InkWell(
      onTap: () {
        setState(() {
          sortCurrentUrl = url;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color: url == sortCurrentUrl ? Color(0xFF1F5492) : Colors.black45,
            decoration: url == sortCurrentUrl
                ? TextDecoration.underline
                : TextDecoration.none,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
