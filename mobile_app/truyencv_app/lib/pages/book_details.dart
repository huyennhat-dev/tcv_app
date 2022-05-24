// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, unused_local_variable, non_constant_identifier_names, prefer_if_null_operators

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truyencv_app/model/check.dart';
import 'package:truyencv_app/util/loading.dart';
import 'package:truyencv_app/widget/book_details/comment.dart';
import 'package:truyencv_app/widget/book_details/introduce.dart';
import 'package:truyencv_app/widget/chapter_detail/chapter_detail.dart';

import '../model/category.dart';
import '../urls/urls_api.dart';
import '../model/book.dart';
import '../model/library.dart';
import '../widget/book_details/chapter_list.dart';
import '../widget/book_details/evaluate.dart';
import 'package:http/http.dart' as http;

import '../widget/profile_tab/un_logged/sign_in_page.dart';

final _base = ApiUrls().baseUrl;

class BookDetails extends StatefulWidget {
  BookDetails({
    Key? key,
    this.librarysheet,
    this.truyenId,
  }) : super(key: key);
  Library? librarysheet;
  final truyenId;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

Future<Book> fetchBook(id) async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/books/$id'),
  );
  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Category> fetchCategory(id) async {
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/category/$id'),
  );
  if (response.statusCode == 200) {
    return Category.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Check> checkTickbook(truyenId) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var userJson = localStorage.getString('user');
  var user = json.decode(userJson!);
  var cusId = user['id'].toInt();
  final response = await http.get(
    Uri.parse('$_base/tcv/public/api/v1/checktickbook/$cusId/$truyenId'),
  );
  if (response.statusCode == 200) {
    return Check.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Library> createTickbook(
    truyenId, image, name, chapterId, chapterSlug) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var userJson = localStorage.getString('user');
  var user = json.decode(userJson!);
  var cusId = user['id'].toInt();
  final response = await http.post(
    Uri.parse('$_base/tcv/public/api/v1/tickbook'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'truyen_id': truyenId,
      'cus_id': cusId,
      'hinhanh': image,
      'tentruyen': name,
      'chapter_id': chapterId,
      'chapter_slug': chapterSlug,
    }),
  );

  if (response.statusCode == 200) {
    return Library.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class _BookDetailsState extends State<BookDetails> {
  late Future<Book> futureBook;
  late Future<Category> futureCategory;
  late Future<Check> futureCheckTickBook;
  bool status = true;
  var user;

  void loadUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    user = json.decode(userJson!);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      futureBook = fetchBook(widget.truyenId);
      futureCheckTickBook = checkTickbook(widget.truyenId);
      loadUser();
    });
  }

  void _showChapter(truyenId, int chapSlug, countChap) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailChapter(
          truyenId: truyenId,
          chapterSlug: chapSlug,
          countChapter: countChap,
        ),
      ),
    );
  }

  Widget addAndDelToTickBook(Size size, image, name) {
    return FutureBuilder<Check>(
      future: futureCheckTickBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    createTickbook(
                      widget.truyenId,
                      widget.librarysheet != null
                          ? widget.librarysheet!.hinhanh
                          : image,
                      widget.librarysheet != null
                          ? widget.librarysheet!.tentruyen
                          : name,
                      widget.librarysheet != null
                          ? widget.librarysheet!.chuongId
                          : 1,
                      widget.librarysheet != null
                          ? widget.librarysheet!.chuongSlug
                          : 1,
                    );
                    status == true ? status = false : status = true;
                  });
                },
                child: Container(
                  height: 25,
                  width: 25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    snapshot.data!.success != status ? Icons.add : Icons.remove,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Container(
                alignment: Alignment.center,
                width: 60,
                child: Text(
                  snapshot.data!.success != status
                      ? 'Thêm vào tủ truyện'
                      : 'Xóa khỏi tủ truyện',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Myfont',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Widget IconTickbook(image, name) {
    return FutureBuilder<Check>(
      future: futureCheckTickBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InkWell(
            onTap: () {
              setState(() {
                createTickbook(
                  widget.truyenId,
                  widget.librarysheet != null
                      ? widget.librarysheet!.hinhanh
                      : image,
                  widget.librarysheet != null
                      ? widget.librarysheet!.tentruyen
                      : name,
                  widget.librarysheet != null
                      ? widget.librarysheet!.chuongId
                      : 1,
                  widget.librarysheet != null
                      ? widget.librarysheet!.chuongSlug
                      : 1,
                );
                status == true ? status = false : status = true;
              });
            },
            child: Container(
              height: 25,
              width: 25,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF1A5D97),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                snapshot.data!.success != status ? Icons.add : Icons.remove,
                size: 18,
                color: Colors.white,
              ),
            ),
          );
        }

        // By default, show a loading spinner.
        return const SizedBox();
      },
    );
  }

  Widget category(cateId) {
    return FutureBuilder<Category>(
      future: fetchCategory(cateId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF1A5D97),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              (snapshot.data!.tentheloai).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Myfont',
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          );
        }
        return const SizedBox(
          width: 100,
          height: 10,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder<Book>(
      future: futureBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.white,
              bottomOpacity: 0.0,
              elevation: 0.0,
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height - 31,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 260,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '$_base/tcv/public/uploads/truyen/' +
                                  (snapshot.data!.hinhanh).toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 31,
                              width: 31,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_sharp,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 125,
                                    height: 170,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/loading.gif',
                                        image:
                                            '$_base/tcv/public/uploads/truyen/' +
                                                (snapshot.data!.hinhanh)
                                                    .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (size.width - 70) - 125,
                                    height: 170,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            category(snapshot.data!.theloaiId),
                                            const SizedBox(height: 5),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  (snapshot.data!.tentruyen)
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Myfont',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  (snapshot.data!.tacgia)
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Myfont',
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 7),
                                            Row(
                                              children: [
                                                RatingBarIndicator(
                                                  rating: snapshot.data!.sosao!,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 16,
                                                  direction: Axis.horizontal,
                                                ),
                                                Text(
                                                  '(' +
                                                      (snapshot.data!.sodanhgia)
                                                          .toString() +
                                                      ' đánh giá) ',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Myfont',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _showChapter(
                                                    snapshot.data!.id!,
                                                    widget.librarysheet != null
                                                        ? widget.librarysheet!
                                                            .chuongSlug!
                                                        : 1,
                                                    snapshot.data!.sochuong!,
                                                  );
                                                },
                                                child: Container(
                                                  height: 25,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 7,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF1A5D97),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: const Text(
                                                    "Đọc truyện",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Myfont',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 7),
                                              user != null
                                                  ? addAndDelToTickBook(
                                                      size,
                                                      snapshot.data!.hinhanh,
                                                      snapshot.data!.tentruyen,
                                                    )
                                                  : Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SignInPage(),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            height: 25,
                                                            width: 25,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        3,
                                                                    vertical:
                                                                        3),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            child: const Icon(
                                                              Icons.add,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: ((size.height /
                                                                      3) *
                                                                  2 /
                                                                  3) -
                                                              116,
                                                          // ignore: prefer_const_constructors
                                                          child: Text(
                                                            'Thêm vào tủ truyện',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Myfont',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 11,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      TabBookDetails(
                        size: size,
                        truyenId: snapshot.data!.id!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: Container(
              width: size.width - 60,
              height: 60,
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 10, bottom: 10),
              margin:
                  const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Row(
                children: [
                  SizedBox(
                    width: (size.width - 60) - 126,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (snapshot.data?.tentruyen).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Myfont',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Tiên Hiệp',
                          style: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Myfont',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _showChapter(
                            snapshot.data?.id!,
                            widget.librarysheet != null
                                ? widget.librarysheet!.chuongSlug!
                                : 1,
                            snapshot.data!.sochuong!,
                          );
                        },
                        child: Container(
                          height: 25,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Đọc",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      user != null
                          ? IconTickbook(
                              snapshot.data!.hinhanh,
                              snapshot.data!.tentruyen,
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A5D97),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        }

        return const Scaffold(
          body: Center(
            child: Loading(),
          ),
        );
      },
    );
  }
}

class TabBookDetails extends StatefulWidget {
  const TabBookDetails({
    Key? key,
    required this.size,
    required this.truyenId,
  }) : super(key: key);

  final Size size;
  final int truyenId;

  @override
  State<TabBookDetails> createState() => _TabBookDetailsState();
}

class _TabBookDetailsState extends State<TabBookDetails> {
  int _selectPage = 0;
  late PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 291,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: 40,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TabButton(
                  text: 'Giới thiệu',
                  pageNumber: 0,
                  selectedPage: _selectPage,
                  press: () {
                    _changePage(0);
                  },
                ),
                TabButton(
                  text: 'Đánh giá',
                  pageNumber: 1,
                  selectedPage: _selectPage,
                  press: () {
                    _changePage(1);
                  },
                ),
                TabButton(
                  text: 'D.s chương',
                  pageNumber: 2,
                  selectedPage: _selectPage,
                  press: () {
                    _changePage(2);
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CommentPage(truyenId: widget.truyenId),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 0,
                      left: 10,
                      right: 10,
                    ),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1.5, color: Colors.transparent),
                        ),
                      ),
                      child: const Text(
                        "Bình luận",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Myfont',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height - 331,
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _selectPage = page;
                });
              },
              controller: _pageController,
              children: [
                Introduce(truyenId: widget.truyenId),
                Evaluate(truyenId: widget.truyenId),
                ChapterList(truyenId: widget.truyenId),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.text,
    required this.selectedPage,
    required this.pageNumber,
    required this.press,
  }) : super(key: key);
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 0,
          left: 10,
          right: 10,
        ),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: selectedPage == pageNumber
                    ? Colors.black54
                    : Colors.transparent,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selectedPage == pageNumber ? Colors.black : Colors.black54,
              fontFamily: 'Myfont',
              fontSize: 16,
              fontWeight: selectedPage == pageNumber
                  ? FontWeight.w400
                  : FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
