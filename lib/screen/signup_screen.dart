import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:karmadata/model/signup_model.dart';
import 'package:get/get.dart';
import 'package:karmadata/screen/login_screen.dart';

class Signup extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}
// ignore: unused_element

class _UserLoginState extends State<Signup> {
  Future<SignupModel?> userSignup(
      String name, String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:3000 /api/v1/users/signup');
    var response = await http
        .post(url, body: {'name': name, 'email': email, 'password': password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Get.to(() => UserLogin());
    }
    return null;
  }

  late SignupModel _model;
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Image.asset(
                    ('assets/images/signup.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                Card(
                  elevation: 3,
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Name'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  elevation: 3,
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'email'),
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
                    String name = _name.text;
                    String email = _email.text;
                    String password = _password.text;

                    await userSignup(name, email, password);
                  },
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(primary: Color(0xff6b0e0e)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
