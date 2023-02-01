import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/utils/catch_async.dart';
import 'package:home_cure/features/authentication/data/datasources/user_remote.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/ulpoad_provider_attachments_params.dart';
import 'package:home_cure/features/authentication/domain/entities/update_user_params.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_attachment_params.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_user_photo_params.dart';
import 'package:home_cure/features/authentication/domain/entities/user.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_user.dart';

class UserRepository extends IUserRepository {
  UserRepository(this.userRemote);
  final IUserRemote userRemote;

  @override
  Future<Either<NetworkExceptions, User>> getMe() =>
      guardFuture<User>(userRemote.getMe);
  @override
  Future<Either<NetworkExceptions, User>> getUser(String id) =>
      guardFuture<User>(() => userRemote.getUser(id));
  @override
  Future<Either<NetworkExceptions, User>> getProvider(String id) =>
      guardFuture<User>(() => userRemote.getProvider(id));
  @override
  Future<Either<NetworkExceptions, User>> updateUser(UpdateUserParams params) {
    return guardFuture<User>(() => userRemote.updateUser(params.toMap()));
  }

  @override
  Future<Either<NetworkExceptions, User>> updateProvider(
    UpdateUserParams params,
  ) {
    return guardFuture<User>(() => userRemote.updateProvider(params.toMap()));
  }

  @override
  Future<Either<NetworkExceptions, User>> updateUserDeatils(Details params) {
    return guardFuture<User>(
      () => userRemote.updateUserDetails(params.toJson()),
    );
  }

  @override
  Future<Either<NetworkExceptions, User>> uploadUserAttatchment(
    UploadAttachmentParams params,
  ) async {
    return guardFuture<User>(
      () async => userRemote.uploadAttachment(await params.toMap()),
    );
  }

  @override
  Future<Either<NetworkExceptions, User>> uploadUserPhoto(
    UploadUserPhotoParams params,
  ) {
    return guardFuture<User>(
      () async => userRemote.uploadUserPhoto(await params.toMap()),
    );
  }

  @override
  Future<Either<NetworkExceptions, User>> uploadProviderPhoto(
    UploadUserPhotoParams params,
  ) {
    return guardFuture<User>(
      () async => userRemote.uploadProviderPhoto(await params.toMap()),
    );
  }

  @override
  Future<Either<NetworkExceptions, User>> deleteProviderAttatchment(
    String params,
  ) {
    return guardFuture<User>(
      () async => userRemote.deleteProviderAttachment(params),
    );
  }

  @override
  Future<Either<NetworkExceptions, User>> deleteUserAttatchment(
    String params,
  ) {
    return guardFuture<User>(
      () async => userRemote.deleteUserAttachment(params),
    );
  }

  @override
  Future<Either<NetworkExceptions, User>> uploadProviderAttatchment(
    UploadPorviderAttachmentParams params,
  ) async {
    return guardFuture<User>(
      () async => userRemote.uploadProviderAttachment(await params.toMap()),
    );
  }

  @override
  Future<Either<NetworkExceptions, List<User>>> getOurDoctors() async {
    return guardFuture<List<User>>(
      () async => userRemote.getOurDoctors(),
    );
  }
}
