import 'package:camera_app/themes/palette.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Palette.primary,
    primaryColorDark: Palette.primaryVariant,
    hintColor: Palette.secondary,
    scaffoldBackgroundColor: Palette.extraLightBackground,
    appBarTheme: const AppBarTheme(
      color: Palette.primary,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 24, // Reduced font size
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
        color: Colors.white, // Ensure visibility against the primary color
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Palette.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )),
        foregroundColor:
            MaterialStateProperty.all(Palette.extraLightBackground),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          color: Palette.extraLightBackground,
          fontSize: 16,
        )),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.w700,
        letterSpacing: 7.0,
        color: Palette.primary,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Palette.secondary,
      ),
    ),
    iconTheme: const IconThemeData(
      size: 36,
      color: Palette.primary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.extraLightBackground,
      selectedItemColor: Palette.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Palette.primary),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
    ),
  );
}
