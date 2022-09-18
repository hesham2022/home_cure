import 'package:home_cure/features/authentication/data/models/tokens.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';

class SignUpResponseModel extends SignUpResponse {
  const SignUpResponseModel({
    required super.tokens,
    required super.user,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return SignUpResponseModel(
      tokens: Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
  @override
  List<Object?> get props => [tokens, user];
}
