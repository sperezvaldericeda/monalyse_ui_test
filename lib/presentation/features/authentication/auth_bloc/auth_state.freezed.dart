// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  ScreenStatus get screenStatus => throw _privateConstructorUsedError;
  UserAuthStatus get userAuthStatus => throw _privateConstructorUsedError;
  bool get isWelcomeTourFinished => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {ScreenStatus screenStatus,
      UserAuthStatus userAuthStatus,
      bool isWelcomeTourFinished});

  $ScreenStatusCopyWith<$Res> get screenStatus;
  $UserAuthStatusCopyWith<$Res> get userAuthStatus;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenStatus = null,
    Object? userAuthStatus = null,
    Object? isWelcomeTourFinished = null,
  }) {
    return _then(_value.copyWith(
      screenStatus: null == screenStatus
          ? _value.screenStatus
          : screenStatus // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      userAuthStatus: null == userAuthStatus
          ? _value.userAuthStatus
          : userAuthStatus // ignore: cast_nullable_to_non_nullable
              as UserAuthStatus,
      isWelcomeTourFinished: null == isWelcomeTourFinished
          ? _value.isWelcomeTourFinished
          : isWelcomeTourFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get screenStatus {
    return $ScreenStatusCopyWith<$Res>(_value.screenStatus, (value) {
      return _then(_value.copyWith(screenStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAuthStatusCopyWith<$Res> get userAuthStatus {
    return $UserAuthStatusCopyWith<$Res>(_value.userAuthStatus, (value) {
      return _then(_value.copyWith(userAuthStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenStatus screenStatus,
      UserAuthStatus userAuthStatus,
      bool isWelcomeTourFinished});

  @override
  $ScreenStatusCopyWith<$Res> get screenStatus;
  @override
  $UserAuthStatusCopyWith<$Res> get userAuthStatus;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenStatus = null,
    Object? userAuthStatus = null,
    Object? isWelcomeTourFinished = null,
  }) {
    return _then(_$AuthStateImpl(
      screenStatus: null == screenStatus
          ? _value.screenStatus
          : screenStatus // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      userAuthStatus: null == userAuthStatus
          ? _value.userAuthStatus
          : userAuthStatus // ignore: cast_nullable_to_non_nullable
              as UserAuthStatus,
      isWelcomeTourFinished: null == isWelcomeTourFinished
          ? _value.isWelcomeTourFinished
          : isWelcomeTourFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.screenStatus,
      required this.userAuthStatus,
      required this.isWelcomeTourFinished});

  @override
  final ScreenStatus screenStatus;
  @override
  final UserAuthStatus userAuthStatus;
  @override
  final bool isWelcomeTourFinished;

  @override
  String toString() {
    return 'AuthState(screenStatus: $screenStatus, userAuthStatus: $userAuthStatus, isWelcomeTourFinished: $isWelcomeTourFinished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.screenStatus, screenStatus) ||
                other.screenStatus == screenStatus) &&
            (identical(other.userAuthStatus, userAuthStatus) ||
                other.userAuthStatus == userAuthStatus) &&
            (identical(other.isWelcomeTourFinished, isWelcomeTourFinished) ||
                other.isWelcomeTourFinished == isWelcomeTourFinished));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, screenStatus, userAuthStatus, isWelcomeTourFinished);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final ScreenStatus screenStatus,
      required final UserAuthStatus userAuthStatus,
      required final bool isWelcomeTourFinished}) = _$AuthStateImpl;

  @override
  ScreenStatus get screenStatus;
  @override
  UserAuthStatus get userAuthStatus;
  @override
  bool get isWelcomeTourFinished;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
