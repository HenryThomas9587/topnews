// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TabConfigModel _$TabConfigModelFromJson(Map<String, dynamic> json) {
  return _TabConfigModel.fromJson(json);
}

/// @nodoc
mixin _$TabConfigModel {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get selectedIcon => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;

  /// Serializes this TabConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TabConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabConfigModelCopyWith<TabConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabConfigModelCopyWith<$Res> {
  factory $TabConfigModelCopyWith(
          TabConfigModel value, $Res Function(TabConfigModel) then) =
      _$TabConfigModelCopyWithImpl<$Res, TabConfigModel>;
  @useResult
  $Res call(
      {String id,
      String label,
      String icon,
      String selectedIcon,
      String route});
}

/// @nodoc
class _$TabConfigModelCopyWithImpl<$Res, $Val extends TabConfigModel>
    implements $TabConfigModelCopyWith<$Res> {
  _$TabConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = null,
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabConfigModelImplCopyWith<$Res>
    implements $TabConfigModelCopyWith<$Res> {
  factory _$$TabConfigModelImplCopyWith(_$TabConfigModelImpl value,
          $Res Function(_$TabConfigModelImpl) then) =
      __$$TabConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String icon,
      String selectedIcon,
      String route});
}

/// @nodoc
class __$$TabConfigModelImplCopyWithImpl<$Res>
    extends _$TabConfigModelCopyWithImpl<$Res, _$TabConfigModelImpl>
    implements _$$TabConfigModelImplCopyWith<$Res> {
  __$$TabConfigModelImplCopyWithImpl(
      _$TabConfigModelImpl _value, $Res Function(_$TabConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = null,
    Object? route = null,
  }) {
    return _then(_$TabConfigModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabConfigModelImpl implements _TabConfigModel {
  const _$TabConfigModelImpl(
      {required this.id,
      required this.label,
      required this.icon,
      required this.selectedIcon,
      required this.route});

  factory _$TabConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TabConfigModelImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String icon;
  @override
  final String selectedIcon;
  @override
  final String route;

  @override
  String toString() {
    return 'TabConfigModel(id: $id, label: $label, icon: $icon, selectedIcon: $selectedIcon, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabConfigModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, icon, selectedIcon, route);

  /// Create a copy of TabConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabConfigModelImplCopyWith<_$TabConfigModelImpl> get copyWith =>
      __$$TabConfigModelImplCopyWithImpl<_$TabConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabConfigModelImplToJson(
      this,
    );
  }
}

abstract class _TabConfigModel implements TabConfigModel {
  const factory _TabConfigModel(
      {required final String id,
      required final String label,
      required final String icon,
      required final String selectedIcon,
      required final String route}) = _$TabConfigModelImpl;

  factory _TabConfigModel.fromJson(Map<String, dynamic> json) =
      _$TabConfigModelImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get icon;
  @override
  String get selectedIcon;
  @override
  String get route;

  /// Create a copy of TabConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabConfigModelImplCopyWith<_$TabConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
