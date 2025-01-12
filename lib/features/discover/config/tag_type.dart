enum TagType {
  trending(name: 'trending', label: '趋势'),
  latest(name: 'latest', label: '最新'),
  recommended(name: 'recommended', label: '推荐'),
  category(name: 'category', label: '分类'),
  search(name: 'search', label: '搜索'),
  follow(name: 'follow', label: '关注');

  final String name;
  final String label;
  const TagType({required this.name, required this.label});

  static TagType fromString(String? value) {
    if (value == null) return TagType.trending;
    return TagType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => TagType.trending,
    );
  }
}
