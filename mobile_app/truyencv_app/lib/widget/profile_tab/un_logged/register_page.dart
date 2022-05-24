import 'dart:async';
import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../urls/urls_api.dart';
import '../../../pages/home.dart';
import 'header.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final _base = ApiUrls().baseUrl;

Future<http.Response> register(data) {
  return http.post(
    Uri.parse('$_base/tcv/public/api/v1/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
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
                                  validator: (value) => validateEmail(value),
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(Icons.mail,
                                          color: Colors.black54, size: 30),
                                    ),
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập mật khẩu';
                                    } else if (value.length < 8) {
                                      return 'Mật khẩu tối thiểu có 8 kí tự!';
                                    }
                                    return null;
                                  },
                                  cursorColor: Colors.black,
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
                                  controller: rePassController,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(Icons.lock,
                                          color: Colors.black54, size: 30),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        left: 15, top: 15, right: 15),
                                    hintText: "Nhập lại mật khẩu",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập lại mật khẩu!';
                                    } else if (passwordController.text !=
                                        rePassController.text) {
                                      return 'Xác nhận mật khẩu không chính xác!';
                                    }
                                    return null;
                                  },
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
                                  ),
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
                                  'Đăng ký',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Myfont',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
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

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': mailController.text,
      'password': passwordController.text,
    };

    var res = await register(data);
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
      showFlushbar('Email này đã được sử dụng!', Colors.red, Icons.error);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
