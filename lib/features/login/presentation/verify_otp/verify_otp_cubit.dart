import 'package:bloc/bloc.dart';
import 'package:home_cure/features/authentication/domain/entities/verify_password_params.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/login/presentation/verify_otp/verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(VerifyOtpStateIntial());
  final IAuthenticationRepository _authenticationRepository;
  Future<void> sendOtp() async {
    emit(VerifyOtpStateLoading());
    final result = await _authenticationRepository.sendOtp();
    result.fold(
      (l) => emit(VerifyOtpStateError(l)),
      (r) => emit(VerifyOtpStateTokenLoaded(r)),
    );
  }

  Future<void> verifyOtp(VerifyForgetPasswordParam param) async {
    emit(VerifyOtpStateLoading());
    final result = await _authenticationRepository.verifyOtp(param);
    result.fold(
      (l) => emit(VerifyOtpStateError(l)),
      (r) => emit(VerifyOtpStatedSuccess()),
    );
  }
}
