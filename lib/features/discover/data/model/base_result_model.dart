class BaseResultModel<T> {
  final T? data;
  final int code;
  final String message;

  BaseResultModel(
      {required this.data, required this.code, required this.message});
}

// 创建成功结果
BaseResultModel<T?> successResult<T>(T? data) {
  return BaseResultModel<T?>(data: data, code: 200, message: 'success');
}

// 创建失败结果
BaseResultModel<T?> errorResult<T>(int code, String message) {
  return BaseResultModel<T?>(data: null, code: code, message: message);
}
