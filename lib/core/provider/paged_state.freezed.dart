// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PagedState<T> {
  AsyncValue<List<T>> get data => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  bool get isLoadMoreError => throw _privateConstructorUsedError;
  double get scrollOffset => throw _privateConstructorUsedError;

  /// Create a copy of PagedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagedStateCopyWith<T, PagedState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedStateCopyWith<T, $Res> {
  factory $PagedStateCopyWith(
          PagedState<T> value, $Res Function(PagedState<T>) then) =
      _$PagedStateCopyWithImpl<T, $Res, PagedState<T>>;
  @useResult
  $Res call(
      {AsyncValue<List<T>> data,
      int currentPage,
      bool hasNextPage,
      bool isLoadingMore,
      bool isRefreshing,
      bool isLoadMoreError,
      double scrollOffset});
}

/// @nodoc
class _$PagedStateCopyWithImpl<T, $Res, $Val extends PagedState<T>>
    implements $PagedStateCopyWith<T, $Res> {
  _$PagedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PagedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = null,
    Object? hasNextPage = null,
    Object? isLoadingMore = null,
    Object? isRefreshing = null,
    Object? isLoadMoreError = null,
    Object? scrollOffset = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<T>>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMoreError: null == isLoadMoreError
          ? _value.isLoadMoreError
          : isLoadMoreError // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollOffset: null == scrollOffset
          ? _value.scrollOffset
          : scrollOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedStateImplCopyWith<T, $Res>
    implements $PagedStateCopyWith<T, $Res> {
  factory _$$PagedStateImplCopyWith(
          _$PagedStateImpl<T> value, $Res Function(_$PagedStateImpl<T>) then) =
      __$$PagedStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<T>> data,
      int currentPage,
      bool hasNextPage,
      bool isLoadingMore,
      bool isRefreshing,
      bool isLoadMoreError,
      double scrollOffset});
}

/// @nodoc
class __$$PagedStateImplCopyWithImpl<T, $Res>
    extends _$PagedStateCopyWithImpl<T, $Res, _$PagedStateImpl<T>>
    implements _$$PagedStateImplCopyWith<T, $Res> {
  __$$PagedStateImplCopyWithImpl(
      _$PagedStateImpl<T> _value, $Res Function(_$PagedStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PagedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = null,
    Object? hasNextPage = null,
    Object? isLoadingMore = null,
    Object? isRefreshing = null,
    Object? isLoadMoreError = null,
    Object? scrollOffset = null,
  }) {
    return _then(_$PagedStateImpl<T>(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<T>>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMoreError: null == isLoadMoreError
          ? _value.isLoadMoreError
          : isLoadMoreError // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollOffset: null == scrollOffset
          ? _value.scrollOffset
          : scrollOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PagedStateImpl<T> implements _PagedState<T> {
  _$PagedStateImpl(
      {required this.data,
      this.currentPage = 1,
      this.hasNextPage = false,
      this.isLoadingMore = false,
      this.isRefreshing = false,
      this.isLoadMoreError = false,
      this.scrollOffset = 0.0});

  @override
  final AsyncValue<List<T>> data;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  @JsonKey()
  final bool isLoadMoreError;
  @override
  @JsonKey()
  final double scrollOffset;

  @override
  String toString() {
    return 'PagedState<$T>(data: $data, currentPage: $currentPage, hasNextPage: $hasNextPage, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, isLoadMoreError: $isLoadMoreError, scrollOffset: $scrollOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedStateImpl<T> &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.isLoadMoreError, isLoadMoreError) ||
                other.isLoadMoreError == isLoadMoreError) &&
            (identical(other.scrollOffset, scrollOffset) ||
                other.scrollOffset == scrollOffset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, currentPage, hasNextPage,
      isLoadingMore, isRefreshing, isLoadMoreError, scrollOffset);

  /// Create a copy of PagedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedStateImplCopyWith<T, _$PagedStateImpl<T>> get copyWith =>
      __$$PagedStateImplCopyWithImpl<T, _$PagedStateImpl<T>>(this, _$identity);
}

abstract class _PagedState<T> implements PagedState<T> {
  factory _PagedState(
      {required final AsyncValue<List<T>> data,
      final int currentPage,
      final bool hasNextPage,
      final bool isLoadingMore,
      final bool isRefreshing,
      final bool isLoadMoreError,
      final double scrollOffset}) = _$PagedStateImpl<T>;

  @override
  AsyncValue<List<T>> get data;
  @override
  int get currentPage;
  @override
  bool get hasNextPage;
  @override
  bool get isLoadingMore;
  @override
  bool get isRefreshing;
  @override
  bool get isLoadMoreError;
  @override
  double get scrollOffset;

  /// Create a copy of PagedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagedStateImplCopyWith<T, _$PagedStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
