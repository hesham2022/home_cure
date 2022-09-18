import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/domain/repositories/i_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.servicesRepository}) : super(HomeInitial()) {
    on<GetServicesEvent>((event, emit) async {
      emit(HomeServicesLoading());
      final services = await servicesRepository.getServices();
      services.fold((l) => emit(HomeServicesError(l)), (r) {
        emit(HomeServicesLoaded(services: r));
      });
    });
  }
  final IServicesRepository servicesRepository;
}
