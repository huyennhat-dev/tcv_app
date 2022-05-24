// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/model/rating.dart';
import 'package:http/http.dart' as http;
import 'package:truyencv_app/widget/profile_tab/un_logged/sign_in_page.dart';

import '../../urls/urls_api.dart';
import '../../model/account.dart';

final _base = ApiUrls().baseUrl;

Future<Rating> createRating(truyenId, image, name, rate, cusId, content) async {
  final response = await http.post(
    Uri.parse('$_base/tcv/public/api/v1/post_rating'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'truyenId': truyenId,
      'image': image,
      'name': name,
      'rate': rate,
      'cusId': cusId,
      'content': content
    }),
  );

  if (response.statusCode == 200) {
    return Rating.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key, this.truyenId}) : super(key: key);
  final truyenId;

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  late Future<Account> _futureAccount;

  final TextEditingController contentController = TextEditingController();
  var rate;
  var user;

  Future<Account> fetchAccount() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    var cusId = user['id'];
    final response = await http.get(
      Uri.parse('$_base/tcv/public/api/v1/show_account/$cusId'),
    );

    if (response.statusCode == 200) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Account');
    }
  }

  @override
  void initState() {
    super.initState();

    _futureAccount = fetchAccount();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Viết đánh giá",
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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: ((size.width) - 60) / 2,
                        child: const Text(
                          "Đánh giá truyện",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Myfont',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 26,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          rate = rating;
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: ((size.width) - 40) / 2,
                    child: const Text(
                      "Viết nội dung đánh giá",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.height / 3,
                    child: TextField(
                      controller: contentController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Viết đánh giá...",
                      ),
                    ),
                  ),
                  FutureBuilder<Account>(
                    future: _futureAccount,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  createRating(
                                    widget.truyenId,
                                    snapshot.data!.avatar,
                                    snapshot.data!.username,
                                    (rate.toInt() + 0.001).toDouble(),
                                    snapshot.data!.id,
                                    contentController.text,
                                  );
                                  Future.delayed(
                                      const Duration(milliseconds: 250), () {
                                    Navigator.pop(context, true);
                                  });
                                });
                              },
                              child: const Text(
                                "Đăng",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Myfont',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ), //Background Color
                                elevation: MaterialStateProperty.all(6),
                                shadowColor:
                                    MaterialStateProperty.all(Colors.black54),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Đăng",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Myfont',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ), //Background Color
                                elevation: MaterialStateProperty.all(6),
                                shadowColor:
                                    MaterialStateProperty.all(Colors.black54),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }

                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
