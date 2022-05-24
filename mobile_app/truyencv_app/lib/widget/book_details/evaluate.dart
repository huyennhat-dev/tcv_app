// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, unused_field, must_be_immutable

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:truyencv_app/model/rating.dart';

import '../../urls/urls_api.dart';
import 'rating_page.dart';

class Evaluate extends StatefulWidget {
  const Evaluate({Key? key, this.truyenId}) : super(key: key);
  final truyenId;

  @override
  State<Evaluate> createState() => _EvaluateState();
}

final _base = ApiUrls().baseUrl;

class _EvaluateState extends State<Evaluate> {
  List _lists = [];

  void _loadRatingByBook() async {
    try {
      var truyenId = widget.truyenId;

      final res = await http
          .get(Uri.parse("$_base/tcv/public/api/v1/rating/$truyenId"));
      setState(() {
        final String jsonBody = res.body;

        const JsonDecoder _decoder = JsonDecoder();
        final useListContainer = _decoder.convert(jsonBody);

        final List RatingList = useListContainer['data'];

        _lists = RatingList.map((contactRaw) => Rating.fromJson(contactRaw))
            .toList();
      });
    } catch (err) {
      print('Something went wrong');
    }
  }

  @override
  void initState() {
    setState(() {
      _loadRatingByBook();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height - 331,
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Đánh giá",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            _lists.length.toString(),
                            style: const TextStyle(
                              color: Colors.black45,
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          final value = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RatingPage(truyenId: widget.truyenId),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF1A5D97),
                          ),
                          child: const Icon(
                            Icons.edit_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < _lists.length; i++)
                  EvaluateCommentItem(
                    size: size,
                    rating: _lists[i],
                  ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EvaluateCommentItem extends StatelessWidget {
  EvaluateCommentItem({
    Key? key,
    required this.size,
    this.rating,
  }) : super(key: key);

  final Size size;
  Rating? rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: (size.width - 60) / 6.5,
                height: (size.width - 60) / 6.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    '$_base/tcv/public/uploads/cus_avt/' +
                        (rating!.avt).toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: size.width - 70 - ((size.width - 60) / 6.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (rating!.ten).toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RatingBarIndicator(
                      rating: rating!.sosao!,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 16,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      (rating?.noidung).toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Myfont',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 1),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
