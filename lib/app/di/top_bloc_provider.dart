import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_event.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_bloc/splash_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_bloc/splash_event.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc.dart';

class TopBlocProviders extends StatelessWidget {
  final Widget child;
  final _getIt = GetIt.instance;

  TopBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _getIt<LanguagesBloc>()),
        BlocProvider(
          create: (context) => _getIt<AuthBloc>()
            ..add(
              const AuthEvent.checkForValidToken(),
            ),
        ),
        BlocProvider(
          create: (context) => _getIt<SplashBloc>()
            ..add(
              const SplashEvent.unSplashInNMilliseconds(3000),
            ),
        ),
      ],
      child: child,
    );
  }
}
