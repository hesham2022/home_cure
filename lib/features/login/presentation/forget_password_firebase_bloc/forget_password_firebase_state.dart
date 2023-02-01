import 'package:home_cure/core/api_errors/network_exceptions.dart';

abstract class ForgetPasswordFirebaseState {}

class ForgetPasswordFirebaseStateIntial extends ForgetPasswordFirebaseState {}

class ForgetPasswordFirebaseStateLoading extends ForgetPasswordFirebaseState {}

class ForgetPasswordFirebaseStateError extends ForgetPasswordFirebaseState {
  ForgetPasswordFirebaseStateError(this.error);
  final NetworkExceptions error;
}

class ForgetPasswordFirebaseStateResetTokenLoaded
    extends ForgetPasswordFirebaseState {
  ForgetPasswordFirebaseStateResetTokenLoaded(this.token);
  final String token;
}

class ForgetPasswordFirebaseStateResetPasswordSuccess
    extends ForgetPasswordFirebaseState {}

class ForgetPasswordFirebaseStateForgetPasswordFirebaseTokenLoaded
    extends ForgetPasswordFirebaseState {
  ForgetPasswordFirebaseStateForgetPasswordFirebaseTokenLoaded(this.token);
  final String token;
}
class CodeSentState
    extends ForgetPasswordFirebaseState {
  CodeSentState(this.token);
  final String token;
}
