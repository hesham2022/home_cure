import 'package:hive_flutter/hive_flutter.dart';


class HiveService {
  factory HiveService() => _instance ??= HiveService._();
  HiveService._();
  static HiveService? _instance;
static const providerNotificationBox = 'providerNotifications';
 

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Map<dynamic, dynamic>>(providerNotificationBox);
  
  }
}
