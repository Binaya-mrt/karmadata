import 'dart:io';
import 'dart:ui';
import 'package:karmadata/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:karmadata/screen/home_screen.dart';
import 'signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLogin extends StatefulWidget {
  UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();

  // ignore: non_constant_identifier_names

}

class _UserLoginState extends State<UserLogin> {
  Future<LoginModel?> UserSignin(String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:3000 /api/v1/users/login');
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      Get.to(() => Map());
    } else {
      throw HttpException('Unexpectaed error ${response.statusCode}');
    }
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Image.asset(
                  ('assets/images/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Card(
                elevation: 3,
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                  textAlign: TextAlign.center,
                ),
              ),
              Card(
                elevation: 3,
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Password'),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String email = _email.text;
                  String password = _password.text;

                  await UserSignin(email, password);
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6b0e0e),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(Signup());
                },
                child: Text('Not a user? Register'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6b0e0e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
