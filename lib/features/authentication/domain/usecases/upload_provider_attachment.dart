import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/authentication/domain/entities/ulpoad_provider_attachments_params.dart';
import 'package:home_cure/features/authentication/domain/entities/user.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_user.dart';

class UploadProviderAttachments
    extends UseCase<User, UploadPorviderAttachmentParams> {
  UploadProviderAttachments(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(
    UploadPorviderAttachmentParams params,
  ) async {
    return repository.uploadProviderAttatchment(params);
  }
}

class DeleteProviderAttachments extends UseCase<User, String> {
  DeleteProviderAttachments(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(
    String params,
  ) async {
    print('id');
    print(params);
    return repository.deleteProviderAttatchment(params);
  }
}
class DeleteUserAttachments extends UseCase<User, String> {
  DeleteUserAttachments(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(
    String params,
  ) async {
    print('id');
    print(params);
    return repository.deleteUserAttatchment(params);
  }
}
