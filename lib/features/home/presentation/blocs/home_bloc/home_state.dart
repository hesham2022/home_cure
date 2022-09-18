part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeServicesLoading extends HomeState {}

class HomeServicesLoaded extends HomeState {
  const HomeServicesLoaded({
    required this.services,
  });
  final List<ServiceEntity> services;
}

class HomeServicesError extends HomeState {
  const HomeServicesError(this.error);
  final NetworkExceptions error;
}
