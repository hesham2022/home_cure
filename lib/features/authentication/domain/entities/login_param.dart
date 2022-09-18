// To parse this JSON data, do
//
//     final loginParam = loginParamFromMap(jsonString);

import 'dart:convert';

import 'package:home_cure/core/utils/fcm_utils.dart';

class LoginParam {
  LoginParam({
    required this.password,
    required this.email,
  });
  factory LoginParam.fromJson(String str) =>
      LoginParam.fromMap(json.decode(str) as Map<String, dynamic>);

  factory LoginParam.fromMap(Map<String, dynamic> json) => LoginParam(
        password: json['password'] as String,
        email: json['email'] as String,
      );
  String toJson() => json.encode(toMap());

  final String password;
  final String email;

  LoginParam copyWith({
    String? password,
    String? email,
  }) =>
      LoginParam(
        password: password ?? this.password,
        email: email ?? this.email,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'password': password,
        'email': email,
        'fcm':PushNotifications.fcmToken
      };
}
