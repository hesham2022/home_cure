import 'package:home_cure/core/api_errors/network_exceptions.dart';

abstract class VerifyOtpFirebaseState {}

class VerifyOtpFirebaseStateIntial extends VerifyOtpFirebaseState {}

class VerifyOtpFirebaseStateLoading extends VerifyOtpFirebaseState {}

class VerifyOtpFirebaseStateError extends VerifyOtpFirebaseState {
  VerifyOtpFirebaseStateError(this.error);
  final NetworkExceptions error;
}

class VerifyOtpFirebaseStateTokenLoaded extends VerifyOtpFirebaseState {
  VerifyOtpFirebaseStateTokenLoaded(this.token);
  final String token;
}

class VerifyOtpFirebaseStatedSuccess extends VerifyOtpFirebaseState {}
