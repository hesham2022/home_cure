import 'package:equatable/equatable.dart';

class AgoraToken extends Equatable {
  const AgoraToken({
    required this.token,
    required this.uid,
  });

  final String token;
  final int uid;

  AgoraToken copyWith({
    String? token,
    int? uid,
  }) {
    return AgoraToken(
      token: token ?? this.token,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [token, uid];
}
