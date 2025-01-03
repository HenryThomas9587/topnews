import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError.network(String message) = NetworkError;
  const factory AppError.notFound(String message) = NotFoundError;
  const factory AppError.server(String message) = ServerError;
  const factory AppError.unauthorized(String message) = UnauthorizedError;
  const factory AppError.unknown(String message) = UnknownError;

  factory AppError.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppError.network('网络连接超时');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 401:
            return const AppError.unauthorized('未授权的访问');
          case 404:
            return const AppError.notFound('资源未找到');
          case 500:
            return const AppError.server('服务器错误');
          default:
            return AppError.unknown('未知错误: ${error.message}');
        }
      default:
        return AppError.unknown('未知错误: ${error.message}');
    }
  }
}
