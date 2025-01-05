// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabItem {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  IconData get selectedIcon => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;

  /// Create a copy of TabItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabItemCopyWith<TabItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabItemCopyWith<$Res> {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) then) =
      _$TabItemCopyWithImpl<$Res, TabItem>;
  @useResult
  $Res call(
      {String id,
      String label,
      IconData icon,
      IconData selectedIcon,
      String route});
}

/// @nodoc
class _$TabItemCopyWithImpl<$Res, $Val extends TabItem>
    implements $TabItemCopyWith<$Res> {
  _$TabItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabItem
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
              as IconData,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabItemImplCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$$TabItemImplCopyWith(
          _$TabItemImpl value, $Res Function(_$TabItemImpl) then) =
      __$$TabItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      IconData icon,
      IconData selectedIcon,
      String route});
}

/// @nodoc
class __$$TabItemImplCopyWithImpl<$Res>
    extends _$TabItemCopyWithImpl<$Res, _$TabItemImpl>
    implements _$$TabItemImplCopyWith<$Res> {
  __$$TabItemImplCopyWithImpl(
      _$TabItemImpl _value, $Res Function(_$TabItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabItem
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
    return _then(_$TabItemImpl(
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
              as IconData,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TabItemImpl implements _TabItem {
  const _$TabItemImpl(
      {required this.id,
      required this.label,
      required this.icon,
      required this.selectedIcon,
      required this.route});

  @override
  final String id;
  @override
  final String label;
  @override
  final IconData icon;
  @override
  final IconData selectedIcon;
  @override
  final String route;

  @override
  String toString() {
    return 'TabItem(id: $id, label: $label, icon: $icon, selectedIcon: $selectedIcon, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, icon, selectedIcon, route);

  /// Create a copy of TabItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabItemImplCopyWith<_$TabItemImpl> get copyWith =>
      __$$TabItemImplCopyWithImpl<_$TabItemImpl>(this, _$identity);
}

abstract class _TabItem implements TabItem {
  const factory _TabItem(
      {required final String id,
      required final String label,
      required final IconData icon,
      required final IconData selectedIcon,
      required final String route}) = _$TabItemImpl;

  @override
  String get id;
  @override
  String get label;
  @override
  IconData get icon;
  @override
  IconData get selectedIcon;
  @override
  String get route;

  /// Create a copy of TabItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabItemImplCopyWith<_$TabItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
