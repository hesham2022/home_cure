import 'package:home_cure/core/api_errors/network_exceptions.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordStateIntial extends ForgetPasswordState {}

class ForgetPasswordStateLoading extends ForgetPasswordState {}

class ForgetPasswordStateError extends ForgetPasswordState {
  ForgetPasswordStateError(this.error);
  final NetworkExceptions error;
}

class ForgetPasswordStateResetTokenLoaded extends ForgetPasswordState {
  ForgetPasswordStateResetTokenLoaded(this.token);
  final String token;
}

class ForgetPasswordStateResetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordStateForgetPasswordTokenLoaded extends ForgetPasswordState {
  ForgetPasswordStateForgetPasswordTokenLoaded(this.token);
  final String token;
}
