// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) {
  return _AuthorModel.fromJson(json);
}

/// @nodoc
mixin _$AuthorModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;

  /// Serializes this AuthorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorModelCopyWith<AuthorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorModelCopyWith<$Res> {
  factory $AuthorModelCopyWith(
          AuthorModel value, $Res Function(AuthorModel) then) =
      _$AuthorModelCopyWithImpl<$Res, AuthorModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String imageUrl,
      bool isFollowing,
      String userType});
}

/// @nodoc
class _$AuthorModelCopyWithImpl<$Res, $Val extends AuthorModel>
    implements $AuthorModelCopyWith<$Res> {
  _$AuthorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorModel
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
abstract class _$$AuthorModelImplCopyWith<$Res>
    implements $AuthorModelCopyWith<$Res> {
  factory _$$AuthorModelImplCopyWith(
          _$AuthorModelImpl value, $Res Function(_$AuthorModelImpl) then) =
      __$$AuthorModelImplCopyWithImpl<$Res>;
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
class __$$AuthorModelImplCopyWithImpl<$Res>
    extends _$AuthorModelCopyWithImpl<$Res, _$AuthorModelImpl>
    implements _$$AuthorModelImplCopyWith<$Res> {
  __$$AuthorModelImplCopyWithImpl(
      _$AuthorModelImpl _value, $Res Function(_$AuthorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorModel
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
    return _then(_$AuthorModelImpl(
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
@JsonSerializable()
class _$AuthorModelImpl implements _AuthorModel {
  const _$AuthorModelImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.isFollowing = false,
      this.userType = ''});

  factory _$AuthorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorModelImplFromJson(json);

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
  @JsonKey()
  final String userType;

  @override
  String toString() {
    return 'AuthorModel(id: $id, name: $name, imageUrl: $imageUrl, isFollowing: $isFollowing, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, isFollowing, userType);

  /// Create a copy of AuthorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorModelImplCopyWith<_$AuthorModelImpl> get copyWith =>
      __$$AuthorModelImplCopyWithImpl<_$AuthorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorModelImplToJson(
      this,
    );
  }
}

abstract class _AuthorModel implements AuthorModel {
  const factory _AuthorModel(
      {required final String id,
      required final String name,
      required final String imageUrl,
      final bool isFollowing,
      final String userType}) = _$AuthorModelImpl;

  factory _AuthorModel.fromJson(Map<String, dynamic> json) =
      _$AuthorModelImpl.fromJson;

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

  /// Create a copy of AuthorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorModelImplCopyWith<_$AuthorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
