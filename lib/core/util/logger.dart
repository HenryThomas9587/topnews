import 'dart:developer' as developer;

void log(
  String message, {
  String? name,
  Object? error,
  StackTrace? stackTrace,
}) {
  developer.log(
    message,
    name: name ?? 'TopNews',
    error: error,
    stackTrace: stackTrace,
  );
}
