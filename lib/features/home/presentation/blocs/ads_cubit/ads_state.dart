part of 'ads_cubit.dart';

abstract class AdsCubitState extends Equatable {}

class AdsCubitStateIntial extends AdsCubitState {
  @override
  List<Object?> get props => [];
}

class AdsCubitStateLoading extends AdsCubitState {
  @override
  List<Object?> get props => [];
}

class AdsCubitStateLoaded extends AdsCubitState {
  AdsCubitStateLoaded(this.ads);

  final List<Ad> ads;

  @override
  List<Object?> get props => [ads];
}

class AdsCubitStateError extends AdsCubitState {
  AdsCubitStateError(this.error);
  final NetworkExceptions error;

  @override
  List<Object?> get props => [error];
}
