// To parse required this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.message,
    required this.info,
  });

  String message;
  Info info;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "info": info.toJson(),
      };
}

class Info {
  Info({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.v,
  });

  String id;
  String name;
  String email;
  String password;
  int v;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "__v": v,
      };
}
