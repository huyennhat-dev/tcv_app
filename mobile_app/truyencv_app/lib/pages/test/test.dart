// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TestPage extends StatelessWidget {
  final GoogleSignInAccount user;

  const TestPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const SizedBox(height: 100),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl!),
            ),
            Text('Name' + user.displayName!),
            Text('Name' + user.email),
            Text('Name' + user.serverAuthCode!),
          ],
        ),
      ),
    );
  }
}
