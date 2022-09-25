import 'package:home_cure/core/api_errors/network_exceptions.dart';

abstract class VerifyOtpState {}

class VerifyOtpStateIntial extends VerifyOtpState {}

class VerifyOtpStateLoading extends VerifyOtpState {}

class VerifyOtpStateError extends VerifyOtpState {
  VerifyOtpStateError(this.error);
  final NetworkExceptions error;
}

class VerifyOtpStateTokenLoaded extends VerifyOtpState {
  VerifyOtpStateTokenLoaded(this.token);
  final String token;
}

class VerifyOtpStatedSuccess extends VerifyOtpState {}
