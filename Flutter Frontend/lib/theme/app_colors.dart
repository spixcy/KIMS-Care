import 'package:flutter/material.dart';

class AppTheme {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark);

  static void toggleTheme() {
    if (themeNotifier.value == ThemeMode.dark) {
      themeNotifier.value = ThemeMode.light;
    } else {
      themeNotifier.value = ThemeMode.dark;
    }
  }

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF090A1A);
  static const Color darkCardColor = Color(0xFF1C1E3A);
  static const Color darkPrimaryText = Colors.white;
  static const Color darkSecondaryText = Color(0xFF9E9E9E);
  static const Color darkAccent = Color(0xFFB1B2FF);
  static const Color darkIconBackground = Color(0xFF2E315A);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF9FAFC);
  static const Color lightCardColor = Colors.white;
  static const Color lightPrimaryText = Color(0xFF131538);
  static const Color lightSecondaryText = Color(0xFF6E6E85);
  static const Color lightAccent = Color(0xFF6A60FF);
  static const Color lightIconBackground = Color(0xFFE8E9FA);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      primaryColor: lightAccent,
      fontFamily: 'Montserrat',
      useMaterial3: true,
      cardColor: lightCardColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: lightPrimaryText),
        bodyMedium: TextStyle(color: lightPrimaryText),
      ),
      colorScheme: ColorScheme.light(
        surface: lightCardColor,
        primary: lightAccent,
        onPrimary: Colors.white,
        secondary: lightAccent,
        onSurface: lightPrimaryText,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: darkAccent,
      fontFamily: 'Montserrat',
      useMaterial3: true,
      cardColor: darkCardColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: darkPrimaryText),
        bodyMedium: TextStyle(color: darkPrimaryText),
      ),
      colorScheme: ColorScheme.dark(
        surface: darkCardColor,
        primary: darkAccent,
        onPrimary: darkBackground,
        secondary: darkAccent,
        onSurface: darkPrimaryText,
      ),
    );
  }

  // Helper methods to get colors dynamically if not using ThemeData fully
  static Color getBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : lightBackground;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCardColor
        : lightCardColor;
  }

  static Color getPrimaryText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkPrimaryText
        : lightPrimaryText;
  }

  static Color getSecondaryText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSecondaryText
        : lightSecondaryText;
  }

  static Color getAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkAccent
        : lightAccent;
  }

  static Color getIconBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkIconBackground
        : lightIconBackground;
  }
}
