import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/calling/data/models/comapny_settings_model.dart';
import 'package:home_cure/features/calling/domain/repositories/i_comapny_settings_repo.dart';

part 'calling_event.dart';
part 'calling_state.dart';

class CallingBloc extends Bloc<CallingEvent, CallingState> {
  CallingBloc({required this.repository}) : super(CallingInitial()) {
    on<CallingEvent>((event, emit) {});
    on<GetComapnySettingsEvent>((event, emit) async {
      emit(CallingLoading());
      final result = await repository.getCompanySettings();
      result.fold((l) => emit(CallingFailed(l)), (r) => emit(CallingLoaded(r)));
    });
  }
  final IComapnySettingsRepository repository;
}
