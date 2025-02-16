import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_state.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/authentication_screen.dart';
import 'package:monalyse_ui_test/presentation/features/home/home_screen_v2.dart';
import 'package:monalyse_ui_test/presentation/widgets/custom_circular_loader.dart';
import 'dart:async';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.userAuthStatus.when(
          loggedIn: () => FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CustomCircularLoader(),
                  ),
                );
              } else {
                //return const HomeScreen();
                return const HomeScreenV2();
              }
            },
          ),
          unidentified: () => const AuthenticationScreen(),
          error: () => const Text('An error happened'),
        );
      },
    );
  }
}
