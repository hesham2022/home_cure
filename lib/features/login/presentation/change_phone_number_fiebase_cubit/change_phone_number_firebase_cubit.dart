import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_fiebase_cubit/change_phone_number_firebase_state.dart';

class ChangePhoneNumberFirebaseCubit
    extends Cubit<ChangePhoneNumberFirebaseState> {
  ChangePhoneNumberFirebaseCubit({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(ChangePhoneNumberFirebaseStateIntial());
  final IAuthenticationRepository _authenticationRepository;
  String? verificationCode;

  Future<void> changePhoneNumber(ForgetPasswordParam param) async {
    emit(ChangePhoneNumberFirebaseStateLoading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2${param.email}',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        emit(ChangePhoneNumberFirebaseStateError(NetworkExceptions(e)));
      },
      codeSent: (String? verficationID, int? resendToken) {
        verificationCode = verficationID;
        emit(
          ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded(
            param.email,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationCode = verificationID;
      },
    );
  }

  Future<void> resetPassword(ResetPasswordParams param) async {
    emit(ChangePhoneNumberFirebaseStateLoading());
    final result =
        await _authenticationRepository.resetPhoneNumberFiebase(param);
    result.fold(
      (l) => emit(ChangePhoneNumberFirebaseStateError(l)),
      (r) => emit(ChangePhoneNumberFirebaseStateResetPasswordSuccess()),
    );
  }
}
