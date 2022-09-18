import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/features/authentication/data/models/signup_response_mdeol.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';

abstract class IAuthRemotDataSource {
  IAuthRemotDataSource(this.apiClient);
  final ApiClient apiClient;

  Future<SignUpResponse?> login(Map<String, dynamic> body);
  Future<SignUpResponse?> loginProvider(Map<String, dynamic> body);

  Future<SignUpResponse?> signUp(Map<String, dynamic> body);
  Future<void> logoOtt();
  Future<String> forgotPassword(Map<String, dynamic> body);
  Future<String> verifyForgotPassword(Map<String, dynamic> body);
  Future<void> resetPassword(Map<String, dynamic> body);
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
  Future<String> verifyForgotPassword(Map<String, dynamic> body) async {
    final response = await apiClient.post(kverifyForgotPassword, body: body);
    return response.data['resetPasswordToken'] as String;
  }

  @override
  Future<void> resetPassword(Map<String, dynamic> body) async {
    await apiClient.post(kResetPassword, body: body);
  }
}
