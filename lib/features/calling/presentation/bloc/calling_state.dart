part of 'calling_bloc.dart';

abstract class CallingState extends Equatable {
  const CallingState();

  @override
  List<Object> get props => [];
}

class CallingInitial extends CallingState {}

class CallingLoading extends CallingState {}

class CallingLoaded extends CallingState {
  const CallingLoaded(this.comapnySettingsModel);

  final ComapnySettingsModel comapnySettingsModel;
}
class CallingFailed extends CallingState {
 const CallingFailed(this.error);

  final NetworkExceptions error;
}
