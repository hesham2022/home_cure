import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_user.dart';

abstract class UserCubitState extends Equatable {}

class GetProviderCubitStateInitil extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class GetProviderCubitStateLoading extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class GetProviderCubitStateError extends UserCubitState {
  GetProviderCubitStateError(this.error);
  final NetworkExceptions error;
  @override
  List<Object?> get props => [];
}

class GetProviderCubitStateLoaded extends UserCubitState {
  GetProviderCubitStateLoaded(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class GetProviderCubit extends Cubit<UserCubitState> {
  GetProviderCubit({
    required this.getProvider,
  }) : super(GetProviderCubitStateInitil());
  final GetProvider getProvider;
  Future<void> getProviderFunc(String id) async {
    emit(GetProviderCubitStateLoading());
    final result = await getProvider(id);
    result.fold(
      (l) => emit(GetProviderCubitStateError(l)),
      (r) {
        emit(GetProviderCubitStateLoaded(r));
      },
    );
  }
}
