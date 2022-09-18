import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/entities/ulpoad_provider_attachments_params.dart';
import 'package:home_cure/features/authentication/domain/entities/update_user_params.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_attachment_params.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_user_photo_params.dart';

// ignore: one_member_abstracts
abstract class IUserRepository {
  Future<Either<NetworkExceptions, User>> getMe();
  Future<Either<NetworkExceptions, User>> getUser(String id);

  Future<Either<NetworkExceptions, User>> updateUser(UpdateUserParams params);
  Future<Either<NetworkExceptions, User>> updateProvider(
    UpdateUserParams params,
  );

  Future<Either<NetworkExceptions, User>> updateUserDeatils(Details params);
  Future<Either<NetworkExceptions, User>> uploadUserAttatchment(
    UploadAttachmentParams params,
  );
  Future<Either<NetworkExceptions, User>> uploadProviderAttatchment(
    UploadPorviderAttachmentParams params,
  );
  Future<Either<NetworkExceptions, User>> uploadUserPhoto(
    UploadUserPhotoParams params,
  );
  Future<Either<NetworkExceptions, User>> uploadProviderPhoto(
    UploadUserPhotoParams params,
  );
}
