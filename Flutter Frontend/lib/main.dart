import 'package:flutter/material.dart';
import 'package:kims_care/screens/welcome_screen.dart';
import 'package:kims_care/theme/app_colors.dart';

void main() {
  runApp(const KimsCareApp());
}

class KimsCareApp extends StatelessWidget {
  const KimsCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppTheme.themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'KIMS Care',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}