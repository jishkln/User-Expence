import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightThemeDataCustom = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color.fromARGB(255, 103, 230, 19),
      onPrimary: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFf37b67),
      onSecondary: const Color(0xFFFFFFFF),
      error: const Color(0xFFBA1A1A),
      onError: const Color(0xFFFFFFFF),
      background: const Color(0xFFFEFFFF),
      onBackground: const Color(0xFF3b3b3b),
      surface: const Color(0xFFFEFFFF),
      onSurface: const Color(0xFF3b3b3b),
    ),
    textTheme: GoogleFonts.emilysCandyTextTheme(ThemeData.light().textTheme),
  );
}

final ThemeData darkThemeDataCustom = _buildDarkTheme();
ThemeData _buildDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();

  return darkTheme.copyWith(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      primary: const Color(0xFFADC6FF),
      onPrimary: const Color(0xFF002E69),
      secondary: const Color(0xFFBBC6E4),
      onSecondary: const Color(0xFF253048),
      error: const Color(0xFFFFB4AB),
      onError: const Color(0xFF690005),
      background: const Color(0xFF1B1B1F),
      onBackground: const Color(0xFFE3E2E6),
      surface: const Color(0xFF1B1B1F),
      onSurface: const Color(0xFFE3E2E6),
      primaryContainer: const Color(0xff3700b3),
      secondaryContainer: const Color(0xff018786),
    ),
    textTheme: GoogleFonts.emilysCandyTextTheme(ThemeData.dark().textTheme),
  );
}
