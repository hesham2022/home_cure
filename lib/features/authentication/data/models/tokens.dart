
class Tokens {
  Tokens({
    required this.access,
    required this.refresh,
  });
  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: Access.fromJson(json['access'] as Map<String, dynamic>),
        refresh: Access.fromJson(json['refresh'] as Map<String, dynamic>),
      );

  Access access;
  Access refresh;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'access': access.toJson(),
        'refresh': refresh.toJson(),
      };
}

class Access {
  Access({
    required this.token,
    required this.expires,
  });
  factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json['token'] as String,
        expires: DateTime.parse(json['expires'] as String),
      );

  String token;
  DateTime expires;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'expires': expires.toIso8601String(),
      };
}
