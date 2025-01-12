// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthorEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;

  /// Create a copy of AuthorEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorEntityCopyWith<AuthorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorEntityCopyWith<$Res> {
  factory $AuthorEntityCopyWith(
          AuthorEntity value, $Res Function(AuthorEntity) then) =
      _$AuthorEntityCopyWithImpl<$Res, AuthorEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String imageUrl,
      bool isFollowing,
      String userType});
}

/// @nodoc
class _$AuthorEntityCopyWithImpl<$Res, $Val extends AuthorEntity>
    implements $AuthorEntityCopyWith<$Res> {
  _$AuthorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? isFollowing = null,
    Object? userType = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorEntityImplCopyWith<$Res>
    implements $AuthorEntityCopyWith<$Res> {
  factory _$$AuthorEntityImplCopyWith(
          _$AuthorEntityImpl value, $Res Function(_$AuthorEntityImpl) then) =
      __$$AuthorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String imageUrl,
      bool isFollowing,
      String userType});
}

/// @nodoc
class __$$AuthorEntityImplCopyWithImpl<$Res>
    extends _$AuthorEntityCopyWithImpl<$Res, _$AuthorEntityImpl>
    implements _$$AuthorEntityImplCopyWith<$Res> {
  __$$AuthorEntityImplCopyWithImpl(
      _$AuthorEntityImpl _value, $Res Function(_$AuthorEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? isFollowing = null,
    Object? userType = null,
  }) {
    return _then(_$AuthorEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthorEntityImpl implements _AuthorEntity {
  const _$AuthorEntityImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.isFollowing,
      required this.userType});

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final bool isFollowing;
  @override
  final String userType;

  @override
  String toString() {
    return 'AuthorEntity(id: $id, name: $name, imageUrl: $imageUrl, isFollowing: $isFollowing, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, isFollowing, userType);

  /// Create a copy of AuthorEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorEntityImplCopyWith<_$AuthorEntityImpl> get copyWith =>
      __$$AuthorEntityImplCopyWithImpl<_$AuthorEntityImpl>(this, _$identity);
}

abstract class _AuthorEntity implements AuthorEntity {
  const factory _AuthorEntity(
      {required final String id,
      required final String name,
      required final String imageUrl,
      required final bool isFollowing,
      required final String userType}) = _$AuthorEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  bool get isFollowing;
  @override
  String get userType;

  /// Create a copy of AuthorEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorEntityImplCopyWith<_$AuthorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
