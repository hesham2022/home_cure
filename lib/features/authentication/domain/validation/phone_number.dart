import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/app/view/app.dart';

enum PhoneNumberValidationError { empty, inValid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNumberValidationError? validator(String? value) {
    return phoneNumberValidator(value!).fold((l) => l, (r) => null);
  }

  String? errorText(PhoneNumberValidationError? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case PhoneNumberValidationError.empty:
        return appLn10.phoneNumberSholdNotBeEmpty;

      case PhoneNumberValidationError.inValid:
        return appLn10.inavlidPhonenumber;
    }
    return null;
  }
}

Either<PhoneNumberValidationError, void> phoneNumberValidator(String value) {
  const patttern = r'(^(?:[+0]9)?(?:[+?0?0?966]+)?[0-9]{10,12}$)';
  final regExp = RegExp(patttern);
  if (value.isEmpty) {
    return const Left(PhoneNumberValidationError.empty);
  } else if (!regExp.hasMatch(value)) {
    return const Left(PhoneNumberValidationError.inValid);
  }
  return const Right(null);
}
