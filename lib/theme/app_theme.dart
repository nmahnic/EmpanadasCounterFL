import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary color
    primaryColor: primaryColor,

    // AppBar theme
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 10,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( primary: primaryColor)
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: const StadiumBorder(),
        elevation: 1
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: primaryColor ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primaryColor ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primaryColor ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide( color: primaryColor ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),
    )

  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Primary color
    primaryColor: Colors.green,

    // AppBar theme
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 10,
    ),

    scaffoldBackgroundColor: Colors.black
  );

}