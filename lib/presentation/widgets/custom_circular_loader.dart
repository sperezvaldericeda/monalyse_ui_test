import 'package:flutter/material.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';

class CustomCircularLoader extends StatelessWidget {
  const CustomCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(
          color: isDarkMode ? AppColors.loginText : AppColors.loginBackground,
          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
          strokeWidth: 3,
        ),
      ),
    );
  }
}
