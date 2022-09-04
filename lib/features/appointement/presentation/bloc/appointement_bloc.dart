import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appointement_event.dart';
part 'appointement_state.dart';

class AppointementBloc extends Bloc<AppointementEvent, AppointementState> {
  AppointementBloc() : super(AppointementInitial()) {
    on<AppointementEvent>((event, emit) {
    });
  }
}
