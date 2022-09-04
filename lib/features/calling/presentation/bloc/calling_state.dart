part of 'calling_bloc.dart';

abstract class CallingState extends Equatable {
  const CallingState();  

  @override
  List<Object> get props => [];
}
class CallingInitial extends CallingState {}
