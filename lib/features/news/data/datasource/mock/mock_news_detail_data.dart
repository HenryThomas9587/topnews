class MockNewsDetailDataSource {
  static final MockNewsDetailDataSource _instance =
      MockNewsDetailDataSource._internal();

  factory MockNewsDetailDataSource() {
    return _instance;
  }

  MockNewsDetailDataSource._internal() {
    _init();
  }

  void _init() {
    // 初始化数据
  }
}
