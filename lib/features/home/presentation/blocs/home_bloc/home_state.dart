part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeServicesLoading extends HomeState {}

class HomeServicesLoaded extends HomeState {
  HomeServicesLoaded({
    required this.services,
  }) {
    add();
  }
  final List<ServiceEntity> services;
  void add() {
    // services.addAll(getOurDoctors());
  }
}

class HomeServicesError extends HomeState {
  const HomeServicesError(this.error);
  final NetworkExceptions error;
}
