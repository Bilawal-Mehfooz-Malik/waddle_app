import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightGrey = Color.fromRGBO(127, 127, 127, 1.0);
const Color darkGrey = Color.fromRGBO(133, 133, 151, 1.0);
const Color fillColor = Color.fromRGBO(205, 205, 205, 0.2);
const Color successGreen = Color.fromRGBO(66, 208, 0, 1.0);
const Color lightBottomNavColor = Color.fromRGBO(228, 228, 228, 1);

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
    onSecondary: onSecondaryColor,
    error: errorColor,
    onError: onErrorColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
  ),

  // Text Theme
  textTheme: TextTheme(
    headlineMedium:
        GoogleFonts.inter(color: onSurfaceColor, fontWeight: FontWeight.w700),
    headlineSmall:
        GoogleFonts.inter(color: onSurfaceColor, fontWeight: FontWeight.w700),
    titleLarge:
        GoogleFonts.inter(color: onSurfaceColor, fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.inter(color: onSurfaceColor),
    titleSmall: GoogleFonts.inter(color: onSurfaceColor),
    bodyLarge: GoogleFonts.inter(color: onSurfaceColor),
    bodyMedium: GoogleFonts.inter(color: onSurfaceColor),
    bodySmall: GoogleFonts.inter(color: onSurfaceColor),
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

  // dialog theme
  dialogTheme: const DialogTheme(
    titleTextStyle: TextStyle(
      fontSize: 22,
      color: onSecondaryColor,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(color: lightGrey),
  ),

  // [Navigation bar theme]
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    backgroundColor: lightBottomNavColor,
    selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
    unselectedIconTheme: IconThemeData(color: onSecondaryColor, size: 35),
  ),
);
