import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_state.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/authentication_screen.dart';
import 'package:monalyse_ui_test/presentation/features/home/home_screen.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.userAuthStatus.when(
          unidentified: () => const AuthenticationScreen(),
          loggedIn: () => const HomeScreen(),
          error: () => const Text('An error happened'),
        );
      },
    );
  }
}
