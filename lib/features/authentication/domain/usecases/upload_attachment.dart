import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_attachment_params.dart';
import 'package:home_cure/features/authentication/domain/entities/user.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_user.dart';

class UploadUserAttachments extends UseCase<User, UploadAttachmentParams> {
  UploadUserAttachments(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(
    UploadAttachmentParams params,
  ) async {
    return repository.uploadUserAttatchment(params);
  }
}
