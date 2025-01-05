import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // 不显示方法调用栈
    errorMethodCount: 8, // 错误时显示8层调用栈
    lineLength: 120, // 每行最大长度
    colors: true, // 使用颜色
    printEmojis: true, // 显示表情
  ),
  level: Level.debug, // 设置日志级别
);

// 便捷方法
void logDebug(String message) => logger.d(message);
void logInfo(String message) => logger.i(message);
void logWarning(String message) => logger.w(message);
void logError(String message, [dynamic error, StackTrace? stackTrace]) =>
    logger.e(message, error: error, stackTrace: stackTrace);
