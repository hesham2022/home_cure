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
