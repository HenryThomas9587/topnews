import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_provider.g.dart';

@riverpod
class Tab extends _$Tab {
  @override
  int build() => 0;

  void setTab(int index) => state = index;
}
