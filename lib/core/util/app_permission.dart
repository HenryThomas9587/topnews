import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:device_info_plus/device_info_plus.dart';

class AppPermission {
  /// 请求指定的权限
  static Future<PermissionStatus> requestPermission(
      Permission permission) async {
    if (await permission.status.isDenied) {
      return await permission.request();
    }
    return permission.status;
  }

  /// 请求照片或存储权限
  static Future<bool> requestPhotoOrStoragePermission() async {
    if (kIsWeb) {
      return true; // Web平台直接返回true
    }

    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    Permission permissionToRequest;

    if (defaultTargetPlatform == TargetPlatform.android &&
        deviceInfo.version.sdkInt <= 32) {
      permissionToRequest = Permission.storage;
    } else {
      permissionToRequest = Permission.photos;
    }

    final status = await requestPermission(permissionToRequest);
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      return false;
    }
    return false;
  }

  /// 检查并请求存储权限
  static Future<bool> requestStoragePermission() async {
    return await requestPhotoOrStoragePermission();
  }

  /// 检查权限是否已授予
  static Future<bool> checkPermission(Permission permission) async {
    if (kIsWeb) {
      return true; // Web平台直接返回true
    }
    return await permission.status.isGranted;
  }
}
