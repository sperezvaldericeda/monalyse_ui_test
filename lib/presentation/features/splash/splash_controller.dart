import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:monalyse_ui_test/app/routes/app_paths.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_bloc/splash_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_bloc/splash_state.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_screen.dart';

class SplashController extends StatelessWidget {
  const SplashController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.isSplashed()) {
          context.go(AppRoutePath.authController);
        }
      },
      builder: (context, state) {
        return const SplashScreen();
      },
    );
  }
}
