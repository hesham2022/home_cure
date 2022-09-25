import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/core/mdels/notification_mode.dart';
import 'package:home_cure/core/utils/hive_helper.dart';

part './notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsCubitState> {
  NotificationsCubit() : super(NotificationsCubitStateIntial()) {
    Hive.box<Map<dynamic, dynamic>>(HiveService.providerNotificationBox)
        .listenable()
        .addListener(getProviderNotifications);
    HiveService.userBox().listenable().addListener(getUserNotifications);
  }
  final notificationsBox =
      Hive.box<Map<dynamic, dynamic>>(HiveService.providerNotificationBox);
  Future<void> getProviderNotifications() async {
    emit(NotificationsCubitStateLoading());
    final notificationsMap = notificationsBox.toMap();
    final notifications = notificationsMap.values
        .map<NotificationsModel>(
          (j) => NotificationsModel.fromMap(j, j['title'] as String),
        )
        .toList();
    emit(
      NotificationsCubitStateLoaded(
        notifications,
      ),
    );
  }

  Future<void> getUserNotifications() async {
    emit(NotificationsCubitStateLoading());
    final notificationsMap = HiveService.userBox().toMap();
    final notifications = notificationsMap.values
        .map<NotificationsModel>(
          (j) => NotificationsModel.fromMap(j, j['title'] as String),
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
