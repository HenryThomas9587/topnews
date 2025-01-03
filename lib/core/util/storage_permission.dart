import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class StoragePermission {
  static Future<bool> request() async {
    if (kIsWeb) {
      return true; // Web平台直接返回true，因为使用浏览器的存储API
    }

    // 检查并请求存储权限
    if (await Permission.storage.status.isDenied) {
      final status = await Permission.storage.request();
      return status.isGranted;
    }
    return true;
  }

  static Future<bool> check() async {
    if (kIsWeb) {
      return true; // Web平台直接返回true
    }
    return await Permission.storage.status.isGranted;
  }
}
