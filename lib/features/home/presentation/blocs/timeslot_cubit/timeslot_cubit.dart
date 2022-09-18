import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';
import 'package:home_cure/features/home/domain/usecases/get_timeslot.dart';

part './timeslot_cubit_state.dart';

class TimeSlotCubit extends Cubit<TimeSlotCubitState> {
  TimeSlotCubit(this.getTimeSlots) : super(TimeSlotCubitStateIntial());
  final GetTimeSlots getTimeSlots;

  Future<void> getTimeSlotsFunc() async {
    final response = await getTimeSlots(NoParams());
    emit(TimeSlotCubitStateLoading());
    response.fold(
      (l) => emit(TimeSlotCubitStateError(l)),
      (r) => emit(TimeSlotCubitStateLoaded(r)),
    );
  }
}
