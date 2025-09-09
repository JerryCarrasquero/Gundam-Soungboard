import 'package:flutter/material.dart';

// Gundam RX-78 Color Palette
const Color kWhite = Colors.white;
const Color kYellow = Color(0xFFFFF86A); // RX-78 yellow
const Color kRed = Color(0xFFFF2D2D);   // RX-78 red
const Color kBlue = Color(0xFF2D4DB2);  // RX-78 blue
const Color kGrey = Color(0xFF5B5B6E);  // RX-78 grey

final ThemeData materialTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kBlue,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: kBlue,
    onPrimary: kWhite,
    secondary: kRed,
    onSecondary: kWhite,
    background: kWhite,
    onBackground: kGrey,
    surface: kWhite,
    onSurface: kGrey,
    error: kRed,
    onError: kWhite,
  ),
  scaffoldBackgroundColor: kWhite,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBlue,
    foregroundColor: kWhite,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: kGrey),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kBlue),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: kBlue,
    textTheme: ButtonTextTheme.primary,
  ),
  cardTheme: const CardThemeData(
    color: kWhite,
    elevation: 4,
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
  ),
);