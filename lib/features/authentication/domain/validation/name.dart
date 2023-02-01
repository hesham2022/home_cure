import 'package:formz/formz.dart';
import 'package:home_cure/app/view/app.dart';

enum NameValidationError { empty, short }

enum BurthValidator { outOfAge, invalid, empty }

class Name extends FormzInput<String, NameValidationError> {
  Name.dirty([super.value = '']) : super.dirty();
  const Name.pure() : super.pure('');
  String? errorText(NameValidationError? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case NameValidationError.empty:
        return appLn10.nameSholdNotBeEmpty;

      case NameValidationError.short:
        return appLn10.shorName;
    }
    return null;
  }

  @override
  NameValidationError? validator(String? value) {
    if (value!.isEmpty) {
      return NameValidationError.empty;
    } else if (value.length < 4) {
      return NameValidationError.short;
    }

    return null;
  }
}

class Birth extends FormzInput<DateTime?, BurthValidator> {
  Birth.dirty(super.date) : super.dirty();
  const Birth.pure() : super.pure(null);
  String? errorText(BurthValidator? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case BurthValidator.invalid:
        return appLn10.invalidDate;
      case BurthValidator.empty:
        return appLn10.emptyDate;
      case BurthValidator.outOfAge:
        return 'You should be at least 18 year old';
    }
    return null;
  }

  @override
  BurthValidator? validator(DateTime? value) {
    if (value == null) {
      return BurthValidator.empty;
    }
    if (value.isAfter(DateTime.now())) {
      return BurthValidator.invalid;
    }
    if ((DateTime.now().difference(value).inDays / 365) < 18) {
      return BurthValidator.outOfAge;
    }
    return null;
  }
}
