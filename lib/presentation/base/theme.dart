import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeManager {

  static final ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: getFontFamily(),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300
          )
      ),
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );

  static String? getFontFamily() {
    // if (Platform.environment['FLUTTER_TEST'] == 'true') {
    //   return null;
    // }else {
    //   return 'SomarSans';
    // }
    return 'SomarSans';
  }
}