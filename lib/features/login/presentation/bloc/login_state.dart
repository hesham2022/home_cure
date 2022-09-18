import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/features/authentication/domain/validation/confirm_password.dart';
import 'package:home_cure/features/authentication/domain/validation/email.dart';
import 'package:home_cure/features/authentication/domain/validation/gender.dart';
import 'package:home_cure/features/authentication/domain/validation/name.dart';
import 'package:home_cure/features/authentication/domain/validation/passowrd.dart';
import 'package:home_cure/features/authentication/domain/validation/phone_number.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Email.pure(),
    this.password = const Password.pure(),
    this.name = const Name.pure(),
    this.gender = const Gender.pure(),
    this.birth = const Birth.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.confirmPassword = const ConfirmPassword.pure(''),
    this.failureMessege = '',
  });
  final FormzStatus status;
  final Email username;
  final Password password;
  final Name name;
  final Birth birth;
  final ConfirmPassword confirmPassword;

  final PhoneNumber phoneNumber;
  final Gender gender;

  final String failureMessege;

  LoginState copyWith({
    FormzStatus? status,
    Email? username,
    Password? password,
    Name? name,
    Gender? gender,
    PhoneNumber? phoneNumber,
    Birth? birth,
    ConfirmPassword? confirmPassword,
    String? failureMessege,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      failureMessege: failureMessege ?? this.failureMessege,
      birth: birth ?? this.birth,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        username,
        password,
        name,
        phoneNumber,
        gender,
        failureMessege,
        birth,
        confirmPassword
      ];
}
