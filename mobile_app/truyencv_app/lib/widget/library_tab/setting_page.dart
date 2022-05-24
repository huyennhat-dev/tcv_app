import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 35),
            SettingPageHeader(size: size),
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: size.height - 85,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Lịch sử",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: const Color(0xFF1A5D97),
                              border: Border.all(
                                width: 0.5,
                                color: const Color(0xFF1A5D97),
                              ),
                            ),
                            child: const Text(
                              "Chương mới",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                width: 0.5,
                                color: const Color(0xFF1A5D97),
                              ),
                            ),
                            child: const Text(
                              "Mới đọc",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                width: 0.5,
                                color: const Color(0xFF1A5D97),
                              ),
                            ),
                            child: const Text(
                              "Tên truyện",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Đánh dấu",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Myfont',
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: const Color(0xFF1A5D97),
                              border: Border.all(
                                width: 0.5,
                                color: const Color(0xFF1A5D97),
                              ),
                            ),
                            child: const Text(
                              "Chương mới",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                width: 0.5,
                                color: const Color(0xFF1A5D97),
                              ),
                            ),
                            child: const Text(
                              "Tên truyện",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Myfont',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingPageHeader extends StatelessWidget {
  const SettingPageHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_sharp,
                color: Colors.black54,
                size: 26,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width - 120,
            child: const Text(
              "Cài đặt tủ truyện",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Myfont',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
