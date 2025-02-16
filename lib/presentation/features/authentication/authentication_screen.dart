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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.localizations.log_in_text),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.localizations.okey_text),
            ),
          ],
        );
      },
    );
  }

  void _validateAndLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog(context.localizations.fill_fields_text);
    } else {
      context.read<AuthBloc>().add(const AuthEvent.signInEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeMode>(
      listener: (context, state) {
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
                  color: isDarkMode
                      ? const Color.fromARGB(255, 62, 62, 62)
                      : AppColors.loginBackground,
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
                          controller: _usernameController,
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
                          controller: _passwordController,
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
                          onPressed: _validateAndLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkMode
                                ? AppColors.loginHintText
                                : AppColors.primaryWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                          ),
                          child: Text(
                            context.localizations.log_in_text,
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : AppColors.loginBackground,
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
