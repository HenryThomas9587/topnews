// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get newsCount => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagEntityCopyWith<TagEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagEntityCopyWith<$Res> {
  factory $TagEntityCopyWith(TagEntity value, $Res Function(TagEntity) then) =
      _$TagEntityCopyWithImpl<$Res, TagEntity>;
  @useResult
  $Res call(
      {String id, String name, String label, int newsCount, bool isFollowed});
}

/// @nodoc
class _$TagEntityCopyWithImpl<$Res, $Val extends TagEntity>
    implements $TagEntityCopyWith<$Res> {
  _$TagEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? newsCount = null,
    Object? isFollowed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      newsCount: null == newsCount
          ? _value.newsCount
          : newsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagEntityImplCopyWith<$Res>
    implements $TagEntityCopyWith<$Res> {
  factory _$$TagEntityImplCopyWith(
          _$TagEntityImpl value, $Res Function(_$TagEntityImpl) then) =
      __$$TagEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String label, int newsCount, bool isFollowed});
}

/// @nodoc
class __$$TagEntityImplCopyWithImpl<$Res>
    extends _$TagEntityCopyWithImpl<$Res, _$TagEntityImpl>
    implements _$$TagEntityImplCopyWith<$Res> {
  __$$TagEntityImplCopyWithImpl(
      _$TagEntityImpl _value, $Res Function(_$TagEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? newsCount = null,
    Object? isFollowed = null,
  }) {
    return _then(_$TagEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      newsCount: null == newsCount
          ? _value.newsCount
          : newsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TagEntityImpl extends _TagEntity {
  const _$TagEntityImpl(
      {required this.id,
      required this.name,
      required this.label,
      required this.newsCount,
      this.isFollowed = false})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String label;
  @override
  final int newsCount;
  @override
  @JsonKey()
  final bool isFollowed;

  @override
  String toString() {
    return 'TagEntity(id: $id, name: $name, label: $label, newsCount: $newsCount, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.newsCount, newsCount) ||
                other.newsCount == newsCount) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, label, newsCount, isFollowed);

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagEntityImplCopyWith<_$TagEntityImpl> get copyWith =>
      __$$TagEntityImplCopyWithImpl<_$TagEntityImpl>(this, _$identity);
}

abstract class _TagEntity extends TagEntity {
  const factory _TagEntity(
      {required final String id,
      required final String name,
      required final String label,
      required final int newsCount,
      final bool isFollowed}) = _$TagEntityImpl;
  const _TagEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get label;
  @override
  int get newsCount;
  @override
  bool get isFollowed;

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagEntityImplCopyWith<_$TagEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
