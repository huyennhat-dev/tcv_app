// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, camel_case_types

import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/model/account.dart';
import 'package:truyencv_app/model/comment.dart';
import 'package:truyencv_app/util/loading.dart';

import '../../urls/urls_api.dart';
import '../profile_tab/un_logged/sign_in_page.dart';

final _base = ApiUrls().baseUrl;

Future<Comment> createCommnet(truyenId, content) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var userJson = localStorage.getString('user');
  var user = json.decode(userJson!);

  final response = await http.post(
    Uri.parse('$_base/tcv/public/api/v1/comment'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'truyen_id': truyenId,
      'u_id': user['id'],
      'noidung': content,
    }),
  );

  if (response.statusCode == 200) {
    return Comment.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key, this.truyenId}) : super(key: key);
  final truyenId;
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  ScrollController? _controller;

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List datafile = [];
  var user;

  int _page = 1;

  bool _hasNextPage = true;

  bool _isFirstLoadRunning = false;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _firstLoad(truyenId) async {
    setState(() {});
    try {
      final res = await http.get(Uri.parse(
          "$_base/tcv/public/api/v1/load_comment/$truyenId?page=$_page"));
      setState(() {
        final String jsonBody = res.body;
        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);

        final List commentList = useListContainer['data'];
        _posts = commentList
            .map((contactRaw) => Comment.fromJson(contactRaw))
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
        _controller!.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1; // Increase _page by 1
      try {
        var truyenId = widget.truyenId;
        final res = await http.get(Uri.parse(
            "$_base/tcv/public/api/v1/load_comment/$truyenId?page=$_page"));

        final String jsonBody = res.body;

        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);
        final List commentList = useListContainer['data'];
        final List fetchedPosts = commentList
            .map((contactRaw) => Comment.fromJson(contactRaw))
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
  void dispose() {
    _controller!.removeListener(_loadMore);
    super.dispose();
  }

  Widget commentChild(data, Size size) {
    return Column(
      children: [
        for (var i = 0; i < data.length; i++)
          commentItem(size, data[i]['noidung'], data[i]['u_id'])
      ],
    );
  }

  void loadUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    user = json.decode(userJson!);
  }

  void _addComment(val) {
    setState(() {
      createCommnet(
        widget.truyenId,
        val,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // _futureComment = fetchComment(widget.truyenId);
    _firstLoad(widget.truyenId);
    _controller = ScrollController()..addListener(_loadMore);
    setState(() {
      loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bình luận",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: CommentBox(
        userImage: 'https://static.cdnno.com/user/default/100.jpg',
        child: ListView(
          controller: _controller,
          children: [
            const SizedBox(height: 15),
            commentChild(datafile, size),
            _isFirstLoadRunning
                ? const Center(
                    child: Loading(),
                  )
                : Column(
                    children: [
                      for (int i = 0; i < _posts.length; i++)
                        commentItem(
                          size,
                          _posts[i].noidung,
                          _posts[i].uId,
                        )
                    ],
                  ),
            if (_isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Center(
                  child: Loading(),
                ),
              ),
            const SizedBox(height: 15),
          ],
        ),
        labelText: 'Thêm bình luận...',
        withBorder: false,
        errorText: 'Không thể bỏ trống',
        sendButtonMethod: () {
          if (user != null) {
            if (formKey.currentState!.validate()) {
              setState(() {
                var value = {
                  "truyen_id": widget.truyenId,
                  "u_id": user['id'],
                  "noidung": commentController.text,
                };
                datafile.insert(0, value);
                _addComment(commentController.text);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            }
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          }
        },
        formKey: formKey,
        commentController: commentController,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        sendWidget:
            const Icon(Icons.send_sharp, size: 30, color: Colors.black54),
      ),
    );
  }

  Widget commentItem(Size size, data, id) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageComment(id: id),
          const SizedBox(width: 10),
          const SizedBox(height: 3),
          Row(
            children: [
              SizedBox(
                width: (size.width - 60) * 0.08 + 15,
              ),
              Text(
                data,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Myfont',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 1),
              Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.black45,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '0',
                        style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.comment,
                          color: Colors.black45,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '0',
                        style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class imageComment extends StatefulWidget {
  const imageComment({
    Key? key,
    this.id,
  }) : super(key: key);
  final id;

  @override
  State<imageComment> createState() => _imageCommentState();
}

class _imageCommentState extends State<imageComment> {
  late Future<Account> _futureAccount;

  Future<Account> fetchAccount() async {
    var cusId = widget.id;

    final response = await http
        .get(Uri.parse('$_base/tcv/public/api/v1/show_account/$cusId'));
    if (response.statusCode == 200) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unexpected error occured!');
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

    return FutureBuilder<Account>(
      future: _futureAccount,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Row(
              children: [
                SizedBox(
                  width: (size.width - 60) * 0.08,
                  height: (size.width - 60) * 0.08,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: '$_base/tcv/public/uploads/cus_avt/' +
                          (snapshot.data!.avatar).toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  (snapshot.data!.username).toString(),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Myfont',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            );
          }
        }

        return SizedBox(
          width: (size.width - 60) * 0.08,
          height: (size.width - 60) * 0.08,
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Loading(),
            ),
          ),
        );
      },
    );
  }
}
