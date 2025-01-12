enum AuthorType {
  trending(name: 'trending', label: '趋势'),
  latest(name: 'latest', label: '最新'),
  recommended(name: 'recommended', label: '推荐'),
  category(name: 'category', label: '分类'),
  search(name: 'search', label: '搜索'),
  follow(name: 'follow', label: '关注');

  final String name;
  final String label;
  const AuthorType({required this.name, required this.label});

  static AuthorType fromString(String? value) {
    if (value == null) return AuthorType.trending;
    return AuthorType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AuthorType.trending,
    );
  }
}
