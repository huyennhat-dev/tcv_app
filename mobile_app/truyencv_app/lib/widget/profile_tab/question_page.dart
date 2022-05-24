// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:truyencv_app/model/ques.dart';
import 'package:truyencv_app/urls/urls_api.dart';
import 'package:http/http.dart' as http;
import 'package:truyencv_app/util/loading.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

final _base = ApiUrls().baseUrl;
Future<List<Question>> fetchQuestion() async {
  final response =
      await http.get(Uri.parse('$_base/tcv/public/api/v1/load_ques'));
  if (response.statusCode == 200) {
    const JsonDecoder _decoder = JsonDecoder();
    final useListContainer = _decoder.convert(response.body);
    final List jsonResponse = useListContainer;
    return jsonResponse.map((data) => Question.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _QuestionPageState extends State<QuestionPage> {
  late Future<List<Question>> futureQuestions;

  @override
  void initState() {
    super.initState();
    futureQuestions = fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Câu hỏi thường gặp",
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
      body: FutureBuilder<List<Question>>(
        future: futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.grey.shade50,
              height: size.height - 50,
              width: size.width,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return questionItem(
                      (snapshot.data![index].cautraloi).toString(),
                      (index + 1).toString() +
                          ".  " +
                          (snapshot.data![index].cauhoi).toString(),
                    );
                  },
                ),
              ),
            );
          }
          // By default show a loading spinner.
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height - 85,
                width: size.width,
                child: const Center(child: Loading()),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget questionItem(content, title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ExpandableNotifier(
          child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
          ),
          header: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Myfont',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          collapsed: SizedBox(
            height: 0,
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Myfont',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.grey.shade100,
                child: Html(
                  data: content,
                  style: {
                    "body": Style(
                      fontSize: const FontSize(16.0),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Myfont',
                      color: Colors.black,
                      textOverflow: TextOverflow.fade,
                    ),
                  },
                ),
              ),
            ],
          ),
          builder: (_, collapsed, expanded) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Expandable(
                collapsed: collapsed,
                expanded: expanded,
                theme: const ExpandableThemeData(crossFadePoint: 0),
              ),
            );
          },
        ),
      )),
    );
  }
}
