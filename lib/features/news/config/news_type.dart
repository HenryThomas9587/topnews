enum NewsType {
  top(name: 'top', label: '头条'),
  trending(name: 'trending', label: '趋势'),
  latest(name: 'latest', label: '最新'),
  recommended(name: 'recommended', label: '推荐'),
  category(name: 'category', label: '分类'),
  search(name: 'search', label: '搜索');

  final String name;
  final String label;
  const NewsType({required this.name, required this.label});

  static NewsType fromString(String? value) {
    if (value == null) return NewsType.top;
    return NewsType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => NewsType.top,
    );
  }
}
