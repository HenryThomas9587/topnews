import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:topnews/features/main/domain/entity/tab_item.dart';

part 'tab_config_model.freezed.dart';
part 'tab_config_model.g.dart';

@freezed
class TabConfigModel with _$TabConfigModel {
  const factory TabConfigModel({
    required String id,
    required String label,
    required String icon,
    required String selectedIcon,
    required String route,
  }) = _TabConfigModel;

  factory TabConfigModel.fromJson(Map<String, dynamic> json) =>
      _$TabConfigModelFromJson(json);
}

extension TabConfigModelX on TabConfigModel {
  TabItem toEntity() {
    return TabItem(
      id: id,
      label: label,
      icon: _getIconData(icon),
      selectedIcon: _getIconData(selectedIcon),
      route: route,
    );
  }

  IconData _getIconData(String iconName) {
    // 这里可以添加图标名称到 IconData 的映射逻辑
    switch (iconName) {
      case 'home':
        return Icons.home_outlined;
      case 'home_filled':
        return Icons.home;
      case 'explore':
        return Icons.explore_outlined;
      case 'explore_filled':
        return Icons.explore;
      case 'bookmark':
        return Icons.bookmark_outline;
      case 'bookmark_filled':
        return Icons.bookmark;
      case 'person':
        return Icons.person_outline;
      case 'person_filled':
        return Icons.person;
      default:
        return Icons.circle_outlined;
    }
  }
}
