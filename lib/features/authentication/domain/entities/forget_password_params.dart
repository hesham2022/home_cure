import 'dart:convert';

class ForgetPasswordParam {
  ForgetPasswordParam({
    required this.email,
  });
  factory ForgetPasswordParam.fromMap(Map<String, dynamic> json) =>
      ForgetPasswordParam(
        email: json['email'] as String,
      );
  factory ForgetPasswordParam.fromJson(String str) =>
      ForgetPasswordParam.fromMap(json.decode(str) as Map<String, dynamic>);
  final String email;

  ForgetPasswordParam copyWith({
    String? email,
  }) =>
      ForgetPasswordParam(
        email: email ?? this.email,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        'email': email,
      };
}
