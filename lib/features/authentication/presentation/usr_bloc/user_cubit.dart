import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/entities/ulpoad_provider_attachments_params.dart';
import 'package:home_cure/features/authentication/domain/entities/update_user_params.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_attachment_params.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_user_photo_params.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_me.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_user.dart';
import 'package:home_cure/features/authentication/domain/usecases/update_provider.dart';
import 'package:home_cure/features/authentication/domain/usecases/update_user.dart';
import 'package:home_cure/features/authentication/domain/usecases/update_user_details.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_attachment.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_provider_attachment.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_provider_photo.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_user_photo.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit({
    required this.getMe,
    required this.updateUser,
    required this.uploadUserAttatchment,
    required this.updateUserDetails,
    required this.uploadProviderAttachments,
    required this.uploadUserPhoto,
    required this.updateProvider,
    required this.uploadProviderPhoto,
    required this.getUser,
  }) : super(UserCubitStateInitil());
  final GetMe getMe;
  final UpdateUser updateUser;
  final GetUser getUser;
  final UpdateUserDetails updateUserDetails;
  final UploadUserAttachments uploadUserAttatchment;
  final UploadUserPhoto uploadUserPhoto;
  final UploadProviderPhoto uploadProviderPhoto;
  final UpdateProvider updateProvider;
  final UploadProviderAttachments uploadProviderAttachments;
  void addNewUser(User user) {
    emit(UserCubitStateLoaded(user));
  }

  static UserCubit get(BuildContext context) => context.read<UserCubit>();
  Future<void> updateUserFunc(UpdateUserParams params) async {
    final currentUser = (state as UserCubitStateLoaded).user;

    emit(UserCubitStateLoading());
    final Either<NetworkExceptions, User> user;
    if (currentUser.isUser) {
      user = await updateUser(params);
    } else {
      user = await updateProvider(params);
    }
    user.fold(
      (l) => emit(UserCubitStateError(l)),
      (r) => emit(UserCubitStateLoaded(r)),
    );
  }

  Future<void> updateUserDeatilsFunc(Details params) async {
    emit(UserCubitStateLoading());
    final user = await updateUserDetails(params);
    user.fold(
      (l) => emit(UserCubitStateError(l)),
      (r) => emit(UserCubitStateLoaded(r)),
    );
  }

  Future<void> getUserFuc(String params) async {
    emit(UserCubitStateLoading());
    final user = await getUser(params);
    user.fold(
      (l) => emit(UserCubitStateError(l)),
      (r) => emit(UserCubitStateLoaded(r)),
    );
  }

  Future<void> uploadUserAttatchmentFunc(UploadAttachmentParams params) async {
    emit(UserCubitStateLoading());
    final user = await uploadUserAttatchment(params);
    user.fold(
      (l) => emit(UserCubitStateError(l)),
      (r) => emit(UserCubitStateLoaded(r)),
    );
  }

  Future<void> uploadProviderAttatchmentFunc(
    UploadPorviderAttachmentParams params,
  ) async {
    emit(UserCubitStateLoading());
    final user = await uploadProviderAttachments(params);
    user.fold(
      (l) => emit(UserCubitStateError(l)),
      (r) => emit(UserCubitStateLoaded(r)),
    );
  }

  Future<void> uploadUserPhotoFunc(UploadUserPhotoParams params) async {
    final currentUser = (state as UserCubitStateLoaded).user;

    emit(UserCubitStateLoading());
    final Either<NetworkExceptions, User> user;
    if (currentUser.isUser) {
      user = await uploadUserPhoto(params);
    } else {
      print('object' * 100);
      user = await uploadProviderPhoto(params);
    }

    user.fold(
      (l) => emit(UserCubitStateError(l)),
      (r) => emit(UserCubitStateLoaded(r)),
    );
  }
}
