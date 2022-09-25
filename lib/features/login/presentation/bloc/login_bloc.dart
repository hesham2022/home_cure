import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/features/authentication/domain/entities/login_param.dart';
import 'package:home_cure/features/authentication/domain/entities/sign_param.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/authentication/domain/validation/confirm_password.dart';
import 'package:home_cure/features/authentication/domain/validation/email.dart';
import 'package:home_cure/features/authentication/domain/validation/gender.dart';
import 'package:home_cure/features/authentication/domain/validation/name.dart';
import 'package:home_cure/features/authentication/domain/validation/passowrd.dart';
import 'package:home_cure/features/authentication/domain/validation/phone_number.dart';
import 'package:home_cure/features/login/presentation/bloc/login_event.dart';
import 'package:home_cure/features/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);

    on<LoginSubmitted>(_onSubmitted);
    on<ChangeErrorMessage>(_onChangeErrorMessage);
    on<ResetFields>(_onResetFields);
    on<LoginPhoneNumberChanged>(_onPhoneNumberChanged);

    on<LoginWithEmail>(_onLoginWithEmail);
    on<LoginEmailOrPhoneChanged>(
      (event, emit) {
        final username = EmailOrPhone.dirty(event.username);

        emit(
          state.copyWith(
            emailOrPhone: username,
            status: Formz.validate(
              [
                state.password,
                username,
              ],
            ),
          ),
        );
      },
    );
  }

  final IAuthenticationRepository _authenticationRepository;
  void _onChangeErrorMessage(
    ChangeErrorMessage event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(failureMessege: event.msg));
  }

  void _onPhoneNumberChanged(
    LoginPhoneNumberChanged event,
    Emitter<LoginState> emit,
  ) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate([state.password, phoneNumber]),
      ),
    );
  }

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Email.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        status: Formz.validate(
          [
            state.password,
            username,
          ],
        ),
      ),
    );
  }

  void _onLoginWithEmail(
    LoginWithEmail event,
    Emitter<LoginState> emit,
  ) {
    if (event.loginWithEmail) {
      const phoneNumber = PhoneNumber.pure();
      emit(
        state.copyWith(
          phoneNumber: phoneNumber,
          loginWithEmail: event.loginWithEmail,
        ),
      );
    } else {
      const email = Email.pure();
      emit(
        state.copyWith(
          username: email,
          loginWithEmail: event.loginWithEmail,
        ),
      );
    }
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          password,
          state.emailOrPhone,
        ]),
      ),
    );
    // if (state.loginWithEmail) {
    //   emit(
    //     state.copyWith(
    //       password: password,
    //       status: Formz.validate([
    //         password,
    //         state.username,
    //       ]),
    //     ),
    //   );
    // } else {
    //   emit(
    //     state.copyWith(
    //       password: password,
    //       status: Formz.validate([
    //         password,
    //         state.phoneNumber,
    //       ]),
    //     ),
    //   );
    // }
  }

  String phoneNumberFormatter(String value) {
    if (!value.startsWith('+') && value.startsWith('2')) return '+$value';
    if (!value.startsWith('+2')) return '+2$value';

    return value;
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final isProvideLogin = state.emailOrPhone.isEmail &&
          state.emailOrPhone.value.split('@').last == 'homecure.com';
      print(state.emailOrPhone.value.split('@').last);
      // try {
      final result = isProvideLogin
          ? await _authenticationRepository.logibProvider(
              LoginParam(
                password: state.password.value,
                email: state.emailOrPhone.value,
                // fcm: kFcm,
              ),
            )
          : await _authenticationRepository.logIn(
              LoginParam(
                password: state.password.value,
                email: state.emailOrPhone.isEmail
                    ? state.emailOrPhone.value
                    : null,
                phoneNumber: !state.emailOrPhone.isEmail
                    ? phoneNumberFormatter(state.emailOrPhone.value)
                    : null,
                // fcm: kFcm,
              ),
            );
      // ignore: cascade_invocations
      result.fold(
        (l) => emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            failureMessege: l.errorMessege,
          ),
        ),
        (r) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
      );
    }
  }

  void _onResetFields(
    ResetFields event,
    Emitter<LoginState> emit,
  ) {
    emit(
      const LoginState(),
    );
  }
}

