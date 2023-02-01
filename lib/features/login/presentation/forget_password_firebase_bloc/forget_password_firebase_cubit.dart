import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/entities/verify_password_params.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/login/presentation/forget_password_firebase_bloc/forget_password_firebase_state.dart';

class ForgetPasswordFirebaseCubit extends Cubit<ForgetPasswordFirebaseState> {
  ForgetPasswordFirebaseCubit({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(ForgetPasswordFirebaseStateIntial());
  final IAuthenticationRepository _authenticationRepository;
  String? verificationCode;
  String? phoneNumber;
  String? userId;
  String code = '';
  CodeSentState? codeSent;
  Future<void> forgetPasswordFirebase(ForgetPasswordParam param) async {
    emit(ForgetPasswordFirebaseStateLoading());
    phoneNumber = param.email;
    final result =
        await _authenticationRepository.forgotPasswordFirebase(param);
    result.fold(
      (l) => emit(ForgetPasswordFirebaseStateError(l)),
      (r) async {
        userId = r;
        emit(
          ForgetPasswordFirebaseStateForgetPasswordFirebaseTokenLoaded(
            param.email,
          ),
        );
        phoneNumber = '+2${param.email}';
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+2${param.email}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            // await FirebaseAuth.instance
            //     .signInWithCredential(credential)
            //     .then((value) async {
            //   if (value.user != null) {
            //     await verifyForgetPasswordFirebaseOtp(
            //       VerifyForgetPasswordParam(
            //         token: (state as CodeSentState).token,
            //         code: code,
            //       ),
            //     );
            //   }
            // });
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);

            emit(ForgetPasswordFirebaseStateError(NetworkExceptions(e)));
          },
          codeSent: (String? verficationID, int? resendToken) {
            verificationCode = verficationID;
            emit(
              CodeSentState(
                param.email,
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            verificationCode = verificationID;
          },
        );
      },
    );
  }

  Future<void> resendCode(ForgetPasswordParam param) async {
    emit(ForgetPasswordFirebaseStateLoading());

    emit(
      ForgetPasswordFirebaseStateForgetPasswordFirebaseTokenLoaded(
        param.email,
      ),
    );
    phoneNumber = param.email;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: param.email,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await FirebaseAuth.instance
        //     .signInWithCredential(credential)
        //     .then((value) async {
        //   if (value.user != null) {
        //     await verifyForgetPasswordFirebaseOtp(
        //       VerifyForgetPasswordParam(
        //         token: (state as CodeSentState).token,
        //         code: code,
        //       ),
        //     );
        //   }
        // });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);

        emit(ForgetPasswordFirebaseStateError(NetworkExceptions(e)));
      },
      codeSent: (String? verficationID, int? resendToken) {
        verificationCode = verficationID;
        emit(
          CodeSentState(
            param.email,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationCode = verificationID;
      },
    );
  }

  Future<void> verifyForgetPasswordFirebaseOtp(
    VerifyForgetPasswordParam param,
  ) async {
    emit(ForgetPasswordFirebaseStateLoading());
    try {
      await FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationCode!,
          smsCode: param.code,
        ),
      )
          .then((value) async {
        // value.credential.token;
        if (value.user != null) {
          emit(ForgetPasswordFirebaseStateResetTokenLoaded(userId ?? ''));
          // await resetPassword(
          //   ResetPasswordParams(
          //     password: phoneNumber!,
          //     token: 'state.token',
          //   ),
          // );
        }
      });
    } catch (e) {
      print(e.runtimeType);
      if (e is FirebaseAuthException) {
        if (e.message ==
            'The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.') {
          emit(
            ForgetPasswordFirebaseStateError(
              NetworkExceptions.notFound(appLn10.invalidcode),
            ),
          );
        } else {
          emit(
            ForgetPasswordFirebaseStateError(
              NetworkExceptions.notFound(e.message ?? 'invaid data'),
            ),
          );
        }
      } else {
        emit(
          ForgetPasswordFirebaseStateError(
            NetworkExceptions(e),
          ),
        );
      }
    }
    // final result =
    //     await _authenticationRepository.verifyForgetPasswordFirebaseOtp(param);
    // result.fold(
    //   (l) => emit(ForgetPasswordFirebaseStateError(l)),
    //   (r) => emit(ForgetPasswordFirebaseStateResetTokenLoaded(r)),
    // );
  }

  Future<void> resetPassword(ResetPasswordParams param) async {
    emit(ForgetPasswordFirebaseStateLoading());
    final result = await _authenticationRepository.resetPasswordFirebase(param);
    result.fold(
      (l) => emit(ForgetPasswordFirebaseStateError(l)),
      (r) => emit(ForgetPasswordFirebaseStateResetPasswordSuccess()),
    );
  }
}
