import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/home/data/models/our_doctors_response.dart';

abstract class IUserRemote {
  IUserRemote(this.apiConfig);
  final ApiClient apiConfig;

  Future<User> getMe();
  Future<User> getUser(String id);
  Future<User> getProvider(String id);

  Future<List<User>> getOurDoctors();

  Future<User> updateUser(Map<String, dynamic> body);
  Future<User> updateProvider(Map<String, dynamic> body);

  Future<User> updateUserDetails(Map<String, dynamic> body);
  Future<User> uploadAttachment(Map<String, dynamic> body);
  Future<User> uploadProviderAttachment(Map<String, dynamic> body);
  Future<User> deleteProviderAttachment(String id);
  Future<User> deleteUserAttachment(String id);

  Future<User> uploadUserPhoto(Map<String, dynamic> body);
  Future<User> uploadProviderPhoto(Map<String, dynamic> body);
}

class UserRemote extends IUserRemote {
  UserRemote(super.apiConfig);

  @override
  Future<User> getMe() async {
    final response = await apiConfig.get(kGetMe);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> getUser(String id) async {
    final response = await apiConfig.get(kUsers + id);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> getProvider(String id) async {
    final response = await apiConfig.get(kProviders + id);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> updateUser(Map<String, dynamic> body) async {
    print(body);
    final response = await apiConfig.patch(kUpdateMe, body: body);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> updateProvider(Map<String, dynamic> body) async {
    final response = await apiConfig.patch(kUpadetProvider, body: body);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> updateUserDetails(Map<String, dynamic> body) async {
    print(body);
    final response = await apiConfig
        .patch(kUpdateMe, body: <String, dynamic>{'details': body});
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> uploadAttachment(Map<String, dynamic> body) async {
    final response = await apiConfig.upload(kUUploadAttachment, body: body);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    return userResult;
  }

  @override
  Future<User> uploadUserPhoto(Map<String, dynamic> body) async {
    final response = await apiConfig.upload(kUUploadUserPhoto, body: body);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> uploadProviderPhoto(Map<String, dynamic> body) async {
    final response = await apiConfig.upload(kUploadProviderPhoto, body: body);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data);
    return userResult;
  }

  @override
  Future<User> uploadProviderAttachment(Map<String, dynamic> body) async {
    final response =
        await apiConfig.upload(kUploadProviderAttachment, body: body);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    return userResult;
  }

  @override
  Future<User> deleteProviderAttachment(String id) async {
    print('id param$id');
    final response = await apiConfig
        .patch(kDeleteProviderAttachment, body: <String, dynamic>{'id': id});
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    return userResult;
  }

  @override
  Future<User> deleteUserAttachment(String id) async {
    print('id param$id');
    final response = await apiConfig
        .patch(kDeleteUserAttachment, body: <String, dynamic>{'id': id});
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    return userResult;
  }

  @override
  Future<List<User>> getOurDoctors() async {
    final response = await apiConfig.get(kProviders);
    final data = response.data as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    final userResult = OurDoctorsResponse.fromJson(data);
    return userResult.results;
  }
}
