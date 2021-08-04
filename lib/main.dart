import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmadata/screen/login_screen.dart';
import './screen/home_screen.dart';

void main() => runApp(Karmadata());

class Karmadata extends StatelessWidget {
  const Karmadata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.grey,
          fontFamily: "Bitter"),
      home: Scaffold(body: HomaPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
