import 'package:flutter/material.dart';

import '../profile_item.dart';
import '../question_page.dart';
import 'sign_in_page.dart';

class ProfileUnLogged extends StatelessWidget {
  const ProfileUnLogged({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              ProfileItem(
                press: () {},
                text: "Cài đặt",
              ),
              ProfileItem(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionPage(),
                    ),
                  );
                },
                text: "Câu hỏi thường gặp",
              ),
              ProfileItem(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
                text: "Đăng nhập",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
