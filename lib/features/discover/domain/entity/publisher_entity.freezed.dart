// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publisher_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PublisherEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;

  /// Create a copy of PublisherEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublisherEntityCopyWith<PublisherEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherEntityCopyWith<$Res> {
  factory $PublisherEntityCopyWith(
          PublisherEntity value, $Res Function(PublisherEntity) then) =
      _$PublisherEntityCopyWithImpl<$Res, PublisherEntity>;
  @useResult
  $Res call({String id, String name, String imageUrl, bool isFollowing});
}

/// @nodoc
class _$PublisherEntityCopyWithImpl<$Res, $Val extends PublisherEntity>
    implements $PublisherEntityCopyWith<$Res> {
  _$PublisherEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublisherEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? isFollowing = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublisherEntityImplCopyWith<$Res>
    implements $PublisherEntityCopyWith<$Res> {
  factory _$$PublisherEntityImplCopyWith(_$PublisherEntityImpl value,
          $Res Function(_$PublisherEntityImpl) then) =
      __$$PublisherEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String imageUrl, bool isFollowing});
}

/// @nodoc
class __$$PublisherEntityImplCopyWithImpl<$Res>
    extends _$PublisherEntityCopyWithImpl<$Res, _$PublisherEntityImpl>
    implements _$$PublisherEntityImplCopyWith<$Res> {
  __$$PublisherEntityImplCopyWithImpl(
      _$PublisherEntityImpl _value, $Res Function(_$PublisherEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublisherEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? isFollowing = null,
  }) {
    return _then(_$PublisherEntityImpl(
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
    ));
  }
}

/// @nodoc

class _$PublisherEntityImpl implements _PublisherEntity {
  const _$PublisherEntityImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.isFollowing});

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final bool isFollowing;

  @override
  String toString() {
    return 'PublisherEntity(id: $id, name: $name, imageUrl: $imageUrl, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublisherEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, isFollowing);

  /// Create a copy of PublisherEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublisherEntityImplCopyWith<_$PublisherEntityImpl> get copyWith =>
      __$$PublisherEntityImplCopyWithImpl<_$PublisherEntityImpl>(
          this, _$identity);
}

abstract class _PublisherEntity implements PublisherEntity {
  const factory _PublisherEntity(
      {required final String id,
      required final String name,
      required final String imageUrl,
      required final bool isFollowing}) = _$PublisherEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  bool get isFollowing;

  /// Create a copy of PublisherEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublisherEntityImplCopyWith<_$PublisherEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
