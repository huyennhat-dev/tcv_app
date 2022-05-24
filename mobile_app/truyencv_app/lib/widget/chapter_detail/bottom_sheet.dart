// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../book_details/comment.dart';
import 'list_chapter.dart';

class BottomSheetChapter extends StatefulWidget {
  const BottomSheetChapter({Key? key, this.truyenId}) : super(key: key);
  final truyenId;

  @override
  State<BottomSheetChapter> createState() => _BottomSheetChapterState();
}

class _BottomSheetChapterState extends State<BottomSheetChapter> {
  Size get size => MediaQuery.of(context).size;

  double _currentSliderValue = 1;

  var isOn = 0;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      color: Colors.black54,
      fontFamily: 'Myfont',
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            child: const Text(
              "Thông tin",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Myfont',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: size.width - 40,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "164 / 788",
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.arrow_left),
                    ),
                    SizedBox(
                      width: (size.width - 40) / 1.5,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 1,
                          activeTrackColor: Colors.grey.shade400,
                          thumbColor: Colors.blue.shade700,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 5.0),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 7.0),
                        ),
                        child: Slider(
                          value: _currentSliderValue,
                          min: 1,
                          max: 1000,
                          divisions: 1000,
                          inactiveColor: Colors.grey.shade300,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.arrow_right),
                    ),
                  ],
                ),
                SizedBox(
                  width: (size.width - 40) / 1.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListChapter(
                                truyenId: widget.truyenId,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.playlist_play_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "D.s Chương",
                              style: textStyle,
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isOn == 0 ? isOn = 1 : isOn = 0;
                              });
                            },
                            child: Icon(
                              isOn == 0
                                  ? Icons.brightness_4_outlined
                                  : Icons.brightness_5_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            isOn == 0 ? "Dark" : "Light",
                            style: textStyle,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Đánh dấu",
                            style: textStyle,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.headphones_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Nghe",
                            style: textStyle,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: size.width - 40,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.cloud_download_outlined,
                      color: Colors.black45,
                      size: 26,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Tải truyện",
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentPage(truyenId: widget.truyenId),
                ),
              );
            },
            child: Container(
              width: size.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.comment_outlined,
                        color: Colors.black45,
                        size: 26,
                      ),
                      const SizedBox(width: 10),
                      Text("Bình luận", style: textStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Container(
              width: size.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.book_outlined,
                        color: Colors.black45,
                        size: 26,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Thông tin truyện",
                        style: textStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width - 40,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.flag_outlined,
                      color: Colors.black45,
                      size: 26,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Báo lỗi",
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: size.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.supervisor_account_outlined,
                        color: Colors.black45,
                        size: 26,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Người tạo nội dung",
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
