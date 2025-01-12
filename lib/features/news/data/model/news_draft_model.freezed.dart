// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_draft_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsDraftModel _$NewsDraftModelFromJson(Map<String, dynamic> json) {
  return _NewsDraftModel.fromJson(json);
}

/// @nodoc
mixin _$NewsDraftModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get content => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String> get images => throw _privateConstructorUsedError;
  @HiveField(4)
  String get category => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get isDraft => throw _privateConstructorUsedError;

  /// Serializes this NewsDraftModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsDraftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsDraftModelCopyWith<NewsDraftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDraftModelCopyWith<$Res> {
  factory $NewsDraftModelCopyWith(
          NewsDraftModel value, $Res Function(NewsDraftModel) then) =
      _$NewsDraftModelCopyWithImpl<$Res, NewsDraftModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String content,
      @HiveField(3) List<String> images,
      @HiveField(4) String category,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) bool isDraft});
}

/// @nodoc
class _$NewsDraftModelCopyWithImpl<$Res, $Val extends NewsDraftModel>
    implements $NewsDraftModelCopyWith<$Res> {
  _$NewsDraftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsDraftModel
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
abstract class _$$NewsDraftModelImplCopyWith<$Res>
    implements $NewsDraftModelCopyWith<$Res> {
  factory _$$NewsDraftModelImplCopyWith(_$NewsDraftModelImpl value,
          $Res Function(_$NewsDraftModelImpl) then) =
      __$$NewsDraftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String content,
      @HiveField(3) List<String> images,
      @HiveField(4) String category,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) bool isDraft});
}

/// @nodoc
class __$$NewsDraftModelImplCopyWithImpl<$Res>
    extends _$NewsDraftModelCopyWithImpl<$Res, _$NewsDraftModelImpl>
    implements _$$NewsDraftModelImplCopyWith<$Res> {
  __$$NewsDraftModelImplCopyWithImpl(
      _$NewsDraftModelImpl _value, $Res Function(_$NewsDraftModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsDraftModel
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
    return _then(_$NewsDraftModelImpl(
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
@JsonSerializable()
class _$NewsDraftModelImpl extends _NewsDraftModel {
  const _$NewsDraftModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.content,
      @HiveField(3) final List<String> images = const [],
      @HiveField(4) this.category = '',
      @HiveField(5) required this.createdAt,
      @HiveField(6) this.isDraft = true})
      : _images = images,
        super._();

  factory _$NewsDraftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsDraftModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String content;
  final List<String> _images;
  @override
  @JsonKey()
  @HiveField(3)
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  @HiveField(4)
  final String category;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @JsonKey()
  @HiveField(6)
  final bool isDraft;

  @override
  String toString() {
    return 'NewsDraftModel(id: $id, title: $title, content: $content, images: $images, category: $category, createdAt: $createdAt, isDraft: $isDraft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDraftModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of NewsDraftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDraftModelImplCopyWith<_$NewsDraftModelImpl> get copyWith =>
      __$$NewsDraftModelImplCopyWithImpl<_$NewsDraftModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsDraftModelImplToJson(
      this,
    );
  }
}

abstract class _NewsDraftModel extends NewsDraftModel {
  const factory _NewsDraftModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String content,
      @HiveField(3) final List<String> images,
      @HiveField(4) final String category,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) final bool isDraft}) = _$NewsDraftModelImpl;
  const _NewsDraftModel._() : super._();

  factory _NewsDraftModel.fromJson(Map<String, dynamic> json) =
      _$NewsDraftModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get content;
  @override
  @HiveField(3)
  List<String> get images;
  @override
  @HiveField(4)
  String get category;
  @override
  @HiveField(5)
  DateTime get createdAt;
  @override
  @HiveField(6)
  bool get isDraft;

  /// Create a copy of NewsDraftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsDraftModelImplCopyWith<_$NewsDraftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
