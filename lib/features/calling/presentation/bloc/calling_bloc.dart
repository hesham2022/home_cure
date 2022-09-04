import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calling_event.dart';
part 'calling_state.dart';

class CallingBloc extends Bloc<CallingEvent, CallingState> {
  CallingBloc() : super(CallingInitial()) {
    on<CallingEvent>((event, emit) {
    });
  }
}
