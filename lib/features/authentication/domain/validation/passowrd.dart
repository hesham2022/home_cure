import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/app/view/app.dart';
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
    if (isLogin == true) {
      if (error == PasswordValidationError.empty) {
        return appLn10.passwordShouldNotBeEmpty;
      } else {
        return appLn10.invalidPasword;
      }
    } else {
      switch (error) {
        case PasswordValidationError.empty:
          return appLn10.passwordShouldNotBeEmpty;

        case PasswordValidationError.short:
          return appLn10.passwordTooShort;

        case PasswordValidationError.contUpper:
          return appLn10.passwordSholdContainUpperCase;

        case PasswordValidationError.contLetter:
          return appLn10.passwordSholdContainAtLeastOneLetter;
        case PasswordValidationError.contDigit:
          return appLn10.passwordSholdContainOneNumber;
        case PasswordValidationError.contLower:
          return appLn10.passwordSholdContainLowerCase;
        case PasswordValidationError.contSpecial:
          return appLn10.passwordSholdContainSpecialCharacters;
      }
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
