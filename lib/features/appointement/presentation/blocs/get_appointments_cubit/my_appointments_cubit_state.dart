part of './my_appointments_cubit..dart';

abstract class MyAppointmentsCubitState extends Equatable {}

class MyAppointmentsCubitStateIntial extends MyAppointmentsCubitState {
  @override
  List<Object?> get props => [];
}

class MyAppointmentsCubitStateLoading extends MyAppointmentsCubitState {
  @override
  List<Object?> get props => [];
}

class MyAppointmentsCubitStateLoaded extends MyAppointmentsCubitState {
  MyAppointmentsCubitStateLoaded(this.appointments);
  final List<Appointment> appointments;

  @override
  List<Object?> get props => [appointments];
}

class MyAppointmentsCubitStateError extends MyAppointmentsCubitState {
  MyAppointmentsCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
