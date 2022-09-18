import 'dart:convert';

class VerifyForgetPasswordParam {
  VerifyForgetPasswordParam({
    required this.token,
    required this.code,
  });
  factory VerifyForgetPasswordParam.fromJson(String source) =>
      VerifyForgetPasswordParam.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory VerifyForgetPasswordParam.fromMap(Map<String, dynamic> map) {
    return VerifyForgetPasswordParam(
      token: map['token'] as String,
      code: map['code'] as String,
    );
  }
  final String token;
  final String code;

  VerifyForgetPasswordParam copyWith({
    String? token,
    String? code,
  }) {
    return VerifyForgetPasswordParam(
      token: token ?? this.token,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'code': code,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'VerifyForgetPasswordParam(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerifyForgetPasswordParam && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
