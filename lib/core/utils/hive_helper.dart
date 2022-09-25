import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  factory HiveService() => _instance ??= HiveService._();
  HiveService._();
  static HiveService? _instance;
  static const providerNotificationBox = 'providerNotifications';
  static const userrNotificationBox = 'userNotifications';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Map<dynamic, dynamic>>(providerNotificationBox);
    await Hive.openBox<Map<dynamic, dynamic>>(userrNotificationBox);
  }

  static Box<Map<dynamic, dynamic>> userBox() =>
      Hive.box<Map<dynamic, dynamic>>(userrNotificationBox);
  static Box<Map<dynamic, dynamic>> providerBox() =>
      Hive.box<Map<dynamic, dynamic>>(userrNotificationBox);
}
