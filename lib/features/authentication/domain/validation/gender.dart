import 'package:formz/formz.dart';

// ignore: camel_case_types
enum GenderValidationError { empty, short, invalid }

class Gender extends FormzInput<String, GenderValidationError> {
  Gender.dirty([super.value = '']) : super.dirty();
  const Gender.pure() : super.pure('male');
  @override
  GenderValidationError? validator(String? value) {
    if (value!.isEmpty) {
      return GenderValidationError.empty;
    } else if (value != 'male' && value != 'female') {
      return GenderValidationError.invalid;
    }
    return null;
  }
}
