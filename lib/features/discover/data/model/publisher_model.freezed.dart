// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publisher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublisherModel _$PublisherModelFromJson(Map<String, dynamic> json) {
  return _PublisherModel.fromJson(json);
}

/// @nodoc
mixin _$PublisherModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;

  /// Serializes this PublisherModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublisherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublisherModelCopyWith<PublisherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherModelCopyWith<$Res> {
  factory $PublisherModelCopyWith(
          PublisherModel value, $Res Function(PublisherModel) then) =
      _$PublisherModelCopyWithImpl<$Res, PublisherModel>;
  @useResult
  $Res call({String id, String name, String imageUrl, bool isFollowing});
}

/// @nodoc
class _$PublisherModelCopyWithImpl<$Res, $Val extends PublisherModel>
    implements $PublisherModelCopyWith<$Res> {
  _$PublisherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublisherModel
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
abstract class _$$PublisherModelImplCopyWith<$Res>
    implements $PublisherModelCopyWith<$Res> {
  factory _$$PublisherModelImplCopyWith(_$PublisherModelImpl value,
          $Res Function(_$PublisherModelImpl) then) =
      __$$PublisherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String imageUrl, bool isFollowing});
}

/// @nodoc
class __$$PublisherModelImplCopyWithImpl<$Res>
    extends _$PublisherModelCopyWithImpl<$Res, _$PublisherModelImpl>
    implements _$$PublisherModelImplCopyWith<$Res> {
  __$$PublisherModelImplCopyWithImpl(
      _$PublisherModelImpl _value, $Res Function(_$PublisherModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublisherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? isFollowing = null,
  }) {
    return _then(_$PublisherModelImpl(
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
@JsonSerializable()
class _$PublisherModelImpl implements _PublisherModel {
  const _$PublisherModelImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.isFollowing = false});

  factory _$PublisherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublisherModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final bool isFollowing;

  @override
  String toString() {
    return 'PublisherModel(id: $id, name: $name, imageUrl: $imageUrl, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublisherModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, isFollowing);

  /// Create a copy of PublisherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublisherModelImplCopyWith<_$PublisherModelImpl> get copyWith =>
      __$$PublisherModelImplCopyWithImpl<_$PublisherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublisherModelImplToJson(
      this,
    );
  }
}

abstract class _PublisherModel implements PublisherModel {
  const factory _PublisherModel(
      {required final String id,
      required final String name,
      required final String imageUrl,
      final bool isFollowing}) = _$PublisherModelImpl;

  factory _PublisherModel.fromJson(Map<String, dynamic> json) =
      _$PublisherModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  bool get isFollowing;

  /// Create a copy of PublisherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublisherModelImplCopyWith<_$PublisherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
