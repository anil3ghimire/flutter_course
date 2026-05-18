import 'package:flutter/material.dart';
import 'package:flutter_second/model/user_info.dart';
import 'package:flutter_second/screens/register_screen.dart';
import 'package:flutter_second/utils/validation_ext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            children: [
              TextFormField(
                validator: (value) => value.isValidEmail,
                controller: userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "UserName",
                ),
              ),
              TextFormField(
                validator: (value) => value.isValidPassword,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "password",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var username = userNameController.text.trim();
                    var password = passwordController.text.trim();
                    print('My value is $password and $username');
                    userNameController.clear();
                    passwordController.clear();

                    var userinfo = UserInfo(
                      password: password,
                      username: username,
                      isLogin: true,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen(userInfo: userinfo);
                        },
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: .center,
                  children: [Text('Send Data')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
