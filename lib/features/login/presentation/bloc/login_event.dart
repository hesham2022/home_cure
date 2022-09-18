import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
class LoginConfirmPasswordChanged extends LoginEvent {
  const LoginConfirmPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginPhoneNumberChanged extends LoginEvent {
  const LoginPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginGenderhanged extends LoginEvent {
  const LoginGenderhanged(this.gender);

  final String gender;

  @override
  List<Object> get props => [gender];
}

class LoginNameChanged extends LoginEvent {
  const LoginNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class ChangeErrorMessage extends LoginEvent {
  const ChangeErrorMessage(this.msg);

  final String msg;

  @override
  List<Object> get props => [msg];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginBirthChanged extends LoginEvent {
  const LoginBirthChanged(this.name);

  final DateTime name;

  @override
  List<Object> get props => [name];
}

class LoginProviderSubmitted extends LoginEvent {
  const LoginProviderSubmitted();
}

class LoginRegisterSubmitted extends LoginEvent {
  const LoginRegisterSubmitted();
}
