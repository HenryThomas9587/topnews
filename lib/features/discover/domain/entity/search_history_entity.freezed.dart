// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchHistoryEntity {
  String get id => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of SearchHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchHistoryEntityCopyWith<SearchHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryEntityCopyWith<$Res> {
  factory $SearchHistoryEntityCopyWith(
          SearchHistoryEntity value, $Res Function(SearchHistoryEntity) then) =
      _$SearchHistoryEntityCopyWithImpl<$Res, SearchHistoryEntity>;
  @useResult
  $Res call({String id, String keyword, DateTime createdAt});
}

/// @nodoc
class _$SearchHistoryEntityCopyWithImpl<$Res, $Val extends SearchHistoryEntity>
    implements $SearchHistoryEntityCopyWith<$Res> {
  _$SearchHistoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keyword = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHistoryEntityImplCopyWith<$Res>
    implements $SearchHistoryEntityCopyWith<$Res> {
  factory _$$SearchHistoryEntityImplCopyWith(_$SearchHistoryEntityImpl value,
          $Res Function(_$SearchHistoryEntityImpl) then) =
      __$$SearchHistoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String keyword, DateTime createdAt});
}

/// @nodoc
class __$$SearchHistoryEntityImplCopyWithImpl<$Res>
    extends _$SearchHistoryEntityCopyWithImpl<$Res, _$SearchHistoryEntityImpl>
    implements _$$SearchHistoryEntityImplCopyWith<$Res> {
  __$$SearchHistoryEntityImplCopyWithImpl(_$SearchHistoryEntityImpl _value,
      $Res Function(_$SearchHistoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keyword = null,
    Object? createdAt = null,
  }) {
    return _then(_$SearchHistoryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SearchHistoryEntityImpl implements _SearchHistoryEntity {
  const _$SearchHistoryEntityImpl(
      {required this.id, required this.keyword, required this.createdAt});

  @override
  final String id;
  @override
  final String keyword;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'SearchHistoryEntity(id: $id, keyword: $keyword, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHistoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, keyword, createdAt);

  /// Create a copy of SearchHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHistoryEntityImplCopyWith<_$SearchHistoryEntityImpl> get copyWith =>
      __$$SearchHistoryEntityImplCopyWithImpl<_$SearchHistoryEntityImpl>(
          this, _$identity);
}

abstract class _SearchHistoryEntity implements SearchHistoryEntity {
  const factory _SearchHistoryEntity(
      {required final String id,
      required final String keyword,
      required final DateTime createdAt}) = _$SearchHistoryEntityImpl;

  @override
  String get id;
  @override
  String get keyword;
  @override
  DateTime get createdAt;

  /// Create a copy of SearchHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchHistoryEntityImplCopyWith<_$SearchHistoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
