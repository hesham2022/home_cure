import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/core/api_errors/app_error.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/entities/verify_password_params.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  signUpSucess
}

abstract class IAuthenticationRepository {
  IAuthenticationRepository({required this.apiConfig});
  final ApiClient apiConfig;

  StreamController<AuthenticationStatus> get controller;

  Stream<AuthenticationStatus> get status;

  Future<Either<AppError, void>> logIn(LoginParam loginParams);
  Future<Either<AppError, void>> logibProvider(LoginParam loginParams);

  Future<Either<AppError, void>> signIn(SignParam signParams);
  Future<Either<NetworkExceptions, String>> forgotPassword(
    ForgetPasswordParam forgetPasswordParam,
  );
  Future<Either<NetworkExceptions, String>> sendOtp();
  Future<Either<NetworkExceptions, String>> verifyForgetPasswordOtp(
    VerifyForgetPasswordParam verifyForgetPasswordParam,
  );
  Future<Either<NetworkExceptions, void>> verifyOtp(
    VerifyForgetPasswordParam verifyForgetPasswordParam,
  );
  Future<Either<NetworkExceptions, void>> resetPassword(
    ResetPasswordParams verifyForgetPasswordParam,
  );
  // Future<Either<NetworkExceptions, void>> updatePassword(
  //   UpdatePasswordParam updatePasswordParam,
  // );
  Future<void> logOut();

  void dispose() => controller.close();
}
