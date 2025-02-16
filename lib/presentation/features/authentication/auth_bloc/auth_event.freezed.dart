// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInEvent,
    required TResult Function() signOutEvent,
    required TResult Function() checkForValidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInEvent,
    TResult? Function()? signOutEvent,
    TResult? Function()? checkForValidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInEvent,
    TResult Function()? signOutEvent,
    TResult Function()? checkForValidToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_SignOutEvent value) signOutEvent,
    required TResult Function(_CheckForValidToken value) checkForValidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_SignOutEvent value)? signOutEvent,
    TResult? Function(_CheckForValidToken value)? checkForValidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_SignOutEvent value)? signOutEvent,
    TResult Function(_CheckForValidToken value)? checkForValidToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInEventImplCopyWith<$Res> {
  factory _$$SignInEventImplCopyWith(
          _$SignInEventImpl value, $Res Function(_$SignInEventImpl) then) =
      __$$SignInEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInEventImpl>
    implements _$$SignInEventImplCopyWith<$Res> {
  __$$SignInEventImplCopyWithImpl(
      _$SignInEventImpl _value, $Res Function(_$SignInEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInEventImpl implements _SignInEvent {
  const _$SignInEventImpl();

  @override
  String toString() {
    return 'AuthEvent.signInEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInEvent,
    required TResult Function() signOutEvent,
    required TResult Function() checkForValidToken,
  }) {
    return signInEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInEvent,
    TResult? Function()? signOutEvent,
    TResult? Function()? checkForValidToken,
  }) {
    return signInEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInEvent,
    TResult Function()? signOutEvent,
    TResult Function()? checkForValidToken,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_SignOutEvent value) signOutEvent,
    required TResult Function(_CheckForValidToken value) checkForValidToken,
  }) {
    return signInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_SignOutEvent value)? signOutEvent,
    TResult? Function(_CheckForValidToken value)? checkForValidToken,
  }) {
    return signInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_SignOutEvent value)? signOutEvent,
    TResult Function(_CheckForValidToken value)? checkForValidToken,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(this);
    }
    return orElse();
  }
}

abstract class _SignInEvent implements AuthEvent {
  const factory _SignInEvent() = _$SignInEventImpl;
}

/// @nodoc
abstract class _$$SignOutEventImplCopyWith<$Res> {
  factory _$$SignOutEventImplCopyWith(
          _$SignOutEventImpl value, $Res Function(_$SignOutEventImpl) then) =
      __$$SignOutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutEventImpl>
    implements _$$SignOutEventImplCopyWith<$Res> {
  __$$SignOutEventImplCopyWithImpl(
      _$SignOutEventImpl _value, $Res Function(_$SignOutEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutEventImpl implements _SignOutEvent {
  const _$SignOutEventImpl();

  @override
  String toString() {
    return 'AuthEvent.signOutEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInEvent,
    required TResult Function() signOutEvent,
    required TResult Function() checkForValidToken,
  }) {
    return signOutEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInEvent,
    TResult? Function()? signOutEvent,
    TResult? Function()? checkForValidToken,
  }) {
    return signOutEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInEvent,
    TResult Function()? signOutEvent,
    TResult Function()? checkForValidToken,
    required TResult orElse(),
  }) {
    if (signOutEvent != null) {
      return signOutEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_SignOutEvent value) signOutEvent,
    required TResult Function(_CheckForValidToken value) checkForValidToken,
  }) {
    return signOutEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_SignOutEvent value)? signOutEvent,
    TResult? Function(_CheckForValidToken value)? checkForValidToken,
  }) {
    return signOutEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_SignOutEvent value)? signOutEvent,
    TResult Function(_CheckForValidToken value)? checkForValidToken,
    required TResult orElse(),
  }) {
    if (signOutEvent != null) {
      return signOutEvent(this);
    }
    return orElse();
  }
}

abstract class _SignOutEvent implements AuthEvent {
  const factory _SignOutEvent() = _$SignOutEventImpl;
}

/// @nodoc
abstract class _$$CheckForValidTokenImplCopyWith<$Res> {
  factory _$$CheckForValidTokenImplCopyWith(_$CheckForValidTokenImpl value,
          $Res Function(_$CheckForValidTokenImpl) then) =
      __$$CheckForValidTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckForValidTokenImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckForValidTokenImpl>
    implements _$$CheckForValidTokenImplCopyWith<$Res> {
  __$$CheckForValidTokenImplCopyWithImpl(_$CheckForValidTokenImpl _value,
      $Res Function(_$CheckForValidTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckForValidTokenImpl implements _CheckForValidToken {
  const _$CheckForValidTokenImpl();

  @override
  String toString() {
    return 'AuthEvent.checkForValidToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckForValidTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInEvent,
    required TResult Function() signOutEvent,
    required TResult Function() checkForValidToken,
  }) {
    return checkForValidToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signInEvent,
    TResult? Function()? signOutEvent,
    TResult? Function()? checkForValidToken,
  }) {
    return checkForValidToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInEvent,
    TResult Function()? signOutEvent,
    TResult Function()? checkForValidToken,
    required TResult orElse(),
  }) {
    if (checkForValidToken != null) {
      return checkForValidToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_SignOutEvent value) signOutEvent,
    required TResult Function(_CheckForValidToken value) checkForValidToken,
  }) {
    return checkForValidToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_SignOutEvent value)? signOutEvent,
    TResult? Function(_CheckForValidToken value)? checkForValidToken,
  }) {
    return checkForValidToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_SignOutEvent value)? signOutEvent,
    TResult Function(_CheckForValidToken value)? checkForValidToken,
    required TResult orElse(),
  }) {
    if (checkForValidToken != null) {
      return checkForValidToken(this);
    }
    return orElse();
  }
}

abstract class _CheckForValidToken implements AuthEvent {
  const factory _CheckForValidToken() = _$CheckForValidTokenImpl;
}
