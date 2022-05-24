// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/model/account.dart';
import 'package:truyencv_app/util/loading.dart';
import '../../../urls/urls_api.dart';

final _base = ApiUrls().baseUrl;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  late Future<Account> _futureProfile;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController yearOfBirthController = TextEditingController();

  File? imageFile;
  var base64Image;
  var jsonBody;

  Future<Account> fetchProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    var cusId = user['id'];

    final response = await http.get(
      Uri.parse('$_base/tcv/public/api/v1/show_account/$cusId'),
    );

    if (response.statusCode == 200) {
      jsonBody = jsonDecode(response.body);

      nameController.text = jsonBody['username'];
      phoneController.text = jsonBody['numberphone'];
      descController.text = jsonBody['introduce'];
      yearOfBirthController.text = jsonBody['yearofbirth'];

      return Account.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load Profile');
    }
  }

  Future<Account> updateProfile(
    String username,
    String numberPhone,
    String yearOfBirth,
    String description,
    String image,
  ) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    var cusId = user['id'];

    final response = await http.put(
      Uri.parse('$_base/tcv/public/api/v1/upload_profile/$cusId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'numberphone': numberPhone,
        'yearofbirth': yearOfBirth,
        'desc': description,
        'image': image
      }),
    );

    if (response.statusCode == 200) {
      showFlushbar();
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Profile.');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureProfile = fetchProfile();
  }

  void showFlushbar() {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      message: "Cập nhật thành công",
      messageSize: 17,
      icon: Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.green,
      ),
      borderRadius: BorderRadius.circular(10.0),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      duration: Duration(seconds: 3),
    ).show(context);
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _getFromCamenra();
                },
                child: Row(
                  children: [
                    Icon(Icons.camera_alt, color: Colors.black),
                    Text(
                      'Camera',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _getFromgallery();
                },
                child: Row(
                  children: [
                    Icon(Icons.image, color: Colors.black),
                    Text(
                      'Gallery',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _getFromCamenra() async {
    Navigator.of(context, rootNavigator: true).pop('dialog');

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    _cropImage(pickedFile!.path);
    // Navigator.pop(context);
  }

  void _getFromgallery() async {
    Navigator.of(context, rootNavigator: true).pop('dialog');

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );

    _cropImage(pickedFile!.path);
  }

  void _cropImage(filePath) async {
    File? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (croppedImage != null) {
      setState(() {
        imageFile = croppedImage;
      });
    }
  }

  Widget showImage(image) {
    if (imageFile != null) {
      base64Image = base64Encode(imageFile!.readAsBytesSync());
    }
    return imageFile != null
        ? Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: ClipOval(
                  child: Image.file(
                    imageFile!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.grey.shade50,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blue,
                    ),
                    child:
                        Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(4),
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
                    image != null
                        ? '$_base/tcv/public/uploads/cus_avt/$image'
                        : '$_base/tcv/public/dist/img/avatar2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.grey.shade50,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blue,
                    ),
                    child:
                        Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sửa hồ sơ",
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
      body: SizedBox(
        height: size.height - 50,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                FutureBuilder<Account>(
                  future: _futureProfile,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            const SizedBox(height: 50),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  _showImageDialog();
                                },
                                child: showImage(
                                  snapshot.data!.avatar != null
                                      ? snapshot.data!.avatar!
                                      : null,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: size.width - 20,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.person_outline,
                                              color: Colors.black54, size: 30),
                                          SizedBox(
                                            width: size.width * 0.75,
                                            child: TextField(
                                              controller: nameController,
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: "Tên của bạn",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: size.width - 20,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.phone_outlined,
                                              color: Colors.black54, size: 30),
                                          SizedBox(
                                            width: size.width * 0.75,
                                            child: TextField(
                                              controller: phoneController,
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: "Điện thoại",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: size.width - 20,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.event_outlined,
                                              color: Colors.black54, size: 30),
                                          SizedBox(
                                            width: size.width * 0.75,
                                            child: TextField(
                                              controller: yearOfBirthController,
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 11,
                                                  top: 11,
                                                  right: 15,
                                                ),
                                                hintText:
                                                    "Ngày sinh (mm-dd-yyyy)",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: size.width - 20,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.sticky_note_2_outlined,
                                              color: Colors.black54,
                                              size: 30),
                                          SizedBox(
                                            width: size.width * 0.75,
                                            child: TextField(
                                              controller: descController,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: "Giới thiệu ngắn",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _futureProfile = updateProfile(
                                    nameController.text,
                                    phoneController.text,
                                    yearOfBirthController.text,
                                    descController.text,
                                    base64Image,
                                  );
                                });
                              },
                              child: Text('Cập nhật'),
                            ),
                          ],
                        );
                      }
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: Center(child: const Loading()),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
