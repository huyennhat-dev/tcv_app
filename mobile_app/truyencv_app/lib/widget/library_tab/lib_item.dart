// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../urls/urls_api.dart';
import '../../model/library.dart';

final _base = ApiUrls().baseUrl;

class LibItem extends StatefulWidget {
  LibItem({
    Key? key,
    required this.press,
    this.library,
    required this.ellipsisVerticalClick,
  }) : super(key: key);

  Library? library;
  final Function press;
  final Function ellipsisVerticalClick;

  @override
  State<LibItem> createState() => _LibItemState();
}

class _LibItemState extends State<LibItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        widget.press();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ((size.width - 40) / 5) * 4 / 3,
              width: (size.width - 40) / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Image.network(
                  '$_base/tcv/public/uploads/truyen/' +
                      widget.library!.hinhanh!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ((size.width - 90) - ((size.width - 40) / 5)),
                  child: Text(
                    widget.library!.tentruyen!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Myfont',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_off,
                    color: Colors.black54,
                    size: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.ellipsisVerticalClick();
                  },
                  child: const Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Colors.black54,
                    size: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
