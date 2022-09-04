part of 'appointement_bloc.dart';

abstract class AppointementState extends Equatable {
  const AppointementState();  

  @override
  List<Object> get props => [];
}
class AppointementInitial extends AppointementState {}
