
part of'./notifications_cubit.dart';
abstract class NotificationsCubitState extends Equatable {}
class NotificationsCubitStateIntial extends NotificationsCubitState {
  NotificationsCubitStateIntial();

  @override
  List<Object?> get props => [];
}

class NotificationsCubitStateLoading extends NotificationsCubitState {
  NotificationsCubitStateLoading();

  @override
  List<Object?> get props => [];
}

class NotificationsCubitStateLoaded extends NotificationsCubitState {
  NotificationsCubitStateLoaded(this.appointments);
  final List<NotificationsModel> appointments;
  @override
  List<Object?> get props => [appointments];
}

class NotificationsCubitStateError extends NotificationsCubitState {
  NotificationsCubitStateError(this.error);
  final AppError error;
  @override
  List<Object?> get props => [error];
}
class NotificationsError extends AppError{
  @override
 
  String? get errorMessege => 'Notiication Error';
}
