import 'package:flutter/material.dart';

class CustomTheme{
  static ThemeData theme = ThemeData(
    fontFamily: 'Sunflower',
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: Colors.white, fontFamily: 'Parisienne', fontSize: 80.0),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 50.0,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

}