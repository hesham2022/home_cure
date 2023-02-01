import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/utils/validation_regx.dart';

enum EmailValidationError { empty, inValid, homecure, notContainHomecure }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    return emailValidator(value!).fold((l) => l, (r) => null);
  }

  String? errorText(EmailValidationError? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case EmailValidationError.empty:
        return appLn10.emailSholdNotBeEmpty;

      case EmailValidationError.inValid:
        return appLn10.invalidEmail;
      case EmailValidationError.homecure:
        return appLn10.homecureEmail;
    }
    return null;
  }
}

Either<EmailValidationError, void> emailValidator(String value) {
  if (value.isEmpty) return const Right(null);
  print(value);

  if (value.contains('@homecure.com')) {
    print('email @homecure');
    return const Left(EmailValidationError.homecure);
  }
  if (!ValidationsPatterns.emailValidate.hasMatch(value)) {
    return const Left(EmailValidationError.inValid);
  }
  return const Right(null);
}

class EmailOrPhone extends FormzInput<String, EmailValidationError> {
  const EmailOrPhone.pure() : super.pure('');
  const EmailOrPhone.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    return emailOrPhoneValidator(value!).fold((l) => l, (r) => null);
  }

  bool get isEmail => value.contains('@');
  String? errorText(EmailValidationError? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case EmailValidationError.empty:
        return appLn10.phoneNumberSholdNotBeEmpty;

      case EmailValidationError.inValid:
        return appLn10.invalidPhoneNumber;
      case EmailValidationError.notContainHomecure:
        return 'your client ! please using phone number';
    }
    return null;
  }
}

Either<EmailValidationError, void> emailOrPhoneValidator(String value) {
  const patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final phoneRegx = RegExp(patttern);
  if (value.isEmpty) {
    return const Left(EmailValidationError.empty);
  }
  if (value.contains('@')) {
    // return const Left(EmailValidationError.inValid);
    final isProviderLogin = value.split('@').last == 'homecure.com';
    if (isProviderLogin == false) {
      print(isProviderLogin);

      return const Left(EmailValidationError.notContainHomecure);
    }
  }
  //  else if (!ValidationsPatterns.emailValidate.hasMatch(value) &&
  //     !phoneRegx.hasMatch(value)) {
  //   return const Left(EmailValidationError.inValid);
  // }
  return const Right(null);
}
