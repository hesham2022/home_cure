import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home_cure/core/mdels/notification_mode.dart';
import 'package:home_cure/core/utils/hive_helper.dart';
import 'package:home_cure/features/appointement/data/models/appoinmrnt_model.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/domain/entities/update_user_params.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';

class NotificationsBudgeCubit extends Cubit<bool> {
  NotificationsBudgeCubit() : super(false);
  void newNotifion() => emit(true);
  void read() => emit(false);
}

class PushNotifications {
  factory PushNotifications() => _instance;
  PushNotifications._internal();
  static String? fcmToken;

  static final PushNotifications _instance = PushNotifications._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initToken() async {
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.getToken().then((token) {
      debugPrint('===== FCM Token =====');
      debugPrint(token);
      fcmToken = token;
    });
  }

  Future<void> init(BuildContext context, NotificationsBudgeCubit bloc) async {
    await _firebaseMessaging.requestPermission();

    // Get device token
    await _firebaseMessaging.getToken().then((token) {
      debugPrint('===== FCM Token =====');
      debugPrint(token);
      fcmToken = token;
      if (context.read<UserCubit>().state is UserCubitStateLoaded) {
        if ((context.read<UserCubit>().state as UserCubitStateLoaded)
                .user
                .fcm !=
            fcmToken) {
          context.read<UserCubit>().updateUserFunc(
                UpdateUserParams(fcm: token),
              );
        }
      }
    });
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      bloc.newNotifion();
    }
    FirebaseMessaging.onMessage.listen(
      (event) async {
        if (event.data['appointment'] != null) {
          final appointment = AppointmentModel.fromJson(
            event.data['appointment'] as String,
          );
          final notificationModel = NotificationsModel(
            sentTime: event.sentTime!,
            appointment: appointment,
          );
          context.read<NotificationsCubit>().add(notificationModel);
          context
              .read<MyAppointmentsCubit>()
              .addFromFcm(notificationModel.appointment);

          await Hive.box<Map<dynamic, dynamic>>(
            HiveService.providerNotificationBox,
          ).put(
           event.messageId,
            notificationModel.toMap(),
          );
        }

        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: event.hashCode,
            channelKey: 'basic_channel',
            title: event.notification!.title ?? '',
            body: event.notification!.body,
          ),
        );
        bloc.newNotifion();
      },
    );

    _firebaseMessaging.onTokenRefresh.listen((event) {
      fcmToken = event;
      context.read<UserCubit>().updateUserFunc(
            UpdateUserParams(fcm: event),
          );
    });
    // Configure messaging receiving
  }
}
