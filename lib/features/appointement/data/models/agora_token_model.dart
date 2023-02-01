import 'dart:convert';

import 'package:home_cure/features/appointement/domain/entities/agora_token.dart';

class AgoraTokenModel extends AgoraToken {
  const AgoraTokenModel({required super.token, required super.uid});
  factory AgoraTokenModel.fromJson(String source) =>
      AgoraTokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AgoraTokenModel.fromMap(Map<String, dynamic> map) {
    return AgoraTokenModel(
      token: map['token'] as String,
      uid: map['uid'] as int,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'uid': uid,
    };
  }

  String toJson() => json.encode(toMap());
}
// upcoming /!SECTION remove  not paid 
// remove competed from new
// bug after done in provide_detai
// bood type be Optional(),
// in adding in eldery care 
// starts review
// cancel and reasonx