// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_draft_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsDraftEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDraft => throw _privateConstructorUsedError;

  /// Create a copy of NewsDraftEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsDraftEntityCopyWith<NewsDraftEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDraftEntityCopyWith<$Res> {
  factory $NewsDraftEntityCopyWith(
          NewsDraftEntity value, $Res Function(NewsDraftEntity) then) =
      _$NewsDraftEntityCopyWithImpl<$Res, NewsDraftEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      List<String> images,
      String category,
      DateTime createdAt,
      bool isDraft});
}

/// @nodoc
class _$NewsDraftEntityCopyWithImpl<$Res, $Val extends NewsDraftEntity>
    implements $NewsDraftEntityCopyWith<$Res> {
  _$NewsDraftEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsDraftEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? images = null,
    Object? category = null,
    Object? createdAt = null,
    Object? isDraft = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDraftEntityImplCopyWith<$Res>
    implements $NewsDraftEntityCopyWith<$Res> {
  factory _$$NewsDraftEntityImplCopyWith(_$NewsDraftEntityImpl value,
          $Res Function(_$NewsDraftEntityImpl) then) =
      __$$NewsDraftEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      List<String> images,
      String category,
      DateTime createdAt,
      bool isDraft});
}

/// @nodoc
class __$$NewsDraftEntityImplCopyWithImpl<$Res>
    extends _$NewsDraftEntityCopyWithImpl<$Res, _$NewsDraftEntityImpl>
    implements _$$NewsDraftEntityImplCopyWith<$Res> {
  __$$NewsDraftEntityImplCopyWithImpl(
      _$NewsDraftEntityImpl _value, $Res Function(_$NewsDraftEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsDraftEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? images = null,
    Object? category = null,
    Object? createdAt = null,
    Object? isDraft = null,
  }) {
    return _then(_$NewsDraftEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewsDraftEntityImpl implements _NewsDraftEntity {
  const _$NewsDraftEntityImpl(
      {required this.id,
      required this.title,
      required this.content,
      final List<String> images = const [],
      this.category = '',
      required this.createdAt,
      this.isDraft = true})
      : _images = images;

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final String category;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isDraft;

  @override
  String toString() {
    return 'NewsDraftEntity(id: $id, title: $title, content: $content, images: $images, category: $category, createdAt: $createdAt, isDraft: $isDraft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDraftEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      const DeepCollectionEquality().hash(_images),
      category,
      createdAt,
      isDraft);

  /// Create a copy of NewsDraftEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDraftEntityImplCopyWith<_$NewsDraftEntityImpl> get copyWith =>
      __$$NewsDraftEntityImplCopyWithImpl<_$NewsDraftEntityImpl>(
          this, _$identity);
}

abstract class _NewsDraftEntity implements NewsDraftEntity {
  const factory _NewsDraftEntity(
      {required final String id,
      required final String title,
      required final String content,
      final List<String> images,
      final String category,
      required final DateTime createdAt,
      final bool isDraft}) = _$NewsDraftEntityImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  List<String> get images;
  @override
  String get category;
  @override
  DateTime get createdAt;
  @override
  bool get isDraft;

  /// Create a copy of NewsDraftEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsDraftEntityImplCopyWith<_$NewsDraftEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