class SingUpBloc extends Bloc<LoginEvent, LoginState> {
  SingUpBloc({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginConfirmPasswordChanged>(_onConfirmPasswordChanged);

    //LoginConfirmPasswordChanged
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginNameChanged>(_onNameChanged);
    on<LoginGenderhanged>(_onGenderChanged);
    on<LoginPhoneNumberChanged>(_onPhoneNumberChanged);
    on<LoginBirthChanged>(_onBirthChanged);

    on<LoginRegisterSubmitted>(_onRegisterSubmitted);
    on<LoginSubmitted>(_onSubmitted);
    on<ChangeErrorMessage>(_onChangeErrorMessage);
    on<ResetFields>(_onResetFields);
  }

  final IAuthenticationRepository _authenticationRepository;
  void _onChangeErrorMessage(
    ChangeErrorMessage event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(failureMessege: event.msg));
  }

  void _onResetFields(
    ResetFields event,
    Emitter<LoginState> emit,
  ) {
    emit(
      const LoginState(),
    );
  }

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Email.dirty(event.username);

    emit(
      state.copyWith(
        username: username,
        status: Formz.validate(
          [
            state.password,
            username,
            state.gender,
            state.name,
            state.phoneNumber
          ],
        ),
      ),
    );
  }

  void _onNameChanged(
    LoginNameChanged event,
    Emitter<LoginState> emit,
  ) {
    final name = Name.dirty(event.name);
//     print(
//       '''
// name $name is ${name.valid}
// birth ${state.birth} is ${state.birth.valid}
// emil ${state.username} is ${state.username.valid}
// gender ${state.gender} is ${state.gender.valid}
// phoneNumber ${state.phoneNumber} is ${state.phoneNumber.valid}
// password ${state.password} is ${state.password.valid}

// ''',
//     );
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([
          state.password,
          state.username,
          state.gender,
          name,
          state.birth,
          state.phoneNumber
        ]),
      ),
    );
  }

  void _onConfirmPasswordChanged(
    LoginConfirmPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final name = ConfirmPassword.dirty(event.password, state.password.value);
    emit(
      state.copyWith(
        confirmPassword: name,
        status: Formz.validate([
          state.password,
          state.username,
          state.gender,
          state.birth,
          state.name,
          state.phoneNumber
        ]),
      ),
    );
  }

  void _onBirthChanged(
    LoginBirthChanged event,
    Emitter<LoginState> emit,
  ) {
    final birth = Birth.dirty(event.name);
    emit(
      state.copyWith(
        birth: birth,
        status: Formz.validate([
          state.password,
          state.username,
          state.gender,
          state.name,
          birth,
          state.phoneNumber
        ]),
      ),
    );
  }

  void _onPhoneNumberChanged(
    LoginPhoneNumberChanged event,
    Emitter<LoginState> emit,
  ) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate([
          state.password,
          state.username,
          state.gender,
          state.name,
          state.birth,
          phoneNumber
        ]),
      ),
    );
  }

  void _onGenderChanged(
    LoginGenderhanged event,
    Emitter<LoginState> emit,
  ) {
    final gender = Gender.dirty(event.gender);
    emit(
      state.copyWith(
        gender: gender,
        status: Formz.validate([
          state.password,
          state.username,
          gender,
          state.name,
          state.birth,
          state.phoneNumber
        ]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          password,
          state.username,
          state.gender,
          state.name,
          state.birth,
          state.phoneNumber
        ]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      // try {
      final result = await _authenticationRepository.logIn(
        LoginParam(
          password: state.password.value,
          email: state.username.value,
          // fcm: kFcm,
        ),
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            failureMessege: l.errorMessege,
          ),
        ),
        (r) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
      );
    }
  }

  Future<void> _onRegisterSubmitted(
    LoginRegisterSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      // try {
      final result = await _authenticationRepository.signIn(
        SignParam(
          password: state.password.value,
          email: state.username.value,
          gender: state.gender.value,
          // fcm: kFcm,
          name: state.name.value,
          phoneNumber: state.phoneNumber.value,
          birthOfDate: state.birth.value!,
        ),
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            failureMessege: l.errorMessege,
          ),
        ),
        (r) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
      );
    }
  }
}
