import 'package:flutter/material.dart';

const Color lightGrey = Color.fromRGBO(127, 127, 127, 1.0);
const Color darkGrey = Color.fromRGBO(133, 133, 151, 1.0);
const Color fillColor = Color.fromRGBO(205, 205, 205, 0.2);
const Color successGreen = Color.fromRGBO(66, 208, 0, 1.0);

const Color primaryColor = Color.fromRGBO(112, 135, 255, 1.0);
const Color onPrimaryColor = Colors.white;
const Color secondaryColor = Color.fromRGBO(112, 135, 255, 1.0);
const Color onSecondaryColor = Colors.black;
const Color errorColor = Color.fromRGBO(255, 0, 0, 1.0);
const Color onErrorColor = Colors.white;
const Color surfaceColor = Colors.white;
const Color onSurfaceColor = Colors.black;

OutlineInputBorder _getBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: const BorderRadius.all(Radius.circular(50)),
  );
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primaryColor,

  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    onSecondary: lightGrey,
    error: errorColor,
    onError: onErrorColor,
    surface: surfaceColor,
    onSurface: darkGrey,
  ),

  // Text Theme
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: onSurfaceColor),
    titleLarge: TextStyle(color: onSurfaceColor),
    titleMedium: TextStyle(color: onSurfaceColor),
    titleSmall: TextStyle(color: onSurfaceColor),
    bodyLarge: TextStyle(color: onSurfaceColor),
    bodyMedium: TextStyle(color: onSurfaceColor),
    bodySmall: TextStyle(color: onSurfaceColor),
  ),
  // Elevated Button Theme
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
      foregroundColor: WidgetStatePropertyAll(onPrimaryColor),
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 48)),
      textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  ),

  // [Text Button Theme]
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 48)),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
    ),
  ),

  // [Check Box Theme]
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),

  // [Text Field Theme]
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: fillColor,
    focusColor: primaryColor,
    border: _getBorder(fillColor),
    enabledBorder: _getBorder(fillColor),
    focusedBorder: _getBorder(fillColor),
    errorBorder: _getBorder(errorColor),
    focusedErrorBorder: _getBorder(errorColor),
    hintStyle: const TextStyle(color: lightGrey, fontWeight: FontWeight.normal),
  ),
);
