import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/core/utils/validation_regx.dart';

enum PasswordValidationError {
  empty,
  short,
  contLower,
  contLetter,
  contUpper,
  contDigit,
  contSpecial
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();
  String? errorText(PasswordValidationError? error) {
    print(error);
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case PasswordValidationError.empty:
        return 'password should not be empty';

      case PasswordValidationError.short:
        return 'password too short';

      case PasswordValidationError.contUpper:
        return 'password should contain UpperCase ';

      case PasswordValidationError.contLetter:
        return 'password should contain at least one letter';
      case PasswordValidationError.contDigit:
        return 'password should contain at least one number';
      case PasswordValidationError.contLower:
        return 'password should contain LowerCase';
      case PasswordValidationError.contSpecial:
        return 'password should contain special characters';
    }
    return null;
  }

  @override
  PasswordValidationError? validator(String? value) {
    return passordValidator(value).fold((l) => l, (r) => null);
  }
}

Either<PasswordValidationError, void> passordValidator(String? value) {
  if (value!.isEmpty) {
    return const Left(PasswordValidationError.empty);
  } else if (!ValidationsPatterns.eightLength.hasMatch(value)) {
    return const Left(PasswordValidationError.short);
  } else if (!ValidationsPatterns.contDigit.hasMatch(value)) {
    return const Left(PasswordValidationError.contDigit);
  } else if (!ValidationsPatterns.conCharacter.hasMatch(value)) {
    return const Left(PasswordValidationError.contLetter);
  }
  // else if (!ValidationsPatterns.contLower.hasMatch(value)) {
  //   return const Left(PasswordValidationError.contLower);
  // }
  // else if (!ValidationsPatterns.contSpecialCh.hasMatch(value)) {
  //   return const Left(PasswordValidationError.contSpecial);
  // } else if (!ValidationsPatterns.contUpper.hasMatch(value)) {
  //   return const Left(PasswordValidationError.contUpper);
  // }
  return const Right(null);
}
