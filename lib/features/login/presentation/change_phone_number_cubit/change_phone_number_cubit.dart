import 'package:bloc/bloc.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/entities/verify_password_params.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_cubit/change_phone_number_state.dart';

class ChangePhoneNumberCubit extends Cubit<ChangePhoneNumberState> {
  ChangePhoneNumberCubit({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(ChangePhoneNumberStateIntial());
  final IAuthenticationRepository _authenticationRepository;
  Future<void> changePhoneNumber(ForgetPasswordParam param) async {
    emit(ChangePhoneNumberStateLoading());
    final result = await _authenticationRepository.changePhoneNumber(param);
    result.fold(
      (l) => emit(ChangePhoneNumberStateError(l)),
      (r) => emit(
        ChangePhoneNumberStateChangePhoneNumberTokenLoaded(r, param.email),
      ),
    );
  }

  Future<void> verifyChangePhoneNumberOtp(
    VerifyForgetPasswordParam param,
  ) async {
    emit(ChangePhoneNumberStateLoading());
    final result =
        await _authenticationRepository.verifyChangePhoneNumberOtp(param);
    result.fold(
      (l) => emit(ChangePhoneNumberStateError(l)),
      (r) => emit(ChangePhoneNumberStateResetTokenLoaded(r)),
    );
  }

  Future<void> resetPassword(ResetPasswordParams param) async {
    emit(ChangePhoneNumberStateLoading());
    final result = await _authenticationRepository.resetPhoneNumber(param);
    result.fold(
      (l) => emit(ChangePhoneNumberStateError(l)),
      (r) => emit(ChangePhoneNumberStateResetPasswordSuccess()),
    );
  }
}
