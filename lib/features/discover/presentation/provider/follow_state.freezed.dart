// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FollowState {
  Map<String, bool> get followStatus => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowStateCopyWith<FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateCopyWith<$Res> {
  factory $FollowStateCopyWith(
          FollowState value, $Res Function(FollowState) then) =
      _$FollowStateCopyWithImpl<$Res, FollowState>;
  @useResult
  $Res call({Map<String, bool> followStatus, bool isLoading});
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res, $Val extends FollowState>
    implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followStatus = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      followStatus: null == followStatus
          ? _value.followStatus
          : followStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowStateImplCopyWith<$Res>
    implements $FollowStateCopyWith<$Res> {
  factory _$$FollowStateImplCopyWith(
          _$FollowStateImpl value, $Res Function(_$FollowStateImpl) then) =
      __$$FollowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, bool> followStatus, bool isLoading});
}

/// @nodoc
class __$$FollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$FollowStateImpl>
    implements _$$FollowStateImplCopyWith<$Res> {
  __$$FollowStateImplCopyWithImpl(
      _$FollowStateImpl _value, $Res Function(_$FollowStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followStatus = null,
    Object? isLoading = null,
  }) {
    return _then(_$FollowStateImpl(
      followStatus: null == followStatus
          ? _value._followStatus
          : followStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FollowStateImpl implements _FollowState {
  const _$FollowStateImpl(
      {required final Map<String, bool> followStatus, this.isLoading = false})
      : _followStatus = followStatus;

  final Map<String, bool> _followStatus;
  @override
  Map<String, bool> get followStatus {
    if (_followStatus is EqualUnmodifiableMapView) return _followStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_followStatus);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'FollowState(followStatus: $followStatus, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStateImpl &&
            const DeepCollectionEquality()
                .equals(other._followStatus, _followStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_followStatus), isLoading);

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      __$$FollowStateImplCopyWithImpl<_$FollowStateImpl>(this, _$identity);
}

abstract class _FollowState implements FollowState {
  const factory _FollowState(
      {required final Map<String, bool> followStatus,
      final bool isLoading}) = _$FollowStateImpl;

  @override
  Map<String, bool> get followStatus;
  @override
  bool get isLoading;

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
