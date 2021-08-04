// To parse this JSON data, do
//
//     final signupmodel = signupmodelFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

SignupModel signupmodelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupmodelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  String id;
  String name;
  String email;
  String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
      };
}
