import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../urls/urls_api.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

final _base = ApiUrls().baseUrl;
Future<http.Response> changepass(data) {
  return http.put(
    Uri.parse('$_base/tcv/public/api/v1/changepass'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
}

class _ChangePassState extends State<ChangePass> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController reNewPassController = TextEditingController();

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
        title: const Text(
          "Đổi mật khẩu",
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
        child: _isLoading
            ? Container(
                height: size.height - 50,
                color: Colors.transparent,
                child: Center(
                  child: SizedBox(
                    height: 150,
                    child: Lottie.asset('assets/json/loader.json'),
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
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
                    Form(
                      key: _formKey,
                      child: Column(children: [
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
                                hintText: "Mật khẩu hiện tại",
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
                              controller: newPassController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập mật khẩu mới!';
                                } else if (value.length < 8) {
                                  return 'Mật khẩu tối thiểu có 8 kí tự!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(Icons.lock_outline,
                                      color: Colors.black54, size: 30),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15),
                                hintText: "Mật khẩu mới",
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
                              controller: reNewPassController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Không được để trống!';
                                } else if (value.length < 8) {
                                  return 'Tối thiểu có 8 kí tự!';
                                } else if (newPassController.text !=
                                    reNewPassController.text) {
                                  return 'Xác nhận mật khẩu mới không đúng!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(Icons.lock_outline,
                                      color: Colors.black54, size: 30),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15),
                                hintText: "Xác nhận mật khẩu mới",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _handleChangePass();
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 0.8, color: Colors.blue),
                            ),
                            child: const Text(
                              "Đổi mật khẩu",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
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
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  void _handleChangePass() async {
    setState(() {
      _isLoading = true;
    });
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    var data = {
      'email': user['email'],
      'password': passwordController.text,
      'newPass': newPassController.text,
    };

    var res = await changepass(data);
    var body = json.decode(res.body);
    if (body['success']) {
      setState(() {
        passwordController.clear();
        newPassController.clear();
        reNewPassController.clear();
      });
      showFlushbar('Đổi mật khẩu thành công', Colors.green, Icons.check_circle);
    } else {
      showFlushbar('Mật khẩu không đúng!', Colors.red, Icons.error);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
