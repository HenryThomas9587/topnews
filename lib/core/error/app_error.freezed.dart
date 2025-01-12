// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AppError {
  const factory NetworkError(final String message) = _$NetworkErrorImpl;

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NotFoundErrorImplCopyWith(
          _$NotFoundErrorImpl value, $Res Function(_$NotFoundErrorImpl) then) =
      __$$NotFoundErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NotFoundErrorImpl>
    implements _$$NotFoundErrorImplCopyWith<$Res> {
  __$$NotFoundErrorImplCopyWithImpl(
      _$NotFoundErrorImpl _value, $Res Function(_$NotFoundErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundErrorImpl implements NotFoundError {
  const _$NotFoundErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      __$$NotFoundErrorImplCopyWithImpl<_$NotFoundErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundError implements AppError {
  const factory NotFoundError(final String message) = _$NotFoundErrorImpl;

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements ServerError {
  const _$ServerErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AppError {
  const factory ServerError(final String message) = _$ServerErrorImpl;

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnauthorizedErrorImplCopyWith(_$UnauthorizedErrorImpl value,
          $Res Function(_$UnauthorizedErrorImpl) then) =
      __$$UnauthorizedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnauthorizedErrorImpl>
    implements _$$UnauthorizedErrorImplCopyWith<$Res> {
  __$$UnauthorizedErrorImplCopyWithImpl(_$UnauthorizedErrorImpl _value,
      $Res Function(_$UnauthorizedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedErrorImpl implements UnauthorizedError {
  const _$UnauthorizedErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      __$$UnauthorizedErrorImplCopyWithImpl<_$UnauthorizedErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedError implements AppError {
  const factory UnauthorizedError(final String message) =
      _$UnauthorizedErrorImpl;

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl implements UnknownError {
  const _$UnknownErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements AppError {
  const factory UnknownError(final String message) = _$UnknownErrorImpl;

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$CustomErrorImplCopyWith(
          _$CustomErrorImpl value, $Res Function(_$CustomErrorImpl) then) =
      __$$CustomErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CustomErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$CustomErrorImpl>
    implements _$$CustomErrorImplCopyWith<$Res> {
  __$$CustomErrorImplCopyWithImpl(
      _$CustomErrorImpl _value, $Res Function(_$CustomErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CustomErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomErrorImpl implements CustomError {
  const _$CustomErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.custom(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomErrorImplCopyWith<_$CustomErrorImpl> get copyWith =>
      __$$CustomErrorImplCopyWithImpl<_$CustomErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(String message) custom,
  }) {
    return custom(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(String message)? custom,
  }) {
    return custom?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(String message)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(CustomError value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(CustomError value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(CustomError value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class CustomError implements AppError {
  const factory CustomError(final String message) = _$CustomErrorImpl;

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomErrorImplCopyWith<_$CustomErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
