import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:monalyse_ui_test/app/di/di.dart' as app_di;
import 'package:monalyse_ui_test/app/constants/app_constants.dart';
import 'package:monalyse_ui_test/app/di/top_bloc_provider.dart';
import 'package:monalyse_ui_test/app/routes/app_routes.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc_state.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await app_di.initDi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: appRoutes,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TopBlocProviders(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
        ],
        child: BlocBuilder<LanguagesBloc, LanguageBlocState>(
          builder: (context, languageState) {
            return BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routeInformationProvider: _router.routeInformationProvider,
                  routeInformationParser: _router.routeInformationParser,
                  routerDelegate: _router.routerDelegate,
                  title: AppConstants.appName,
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: themeMode,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: languageState.locale,
                  supportedLocales: const [
                    Locale('es', ''),
                    Locale('en', ''),
                    Locale('nl', ''),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
