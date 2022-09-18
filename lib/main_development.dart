// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/bootstrap.dart';
import 'package:home_cure/core/utils/hive_helper.dart';
import 'package:home_cure/di/get_it.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  // If you're going to use other Firebase services in the background, such as
  // Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  await AwesomeNotifications().initialize(
    'resource://mipmap/launcher_icon',
    [
      NotificationChannel(
        channelGroupKey: 'basic_tests',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      )
    ],
  );
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: event.hashCode,
      channelKey: 'basic_channel',
      title: event.notification!.title ?? '',
      body: event.notification!.body,
    ),
  );
  await HiveService().init();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await AwesomeNotifications().initialize(
    'resource://mipmap/launcher_icon',
    [
      NotificationChannel(
        channelGroupKey: 'basic_tests',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      )
    ],
  );
  await HiveService().init();
  await init();

  await bootstrap(() => const App());
}
