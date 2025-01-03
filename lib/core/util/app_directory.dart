import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart' show kIsWeb;

class AppDirectory {
  static Future<String> get _localPath async {
    if (kIsWeb) {
      return ''; // Web平台返回空路径
    }
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<String> getFilePath(String fileName) async {
    if (kIsWeb) {
      return fileName; // Web平台直接返回文件名
    }
    final localPath = await _localPath;
    return path.join(localPath, fileName);
  }

  static Future<String> getCachePath() async {
    if (kIsWeb) {
      return ''; // Web平台返回空路径
    }
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  static Future<void> createDirectory(String dirPath) async {
    if (!kIsWeb) {
      // 仅在非Web平台创建目录
      await Directory(dirPath).create(recursive: true);
    }
  }

  static Future<void> deleteDirectory(String dirPath) async {
    if (!kIsWeb) {
      // 仅在非Web平台删除目录
      final dir = Directory(dirPath);
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    }
  }
}
