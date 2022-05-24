// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_null_comparison, unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/pages/home.dart';
import 'package:truyencv_app/provider/google_sign_in.dart';
import 'package:truyencv_app/util/loading.dart';
import 'package:truyencv_app/widget/profile_tab/lgged/edit_profile.dart';
import 'package:truyencv_app/widget/profile_tab/question_page.dart';

import '../../../urls/urls_api.dart';
import '../../../model/account.dart';
import '../profile_item.dart';
import 'change_pass.dart';

class ProfileLogged extends StatefulWidget {
  const ProfileLogged({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<ProfileLogged> createState() => _ProfileLoggedState();
}

final _base = ApiUrls().baseUrl;

class _ProfileLoggedState extends State<ProfileLogged> {
  late Future<Account> _futureProfile;
  Future<Account> fetchProfile() async {
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
      throw Exception('Failed to load Profile');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _futureProfile = fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Account>(
        future: _futureProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          snapshot.data!.avatar != null
                              ? '$_base/tcv/public/uploads/cus_avt/' +
                                  snapshot.data!.avatar!
                              : '$_base/tcv/public/dist/img/avatar2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      (snapshot.data!.username!).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Myfont',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      snapshot.data!.joindate != null
                          ? 'Tham gia vào ' +
                              (snapshot.data!.joindate!).toString()
                          : '',
                      style: const TextStyle(
                        color: Colors.black38,
                        fontFamily: 'Myfont',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Html(
                      data: snapshot.data!.introduce != null
                          ? (snapshot.data!.introduce!).toString()
                          : '',
                      style: {
                        "body": Style(
                          fontSize: const FontSize(16.0),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Myfont',
                          color: Colors.black45,
                          textAlign: TextAlign.center,
                        ),
                      },
                    ),
                    ProfileItem(
                      press: () async {
                        final value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()),
                        );
                        setState(() {
                          _futureProfile = fetchProfile();
                        });
                      },
                      text: "Sửa hồ sơ",
                    ),
                    ProfileItem(
                      press: () {},
                      text: "Cài đặt",
                    ),
                    ProfileItem(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePass(),
                          ),
                        );
                      },
                      text: "Đổi mật khẩu",
                    ),
                    ProfileItem(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionPage()),
                        );
                      },
                      text: "Câu hỏi thường gặp",
                    ),
                    ProfileItem(
                      press: () {},
                      text: "Liên hệ, báo lỗi",
                    ),
                    ProfileItem(
                      press: () {
                        showInfomation(context);
                      },
                      text: "Thoát",
                    ),
                  ],
                ),
              );
            }
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: widget.size.height - 135,
                width: widget.size.width,
                child: const Center(child: Loading()),
              ),
            ],
          );
        },
      ),
    );
  }

  void showInfomation(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.warning_amber,
                        color: Colors.orangeAccent,
                        size: 35,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Thông báo!",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Bạn có muốn đăng xuất không?",
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
                        onTap: () async {
                          Navigator.pop(_);
                          logout();
                          await GoogleSignInApi.logout();
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
                      const SizedBox(width: 30),
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

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }
}
