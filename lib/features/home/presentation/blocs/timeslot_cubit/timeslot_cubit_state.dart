part of 'timeslot_cubit.dart';

abstract class TimeSlotCubitState extends Equatable {}

class TimeSlotCubitStateIntial extends TimeSlotCubitState {
  @override
  List<Object?> get props => [];
}

class TimeSlotCubitStateLoading extends TimeSlotCubitState {
  @override
  List<Object?> get props => [];
}

class TimeSlotCubitStateLoaded extends TimeSlotCubitState {
  TimeSlotCubitStateLoaded(this.timeSlots);

  final List<TimeSlot> timeSlots;

  @override
  List<Object?> get props => [timeSlots];
}

class TimeSlotCubitStateError extends TimeSlotCubitState {
  TimeSlotCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
