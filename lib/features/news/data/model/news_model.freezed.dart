// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get content => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get categoryId => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get category => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get imageUrl => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get author => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get authorAvatar => throw _privateConstructorUsedError;
  @HiveField(9)
  int get readTime => throw _privateConstructorUsedError;
  @HiveField(10)
  int get likes => throw _privateConstructorUsedError;
  @HiveField(11)
  int get views => throw _privateConstructorUsedError;
  @HiveField(12)
  int get comments => throw _privateConstructorUsedError;
  @HiveField(13)
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this NewsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String content,
      @HiveField(3) int? categoryId,
      @HiveField(4) String? category,
      @HiveField(5) DateTime publishedAt,
      @HiveField(6) String? imageUrl,
      @HiveField(7) String? author,
      @HiveField(8) String? authorAvatar,
      @HiveField(9) int readTime,
      @HiveField(10) int likes,
      @HiveField(11) int views,
      @HiveField(12) int comments,
      @HiveField(13) bool isFavorite});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? categoryId = freezed,
    Object? category = freezed,
    Object? publishedAt = null,
    Object? imageUrl = freezed,
    Object? author = freezed,
    Object? authorAvatar = freezed,
    Object? readTime = null,
    Object? likes = null,
    Object? views = null,
    Object? comments = null,
    Object? isFavorite = null,
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
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatar: freezed == authorAvatar
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      readTime: null == readTime
          ? _value.readTime
          : readTime // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsModelImplCopyWith<$Res>
    implements $NewsModelCopyWith<$Res> {
  factory _$$NewsModelImplCopyWith(
          _$NewsModelImpl value, $Res Function(_$NewsModelImpl) then) =
      __$$NewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String content,
      @HiveField(3) int? categoryId,
      @HiveField(4) String? category,
      @HiveField(5) DateTime publishedAt,
      @HiveField(6) String? imageUrl,
      @HiveField(7) String? author,
      @HiveField(8) String? authorAvatar,
      @HiveField(9) int readTime,
      @HiveField(10) int likes,
      @HiveField(11) int views,
      @HiveField(12) int comments,
      @HiveField(13) bool isFavorite});
}

/// @nodoc
class __$$NewsModelImplCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$NewsModelImpl>
    implements _$$NewsModelImplCopyWith<$Res> {
  __$$NewsModelImplCopyWithImpl(
      _$NewsModelImpl _value, $Res Function(_$NewsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? categoryId = freezed,
    Object? category = freezed,
    Object? publishedAt = null,
    Object? imageUrl = freezed,
    Object? author = freezed,
    Object? authorAvatar = freezed,
    Object? readTime = null,
    Object? likes = null,
    Object? views = null,
    Object? comments = null,
    Object? isFavorite = null,
  }) {
    return _then(_$NewsModelImpl(
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
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatar: freezed == authorAvatar
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      readTime: null == readTime
          ? _value.readTime
          : readTime // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsModelImpl extends _NewsModel {
  const _$NewsModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.content,
      @HiveField(3) this.categoryId,
      @HiveField(4) this.category,
      @HiveField(5) required this.publishedAt,
      @HiveField(6) this.imageUrl,
      @HiveField(7) this.author,
      @HiveField(8) this.authorAvatar,
      @HiveField(9) this.readTime = 0,
      @HiveField(10) this.likes = 0,
      @HiveField(11) this.views = 0,
      @HiveField(12) this.comments = 0,
      @HiveField(13) this.isFavorite = false})
      : super._();

  factory _$NewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String content;
  @override
  @HiveField(3)
  final int? categoryId;
  @override
  @HiveField(4)
  final String? category;
  @override
  @HiveField(5)
  final DateTime publishedAt;
  @override
  @HiveField(6)
  final String? imageUrl;
  @override
  @HiveField(7)
  final String? author;
  @override
  @HiveField(8)
  final String? authorAvatar;
  @override
  @JsonKey()
  @HiveField(9)
  final int readTime;
  @override
  @JsonKey()
  @HiveField(10)
  final int likes;
  @override
  @JsonKey()
  @HiveField(11)
  final int views;
  @override
  @JsonKey()
  @HiveField(12)
  final int comments;
  @override
  @JsonKey()
  @HiveField(13)
  final bool isFavorite;

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, content: $content, categoryId: $categoryId, category: $category, publishedAt: $publishedAt, imageUrl: $imageUrl, author: $author, authorAvatar: $authorAvatar, readTime: $readTime, likes: $likes, views: $views, comments: $comments, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorAvatar, authorAvatar) ||
                other.authorAvatar == authorAvatar) &&
            (identical(other.readTime, readTime) ||
                other.readTime == readTime) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      categoryId,
      category,
      publishedAt,
      imageUrl,
      author,
      authorAvatar,
      readTime,
      likes,
      views,
      comments,
      isFavorite);

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      __$$NewsModelImplCopyWithImpl<_$NewsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsModelImplToJson(
      this,
    );
  }
}

abstract class _NewsModel extends NewsModel {
  const factory _NewsModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String content,
      @HiveField(3) final int? categoryId,
      @HiveField(4) final String? category,
      @HiveField(5) required final DateTime publishedAt,
      @HiveField(6) final String? imageUrl,
      @HiveField(7) final String? author,
      @HiveField(8) final String? authorAvatar,
      @HiveField(9) final int readTime,
      @HiveField(10) final int likes,
      @HiveField(11) final int views,
      @HiveField(12) final int comments,
      @HiveField(13) final bool isFavorite}) = _$NewsModelImpl;
  const _NewsModel._() : super._();

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$NewsModelImpl.fromJson;

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
  int? get categoryId;
  @override
  @HiveField(4)
  String? get category;
  @override
  @HiveField(5)
  DateTime get publishedAt;
  @override
  @HiveField(6)
  String? get imageUrl;
  @override
  @HiveField(7)
  String? get author;
  @override
  @HiveField(8)
  String? get authorAvatar;
  @override
  @HiveField(9)
  int get readTime;
  @override
  @HiveField(10)
  int get likes;
  @override
  @HiveField(11)
  int get views;
  @override
  @HiveField(12)
  int get comments;
  @override
  @HiveField(13)
  bool get isFavorite;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
