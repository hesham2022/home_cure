import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/core/mdels/notification_mode.dart';
import 'package:home_cure/core/utils/hive_helper.dart';

part './notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsCubitState> {
  NotificationsCubit() : super(NotificationsCubitStateIntial());
  final notificationsBox =
      Hive.box<Map<dynamic, dynamic>>(HiveService.providerNotificationBox);
  Future<void> getNotifications() async {
    emit(NotificationsCubitStateLoading());
    final notificationsMap = notificationsBox.toMap();
    final notifications = notificationsMap.values
        .map<NotificationsModel>(
          NotificationsModel.fromMap,
        )
        .toList();
    emit(
      NotificationsCubitStateLoaded(
        notifications,
      ),
    );
  }

  void add(NotificationsModel model) {
    if (state is NotificationsCubitStateLoaded) {
      emit(
        NotificationsCubitStateLoaded(
          [...(state as NotificationsCubitStateLoaded).appointments, model],
        ),
      );
    }
  }
}
