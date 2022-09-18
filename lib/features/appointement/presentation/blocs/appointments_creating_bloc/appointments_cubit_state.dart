part of './appointments_cubit.dart';

abstract class AppointmentsCubitState extends Equatable {}

class AppointmentsCubitStateLoading extends AppointmentsCubitState {
  @override
  List<Object?> get props => [];
}

class AppointmentsCubitStateIntial extends AppointmentsCubitState {
  @override
  List<Object?> get props => [];
}

class AppointmentsCubitStateCreated extends AppointmentsCubitState {
  AppointmentsCubitStateCreated(this.appointment);

  final Appointment appointment;
  @override
  List<Object?> get props => [appointment];
}

class AppointmentsCubitStateAccepted extends AppointmentsCubitState {
  AppointmentsCubitStateAccepted(this.appointment);

  final Appointment appointment;
  @override
  List<Object?> get props => [appointment];
}

class AppointmentsCubitStateOnProgress extends AppointmentsCubitState {
  AppointmentsCubitStateOnProgress(this.appointment);

  final Appointment appointment;
  @override
  List<Object?> get props => [appointment];
}

class AppointmentsCubitStateDone extends AppointmentsCubitState {
  AppointmentsCubitStateDone(this.appointment);

  final Appointment appointment;
  @override
  List<Object?> get props => [appointment];
}

class AppointmentsCubitStateCreatedWithPayLink extends AppointmentsCubitState {
  AppointmentsCubitStateCreatedWithPayLink(this.appointment);

  final Appointment appointment;
  @override
  List<Object?> get props => [appointment];
}

class AppointmentsCubitStatePayed extends AppointmentsCubitState {
  AppointmentsCubitStatePayed(this.appointment);

  final Appointment appointment;
  @override
  List<Object?> get props => [appointment];
}

class AppointmentsCubitStateError extends AppointmentsCubitState {
  AppointmentsCubitStateError(this.error);

  final NetworkExceptions error;
  @override
  List<Object?> get props => [error];
}
