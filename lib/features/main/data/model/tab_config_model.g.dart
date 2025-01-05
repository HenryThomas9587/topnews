// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TabConfigModelImpl _$$TabConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$TabConfigModelImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      icon: json['icon'] as String,
      selectedIcon: json['selectedIcon'] as String,
      route: json['route'] as String,
    );

Map<String, dynamic> _$$TabConfigModelImplToJson(
        _$TabConfigModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'icon': instance.icon,
      'selectedIcon': instance.selectedIcon,
      'route': instance.route,
    };
