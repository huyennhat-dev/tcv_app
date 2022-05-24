import 'package:flutter/material.dart';

class Converter extends StatelessWidget {
  const Converter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Trần Ngọc Phong'.toUpperCase(),
      style: const TextStyle(
        color: Color(0xFF1F5492),
        fontFamily: 'Myfont',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}
