import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monalyse_ui_test/app/types/auth_status.dart';
import 'package:monalyse_ui_test/app/types/screen_status.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required ScreenStatus screenStatus,
    required UserAuthStatus userAuthStatus,
    required bool isWelcomeTourFinished,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      screenStatus: ScreenStatus.initial(),
      userAuthStatus: UserAuthStatus.unidentified(),
      isWelcomeTourFinished: false,
    );
  }
}
