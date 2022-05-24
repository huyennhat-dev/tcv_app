// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:truyencv_app/util/loading.dart';
import 'dart:convert';

import '../model/category.dart';
import 'package:http/http.dart' as http;

import '../../urls/urls_api.dart';

final _base = ApiUrls().baseUrl;

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    Key? key,
    this.cateId,
  }) : super(key: key);
  final cateId;
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<Category> futureCategory;

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

  @override
  void initState() {
    super.initState();
    setState(() {
      futureCategory = fetchCategory(widget.cateId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Category>(
      future: futureCategory,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            ("#" + (snapshot.data!.tentheloai).toString()).toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF1F5492),
              fontFamily: 'Myfont',
              fontWeight: FontWeight.w400,
              fontSize: 14,
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
}
