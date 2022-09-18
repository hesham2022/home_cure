import 'dart:convert';

class ResetPasswordParams {
  ResetPasswordParams({
    required this.token,
    required this.password,
  });
  factory ResetPasswordParams.fromJson(String source) =>
      ResetPasswordParams.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory ResetPasswordParams.fromMap(Map<String, dynamic> map) {
    return ResetPasswordParams(
      token: map['token'] as String,
      password: map['password'] as String,
    );
  }
  final String token;
  final String password;

  ResetPasswordParams copyWith({
    String? token,
    String? password,
  }) {
    return ResetPasswordParams(
      token: token ?? this.token,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ResetPasswordParams(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResetPasswordParams && other.token == token;
  }

  @override
  int get hashpassword => token.hashCode;
}
