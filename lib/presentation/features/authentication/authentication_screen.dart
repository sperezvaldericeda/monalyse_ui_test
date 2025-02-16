import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';
import 'package:monalyse_ui_test/app/extensions/context_extensions.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_event.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/theme_cubit/theme_cubit.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeMode>(
      listener: (context, state) {
        // Se ejecuta cuando cambia el tema, forzando la actualización
        setState(() {});
      },
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final isDarkMode = themeMode == ThemeMode.dark;

          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  isDarkMode ? Colors.grey[900] : AppColors.loginBackground,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
              ],
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black : AppColors.loginBackground,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color:
                                isDarkMode ? Colors.white : AppColors.loginText,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/logos/monalyse_logo_2.jpeg',
                              width: 120,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: context.localizations.user_text,
                            hintStyle: TextStyle(
                                color: isDarkMode
                                    ? Colors.white54
                                    : AppColors.loginHintText),
                            filled: true,
                            fillColor: isDarkMode
                                ? Colors.grey[850]
                                : Colors.white.withAlpha((0.1 * 255).toInt()),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                          ),
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : AppColors.loginText),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: context.localizations.password_text,
                            hintStyle: TextStyle(
                                color: isDarkMode
                                    ? Colors.white54
                                    : AppColors.loginHintText),
                            filled: true,
                            fillColor: isDarkMode
                                ? Colors.grey[850]
                                : AppColors.loginText
                                    .withAlpha((0.1 * 255).toInt()),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                          ),
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : AppColors.loginText),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.signInEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkMode
                                ? Colors.blueGrey[700]
                                : AppColors.loginButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                          child: Text(
                            context.localizations.log_in_text,
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : AppColors.loginText,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
