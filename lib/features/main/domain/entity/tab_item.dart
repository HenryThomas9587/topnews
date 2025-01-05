import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_item.freezed.dart';

@freezed
class TabItem with _$TabItem {
  const factory TabItem({
    required String id,
    required String label,
    required IconData icon,
    required IconData selectedIcon,
    required String route,
  }) = _TabItem;
}
