// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:truyencv_app/model/notify.dart';
import '../../urls/urls_api.dart';

class NotifyTab extends StatefulWidget {
  const NotifyTab({Key? key}) : super(key: key);

  @override
  State<NotifyTab> createState() => _NotifyTabState();
}

final _base = ApiUrls().baseUrl;

class _NotifyTabState extends State<NotifyTab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông báo",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Myfont',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: 50,
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.playlist_add_check_sharp,
                color: Colors.grey,
                size: 34,
              ),
            ),
          )
        ],
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height - 131,
            width: size.width,
            child: Center(
              child: Container(
                width: size.width / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/notify.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoptifyItem extends StatelessWidget {
  NoptifyItem({
    Key? key,
    required this.press,
    this.notify,
  }) : super(key: key);
  final Function press;
  Notify? notify;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        press();
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
          top: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.width / 7,
              width: size.width / 7,
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: notify!.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: (size.width - 38) - (size.width / 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    notify!.name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Myfont',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 7),
                  // ignore: prefer_const_constructors
                  Text(
                    "2 tiếng trước",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Myfont',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
