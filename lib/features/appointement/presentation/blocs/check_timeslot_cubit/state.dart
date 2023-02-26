part of './cubit.dart';

abstract class CheckTimeslotsCubitState extends Equatable {}

class CheckTimeslotsCubitStateIntial extends CheckTimeslotsCubitState {
  @override
  List<Object?> get props => [];
}

class CheckTimeslotsCubitStateLoading extends CheckTimeslotsCubitState {
  @override
  List<Object?> get props => [];
}

class CheckTimeslotsCubitStateLoaded extends CheckTimeslotsCubitState {
  CheckTimeslotsCubitStateLoaded(this.appointments);
  final List<Appointment> appointments;

  @override
  List<Object?> get props => [appointments];
}

class CheckTimeslotsCubitStateError extends CheckTimeslotsCubitState {
  CheckTimeslotsCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
