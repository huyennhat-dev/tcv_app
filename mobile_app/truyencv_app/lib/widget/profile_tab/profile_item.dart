import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);
  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Myfont',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
