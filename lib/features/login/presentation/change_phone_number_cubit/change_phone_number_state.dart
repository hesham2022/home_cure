import 'package:home_cure/core/api_errors/network_exceptions.dart';

abstract class ChangePhoneNumberState {}

class ChangePhoneNumberStateIntial extends ChangePhoneNumberState {}

class ChangePhoneNumberStateLoading extends ChangePhoneNumberState {}

class ChangePhoneNumberStateError extends ChangePhoneNumberState {
  ChangePhoneNumberStateError(this.error);
  final NetworkExceptions error;
}

class ChangePhoneNumberStateResetTokenLoaded extends ChangePhoneNumberState {
  ChangePhoneNumberStateResetTokenLoaded(this.token);
  final String token;
}

class ChangePhoneNumberStateResetPasswordSuccess
    extends ChangePhoneNumberState {}

class ChangePhoneNumberStateChangePhoneNumberTokenLoaded
    extends ChangePhoneNumberState {
  ChangePhoneNumberStateChangePhoneNumberTokenLoaded(
      this.token, this.phoneNumber);
  final String token;
  final String phoneNumber;
}
