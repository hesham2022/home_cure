import 'package:equatable/equatable.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';

abstract class UserCubitState extends Equatable {}

class UserCubitStateInitil extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserCubitStateLoading extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserCubitStateLoaded extends UserCubitState {
  UserCubitStateLoaded(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class UserCubitStateError extends UserCubitState {
  UserCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
