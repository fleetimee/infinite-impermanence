// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    this.status,
    this.message,
    this.data,
    this.accessToken,
  });

  int? status;
  String? message;
  Data? data;
  String? accessToken;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data?.toJson(),
        "access_token": accessToken,
      };
}

class Data {
  Data({
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user?.toJson(),
      };
}

class User {
  User({
    this.id,
    this.uid,
    this.email,
    this.phoneNumber,
    this.password,
    this.displayName,
    this.photoUrl,
    this.createdAt,
  });

  int? id;
  String? uid;
  String? email;
  String? phoneNumber;
  String? password;
  String? displayName;
  String? photoUrl;
  DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uid: json["uid"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        displayName: json["displayName"],
        photoUrl: json["photoURL"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "displayName": displayName,
        "photoURL": photoUrl,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
      };
}
