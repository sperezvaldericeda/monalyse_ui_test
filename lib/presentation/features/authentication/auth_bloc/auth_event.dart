import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInEvent() = _SignInEvent;

  const factory AuthEvent.signOutEvent() = _SignOutEvent;

  const factory AuthEvent.checkForValidToken() = _CheckForValidToken;
}
