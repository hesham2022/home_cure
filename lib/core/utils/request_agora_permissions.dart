import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> hanldleCameraAndMice(Permission permission) async {
  return permission.request();
}

Future<bool> requestAgoraPermissions() async {
  final camerStatus = await hanldleCameraAndMice(Permission.camera);
  final miceStatus = await hanldleCameraAndMice(Permission.microphone);
  if (camerStatus != PermissionStatus.granted ||
      miceStatus != PermissionStatus.granted) {
    return false;
  }

  return true;
}
