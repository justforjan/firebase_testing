import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.purple;
const COLOR_SECONDARY = Color.fromRGBO(206, 147, 216, 1);
const SURFACE = Color.fromRGBO(224, 224, 224, 1);

ThemeData origTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  useMaterial3: false,
  textTheme: textTheme,
  brightness: Brightness.light,
);

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    tertiary: Colors.black,
    onTertiary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: SURFACE,
    onSurface: Colors.black,
  ),
  useMaterial3: true,
  textTheme: textTheme,
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

TextTheme textTheme = const TextTheme();
