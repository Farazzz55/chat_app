import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData appTheme=ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
      titleSmall: TextStyle(
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.w700
      )
    )
  );
}