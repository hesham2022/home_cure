part of 'our_doctors_cubit.dart';

abstract class OurDoctorsCubitState extends Equatable {}

class OurDoctorsCubitStateIntial extends OurDoctorsCubitState {
  @override
  List<Object?> get props => [];
}

class OurDoctorsCubitStateLoading extends OurDoctorsCubitState {
  @override
  List<Object?> get props => [];
}

class OurDoctorsCubitStateLoaded extends OurDoctorsCubitState {
  OurDoctorsCubitStateLoaded(this.ourDoctors);

  final List<User> ourDoctors;

  @override
  List<Object?> get props => [ourDoctors];
}

class OurDoctorsCubitStateError extends OurDoctorsCubitState {
  OurDoctorsCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
