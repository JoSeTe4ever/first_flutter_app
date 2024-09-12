import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  secondaryHeaderColor: Colors.purpleAccent,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.purpleAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
  ),
);
