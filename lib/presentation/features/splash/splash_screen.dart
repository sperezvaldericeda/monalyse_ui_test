import 'package:flutter/material.dart';
import 'package:monalyse_ui_test/app/config/app_fonts.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              'Monalyse',
              style: AppFonts.bodyMd.copyWith(color: AppColors.primaryWhite),
            ),
            const Divider(
              color: Colors.white,
              endIndent: 15,
              indent: 15,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
