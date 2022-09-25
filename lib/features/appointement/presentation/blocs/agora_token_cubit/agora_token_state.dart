part of './agora_token_cubit.dart';

abstract class AgoraTokenCubitCubitState extends Equatable {}

class AgoraTokenCubitCubitStateIntial extends AgoraTokenCubitCubitState {
  @override
  List<Object?> get props => [];
}

class AgoraTokenCubitCubitStateLoading extends AgoraTokenCubitCubitState {
  @override
  List<Object?> get props => [];
}

class AgoraTokenCubitCubitStateLoaded extends AgoraTokenCubitCubitState {
  AgoraTokenCubitCubitStateLoaded(this.appointments);
  final AgoraToken appointments;

  @override
  List<Object?> get props => [appointments];
}

class AgoraTokenCubitCubitStateError extends AgoraTokenCubitCubitState {
  AgoraTokenCubitCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
