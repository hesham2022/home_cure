import 'package:formz/formz.dart';

enum NameValidationError { empty, short }

enum BurthValidator {
  invalid,
}

class Name extends FormzInput<String, NameValidationError> {
  Name.dirty([super.value = '']) : super.dirty();
  const Name.pure() : super.pure('');
  String? errorText(NameValidationError? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case NameValidationError.empty:
        return 'name should not be empty';

      case NameValidationError.short:
        return 'short name';
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
        return 'invalid date';
    }
    return null;
  }

  @override
  BurthValidator? validator(DateTime? value) {
    if (value == null) {
      return BurthValidator.invalid;
    }
    if (value.isAfter(DateTime.now())) {
      return BurthValidator.invalid;
    }

    return null;
  }
}
