import 'package:formz/formz.dart';
import 'package:home_cure/app/app.dart';

enum ConfirmPasswordValidator { notIdentical }

class ConfirmPassword extends FormzInput<String, ConfirmPasswordValidator> {
  ConfirmPassword.dirty(super.date, this.password) : super.dirty();
  const ConfirmPassword.pure(this.password) : super.pure('');
  String? errorText(ConfirmPasswordValidator? error) {
    // ignore: missing_enum_constant_in_switch
    switch (error) {
      case ConfirmPasswordValidator.notIdentical:
        return appLn10.passwordIsNotIdentical;
    }
    return null;
  }

  final String password;
  @override
  ConfirmPasswordValidator? validator(String value) {
    if (value != password) {
      return ConfirmPasswordValidator.notIdentical;
    }
    return null;
  }
}
