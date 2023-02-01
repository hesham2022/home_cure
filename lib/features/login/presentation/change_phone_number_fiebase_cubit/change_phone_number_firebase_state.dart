import 'package:home_cure/core/api_errors/network_exceptions.dart';

abstract class ChangePhoneNumberFirebaseState {}

class ChangePhoneNumberFirebaseStateIntial
    extends ChangePhoneNumberFirebaseState {}

class ChangePhoneNumberFirebaseStateLoading
    extends ChangePhoneNumberFirebaseState {}

class ChangePhoneNumberFirebaseStateError
    extends ChangePhoneNumberFirebaseState {
  ChangePhoneNumberFirebaseStateError(this.error);
  final NetworkExceptions error;
}

class ChangePhoneNumberFirebaseStateResetTokenLoaded
    extends ChangePhoneNumberFirebaseState {
  ChangePhoneNumberFirebaseStateResetTokenLoaded(this.token);
  final String token;
}

class ChangePhoneNumberFirebaseStateResetPasswordSuccess
    extends ChangePhoneNumberFirebaseState {}

class ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded
    extends ChangePhoneNumberFirebaseState {
  ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded(
  
    this.phoneNumberFirebase,
  );
  final String phoneNumberFirebase;
}
