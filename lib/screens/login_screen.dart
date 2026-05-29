import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second/models/product/product.dart';
import 'package:flutter_second/models/user_info.dart';
import 'package:flutter_second/route/app_routes.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //override
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text('Login Screen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            children: [
              TextFormField(
                // validator: (value) => value.isValidEmail,
                controller: userNameController,
                decoration: InputDecoration(hintText: "UserName"),
              ),
              TextFormField(
                // validator: (value) => value.isValidPassword,
                controller: passwordController,

                decoration: InputDecoration(hintText: "password"),
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
                    //TOOD
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return RegisterScreen(userInfo: userinfo);
                    //     },
                    //   ),
                    // );
                    // extra: userinfo
                    // context.push(AppRoutes.register, extra: userinfo);
                    loginAuth(username, password);
                  }
                },
                child: Row(
                  mainAxisAlignment: .center,
                  children: [Text('Login')],
                ),
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        var product = Product(
                          id: 1,
                          title: "Abc",
                          price: 12.2,
                          description: "dddj",
                          category: "createState",
                          image: "url",
                        );
                        updateProduct(product);
                      },
                      child: Text('Update'),
                    ),
              ElevatedButton(
                onPressed: () {
                  deleteProduct(1);
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future deleteProduct(int id) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await dio.delete(
        'https://fakestoreapi.com/products/$id',

        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        print('product deleted');
      }
    } catch (e) {
      print("Error is ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future updateProduct(Product product) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await dio.put(
        'https://fakestoreapi.com/products/1',
        data: product.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        print('product updated');
      }
    } catch (e) {
      print("Error is ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future loginAuth(String username, String password) async {
    var userInfo = UserInfo(username: username, password: password).toMap();

    final response = await dio.post(
      "https://fakestoreapi.com/auth/login",
      data: userInfo,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    print(' data ${response.statusCode}');

    if (response.statusCode == 201) {
      context.push(AppRoutes.homescreen);
    }
  }
}
