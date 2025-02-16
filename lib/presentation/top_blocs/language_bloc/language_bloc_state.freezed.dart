// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageBlocState {
  Locale get locale => throw _privateConstructorUsedError;

  /// Create a copy of LanguageBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageBlocStateCopyWith<LanguageBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageBlocStateCopyWith<$Res> {
  factory $LanguageBlocStateCopyWith(
          LanguageBlocState value, $Res Function(LanguageBlocState) then) =
      _$LanguageBlocStateCopyWithImpl<$Res, LanguageBlocState>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class _$LanguageBlocStateCopyWithImpl<$Res, $Val extends LanguageBlocState>
    implements $LanguageBlocStateCopyWith<$Res> {
  _$LanguageBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LanguageBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageBlocStateImplCopyWith<$Res>
    implements $LanguageBlocStateCopyWith<$Res> {
  factory _$$LanguageBlocStateImplCopyWith(_$LanguageBlocStateImpl value,
          $Res Function(_$LanguageBlocStateImpl) then) =
      __$$LanguageBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$LanguageBlocStateImplCopyWithImpl<$Res>
    extends _$LanguageBlocStateCopyWithImpl<$Res, _$LanguageBlocStateImpl>
    implements _$$LanguageBlocStateImplCopyWith<$Res> {
  __$$LanguageBlocStateImplCopyWithImpl(_$LanguageBlocStateImpl _value,
      $Res Function(_$LanguageBlocStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LanguageBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$LanguageBlocStateImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LanguageBlocStateImpl implements _LanguageBlocState {
  const _$LanguageBlocStateImpl({required this.locale});

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LanguageBlocState(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageBlocStateImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  /// Create a copy of LanguageBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageBlocStateImplCopyWith<_$LanguageBlocStateImpl> get copyWith =>
      __$$LanguageBlocStateImplCopyWithImpl<_$LanguageBlocStateImpl>(
          this, _$identity);
}

abstract class _LanguageBlocState implements LanguageBlocState {
  const factory _LanguageBlocState({required final Locale locale}) =
      _$LanguageBlocStateImpl;

  @override
  Locale get locale;

  /// Create a copy of LanguageBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageBlocStateImplCopyWith<_$LanguageBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
