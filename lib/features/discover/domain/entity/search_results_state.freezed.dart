// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_results_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchResultsState {
  String get query => throw _privateConstructorUsedError;
  SearchType get activeTab => throw _privateConstructorUsedError;

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultsStateCopyWith<SearchResultsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultsStateCopyWith<$Res> {
  factory $SearchResultsStateCopyWith(
          SearchResultsState value, $Res Function(SearchResultsState) then) =
      _$SearchResultsStateCopyWithImpl<$Res, SearchResultsState>;
  @useResult
  $Res call({String query, SearchType activeTab});
}

/// @nodoc
class _$SearchResultsStateCopyWithImpl<$Res, $Val extends SearchResultsState>
    implements $SearchResultsStateCopyWith<$Res> {
  _$SearchResultsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? activeTab = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as SearchType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultsStateImplCopyWith<$Res>
    implements $SearchResultsStateCopyWith<$Res> {
  factory _$$SearchResultsStateImplCopyWith(_$SearchResultsStateImpl value,
          $Res Function(_$SearchResultsStateImpl) then) =
      __$$SearchResultsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, SearchType activeTab});
}

/// @nodoc
class __$$SearchResultsStateImplCopyWithImpl<$Res>
    extends _$SearchResultsStateCopyWithImpl<$Res, _$SearchResultsStateImpl>
    implements _$$SearchResultsStateImplCopyWith<$Res> {
  __$$SearchResultsStateImplCopyWithImpl(_$SearchResultsStateImpl _value,
      $Res Function(_$SearchResultsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? activeTab = null,
  }) {
    return _then(_$SearchResultsStateImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as SearchType,
    ));
  }
}

/// @nodoc

class _$SearchResultsStateImpl implements _SearchResultsState {
  const _$SearchResultsStateImpl(
      {this.query = '', this.activeTab = SearchType.stories});

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final SearchType activeTab;

  @override
  String toString() {
    return 'SearchResultsState(query: $query, activeTab: $activeTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultsStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.activeTab, activeTab) ||
                other.activeTab == activeTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, activeTab);

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultsStateImplCopyWith<_$SearchResultsStateImpl> get copyWith =>
      __$$SearchResultsStateImplCopyWithImpl<_$SearchResultsStateImpl>(
          this, _$identity);
}

abstract class _SearchResultsState implements SearchResultsState {
  const factory _SearchResultsState(
      {final String query,
      final SearchType activeTab}) = _$SearchResultsStateImpl;

  @override
  String get query;
  @override
  SearchType get activeTab;

  /// Create a copy of SearchResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultsStateImplCopyWith<_$SearchResultsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
