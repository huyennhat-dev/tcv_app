// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/widget/profile_tab/un_logged/forgot_password_page.dart';

import '../../../pages/test/test.dart';
import '../../../provider/google_sign_in.dart';
import '../../../urls/urls_api.dart';
import '../../../pages/home.dart';
import 'header.dart';
import 'register_page.dart';

import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final _base = ApiUrls().baseUrl;
Future<http.Response> login(data) {
  return http.post(
    Uri.parse('$_base/tcv/public/api/v1/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var msg;
  @override
  void initState() {
    super.initState();
  }

  bool _isLoading = false;
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Email không được để trống!';
    } else if (!regex.hasMatch(value)) {
      return 'Email không đúng định dạng!';
    } else {
      return null;
    }
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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: _isLoading
            ? Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/images/loading.gif'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                height: size.height - 30,
                child: Column(
                  children: [
                    HeaderPage(size: size),
                    SizedBox(
                      height: 150,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: size.width - 40,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: size.width - 40,
                                child: TextFormField(
                                  controller: mailController,
                                  cursorColor: Colors.black,
                                  validator: (value) => validateEmail(value),
                                  decoration: const InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(Icons.mail,
                                          color: Colors.black54, size: 30),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15, top: 15, right: 15),
                                    hintText: "Email",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width - 40,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: size.width - 40,
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  cursorColor: Colors.black,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập mật khẩu!';
                                    } else if (value.length < 8) {
                                      return 'Mật khẩu tối thiểu có 8 kí tự!';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(Icons.lock,
                                          color: Colors.black54, size: 30),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        left: 15, top: 15, right: 15),
                                    hintText: "Mật khẩu",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: size.width - 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _handleLogin();
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF1A5D97),
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
                                child: const Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Myfont',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: (size.width - 40) / 2 - 5,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ), //Background Color
                                      elevation: MaterialStateProperty.all(6),
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.black54),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/facebook.png",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (size.width - 40) / 2 - 5,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () => signIn(),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ), //Background Color
                                      elevation: MaterialStateProperty.all(6),
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.black54),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/google.png"),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: size.width - 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
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
                                child: const Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Myfont',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Gửi lại email kích hoạt",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Myfont',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Quên mật khẩu",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Myfont',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  void showFlushbar(String text, color, icon) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      message: text,
      messageSize: 17,
      icon: Icon(
        icon,
        size: 28.0,
        color: color,
      ),
      borderRadius: BorderRadius.circular(10.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      duration: const Duration(seconds: 5),
    ).show(context);
  }

  Future<http.Response> googleSignIn(data) {
    return http.post(
      Uri.parse('$_base/tcv/public/api/v1/google_sign_in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Faild"),
        ),
      );
    } else {
      var password = 'truyencv';
      var data = {
        'email': user.email,
        'username': user.displayName!,
        'imageUrl': user.photoUrl,
        'password': password
      };

      var res = await googleSignIn(data);
      var body = json.decode(res.body);
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const Home()),
          ModalRoute.withName('/'),
        );
        showFlushbar('Xin chào ' + body['user']['username'], Colors.green,
            Icons.check_circle);
        Timer(const Duration(hours: 2), () {
          localStorage.remove('user');
        });
      } else {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('user', json.encode(body['user']));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const Home()),
          ModalRoute.withName('/'),
        );

        showFlushbar('Mật khẩu của bạn là: ' + password, Colors.green,
            Icons.check_circle);
        Timer(const Duration(hours: 2), () {
          localStorage.remove('user');
        });
      }
    }
  }

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': mailController.text,
      'password': passwordController.text,
    };

    var res = await login(data);
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const Home()),
        ModalRoute.withName('/'),
      );
      showFlushbar('Xin chào ' + body['user']['username'], Colors.green,
          Icons.check_circle);
      Timer(const Duration(hours: 2), () {
        localStorage.remove('user');
      });
    } else {
      showFlushbar('Email hoặc mật khẩu không đúng!', Colors.red, Icons.error);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
