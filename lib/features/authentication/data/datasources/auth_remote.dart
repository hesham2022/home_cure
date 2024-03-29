import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/features/authentication/data/models/signup_response_mdeol.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';

abstract class IAuthRemotDataSource {
  IAuthRemotDataSource(this.apiClient);
  final ApiClient apiClient;
//firebase
  Future<SignUpResponse?> login(Map<String, dynamic> body);
  Future<SignUpResponse?> loginProvider(Map<String, dynamic> body);

  Future<SignUpResponse?> signUp(Map<String, dynamic> body);
  Future<void> logoOtt();
  Future<String> forgotPassword(Map<String, dynamic> body);
  Future<String> forgotPasswordFirebase(Map<String, dynamic> body);

  Future<String> changePhoneNumber(Map<String, dynamic> body);

  Future<String> verifyForgotPassword(Map<String, dynamic> body);

  Future<String> verifyChangePhoneNumber(Map<String, dynamic> body);

  Future<void> verifyOtp(Map<String, dynamic> body);
  Future<void> verifyOtpFirebase();

  Future<void> resetPassword(Map<String, dynamic> body);
  Future<void> resetPasswordFirebase(Map<String, dynamic> body);

  Future<void> resetPhoneNumber(Map<String, dynamic> body);
  Future<void> resetPhoneNumberFiebase(Map<String, dynamic> body);

  Future<String> sendOtp();
}

class AuthRemotDataSource extends IAuthRemotDataSource {
  AuthRemotDataSource(super.apiConfig);

  @override
  Future<SignUpResponse?> login(Map<String, dynamic> body) async {
    final response = await apiClient.post(kLogin, body: body);
    final loginResponse =
        SignUpResponseModel.fromJson(response.data as Map<String, dynamic>);

    return loginResponse;
  }

  @override
  Future<SignUpResponse?> loginProvider(Map<String, dynamic> body) async {
    final response = await apiClient.post(kProviderLogin, body: body);
    final loginResponse =
        SignUpResponseModel.fromJson(response.data as Map<String, dynamic>);
    return loginResponse;
  }

  @override
  Future<void> logoOtt() {
    throw UnimplementedError();
  }

  @override
  Future<SignUpResponse?> signUp(Map<String, dynamic> body) async {
    final response = await apiClient.post(kRegister, body: body);

    final signInResponse =
        SignUpResponseModel.fromJson(response.data as Map<String, dynamic>);

    return signInResponse;
  }

  @override
  Future<String> forgotPassword(Map<String, dynamic> body) async {
    final response = await apiClient.post(kForgotPassword, body: body);
    return response.data['forgetPasswordToken'] as String;
  }

  @override
  Future<String> forgotPasswordFirebase(Map<String, dynamic> body) async {
    final response = await apiClient.post(kForgotPasswordFirebase, body: body);
    return response.data['forgetPasswordToken'] as String;
  }

  @override
  Future<String> changePhoneNumber(Map<String, dynamic> body) async {
    final response = await apiClient.post(kChangePhoneNumber, body: body);
    return response.data['forgetPasswordToken'] as String;
  }

  @override
  Future<String> sendOtp() async {
    final response = await apiClient.post(kSendOtp);
    return response.data['verifyOtpToken'] as String;
  }

  @override
  Future<String> verifyForgotPassword(Map<String, dynamic> body) async {
    final response = await apiClient.post(kverifyForgotPassword, body: body);
    return response.data['resetPasswordToken'] as String;
  }

  @override
  Future<String> verifyChangePhoneNumber(Map<String, dynamic> body) async {
    final response = await apiClient.post(kverifyChangePhoneNumber, body: body);
    return response.data['resetPasswordToken'] as String;
  }

  @override
  Future<void> verifyOtp(Map<String, dynamic> body) async {
    await apiClient.post(kVerifyOtp, body: body);
  }

  @override
  Future<void> verifyOtpFirebase() async {
    await apiClient.post(kVerifyOtpFirebase);
  }

  @override
  Future<void> resetPassword(Map<String, dynamic> body) async {
    await apiClient.post(kResetPassword, body: body);
  }

  @override
  Future<void> resetPasswordFirebase(Map<String, dynamic> body) async {
    await apiClient.post(kResetPasswordFirebase, body: body);
  }

  @override
  Future<void> resetPhoneNumber(Map<String, dynamic> body) async {
    await apiClient.post(kResetPhoneNumber, body: body);
  }

  @override
  Future<void> resetPhoneNumberFiebase(Map<String, dynamic> body) async {
    await apiClient.post(kResetPhoneNumberFirebase, body: body);
  }
}
