// To parse this JSON data, do
//
//     final loginParam = loginParamFromMap(jsonString);

import 'dart:convert';

import 'package:home_cure/core/utils/fcm_utils.dart';

class SignParam {
  SignParam({
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.birthOfDate,
    required this.gender,
  });

  factory SignParam.fromMap(Map<String, dynamic> json) => SignParam(
        name: json['name'] as String,
        password: json['password'] as String,
        email: json['email'] as String,
        phoneNumber: json['phoneNumber'] as String,
        birthOfDate: DateTime.parse(json['birthOfDate'] as String),
        gender: json['gender'] as String,
      );
  factory SignParam.fromJson(String str) =>
      SignParam.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
  final String name;
  final String password;
  final String email;
  final String phoneNumber;
  final DateTime birthOfDate;
  final String gender;
  SignParam copyWith({
    String? name,
    String? password,
    String? email,
    String? phoneNumber,
    DateTime? birthOfDate,
    String? gender,
  }) =>
      SignParam(
        birthOfDate: birthOfDate ?? this.birthOfDate,
        gender: gender ?? this.gender,
        name: name ?? this.name,
        password: password ?? this.password,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{
      'name': name,
      'password': password,
      'phoneNumber': '+2$phoneNumber',
      'gender': gender,
      'birthOfDate': birthOfDate.toIso8601String(),
      'fcm': PushNotifications.fcmToken ?? ''
    };
    if (email.isNotEmpty) m['email'] = email;
    return m;
  }
}
