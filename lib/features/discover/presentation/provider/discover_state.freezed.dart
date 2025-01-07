// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverState {
  Set<String> get followedPublishers => throw _privateConstructorUsedError;
  Set<String> get followedAuthors => throw _privateConstructorUsedError;

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverStateCopyWith<DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
          DiscoverState value, $Res Function(DiscoverState) then) =
      _$DiscoverStateCopyWithImpl<$Res, DiscoverState>;
  @useResult
  $Res call({Set<String> followedPublishers, Set<String> followedAuthors});
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res, $Val extends DiscoverState>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedPublishers = null,
    Object? followedAuthors = null,
  }) {
    return _then(_value.copyWith(
      followedPublishers: null == followedPublishers
          ? _value.followedPublishers
          : followedPublishers // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      followedAuthors: null == followedAuthors
          ? _value.followedAuthors
          : followedAuthors // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoverStateImplCopyWith<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  factory _$$DiscoverStateImplCopyWith(
          _$DiscoverStateImpl value, $Res Function(_$DiscoverStateImpl) then) =
      __$$DiscoverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<String> followedPublishers, Set<String> followedAuthors});
}

/// @nodoc
class __$$DiscoverStateImplCopyWithImpl<$Res>
    extends _$DiscoverStateCopyWithImpl<$Res, _$DiscoverStateImpl>
    implements _$$DiscoverStateImplCopyWith<$Res> {
  __$$DiscoverStateImplCopyWithImpl(
      _$DiscoverStateImpl _value, $Res Function(_$DiscoverStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedPublishers = null,
    Object? followedAuthors = null,
  }) {
    return _then(_$DiscoverStateImpl(
      followedPublishers: null == followedPublishers
          ? _value._followedPublishers
          : followedPublishers // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      followedAuthors: null == followedAuthors
          ? _value._followedAuthors
          : followedAuthors // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$DiscoverStateImpl implements _DiscoverState {
  const _$DiscoverStateImpl(
      {final Set<String> followedPublishers = const {},
      final Set<String> followedAuthors = const {}})
      : _followedPublishers = followedPublishers,
        _followedAuthors = followedAuthors;

  final Set<String> _followedPublishers;
  @override
  @JsonKey()
  Set<String> get followedPublishers {
    if (_followedPublishers is EqualUnmodifiableSetView)
      return _followedPublishers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_followedPublishers);
  }

  final Set<String> _followedAuthors;
  @override
  @JsonKey()
  Set<String> get followedAuthors {
    if (_followedAuthors is EqualUnmodifiableSetView) return _followedAuthors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_followedAuthors);
  }

  @override
  String toString() {
    return 'DiscoverState(followedPublishers: $followedPublishers, followedAuthors: $followedAuthors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverStateImpl &&
            const DeepCollectionEquality()
                .equals(other._followedPublishers, _followedPublishers) &&
            const DeepCollectionEquality()
                .equals(other._followedAuthors, _followedAuthors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_followedPublishers),
      const DeepCollectionEquality().hash(_followedAuthors));

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      __$$DiscoverStateImplCopyWithImpl<_$DiscoverStateImpl>(this, _$identity);
}

abstract class _DiscoverState implements DiscoverState {
  const factory _DiscoverState(
      {final Set<String> followedPublishers,
      final Set<String> followedAuthors}) = _$DiscoverStateImpl;

  @override
  Set<String> get followedPublishers;
  @override
  Set<String> get followedAuthors;

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
