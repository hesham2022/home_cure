import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/core/utils/validation_regx.dart';

enum EmailValidationError { empty, inValid }

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
        return 'password should not be empty';

      case EmailValidationError.inValid:
        return 'inValid email';
    }
    return null;
  }
}

Either<EmailValidationError, void> emailValidator(String value) {
  if (value.isEmpty) {
    return const Left(EmailValidationError.empty);
  } else if (!ValidationsPatterns.emailValidate.hasMatch(value)) {
    return const Left(EmailValidationError.inValid);
  }
  return const Right(null);
}
