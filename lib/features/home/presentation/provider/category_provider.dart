import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class CategoryFilter extends _$CategoryFilter {
  @override
  String build() => 'All';

  void setCategory(String category) => state = category;
}
