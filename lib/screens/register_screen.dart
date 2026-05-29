// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_second/models/user_info.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.userInfo});

  final UserInfo userInfo;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Screen')),
      body: Column(
        children: [
          Text(
            'user name ${widget.userInfo.username} and password is ${widget.userInfo.password}',
          ),
          Checkbox(value: widget.userInfo.isLogin, onChanged: (v) {}),
        ],
      ),
    );
  }
}
