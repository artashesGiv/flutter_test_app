import 'package:flutter/material.dart';

const baseTextColor = Colors.black87;
const secondaryTextColor = Colors.black54;

final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    useMaterial3: true,
    dividerTheme: const DividerThemeData(
      color: secondaryTextColor,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: baseTextColor,
    ),
    textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: baseTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          color: baseTextColor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: baseTextColor,
        ),
        labelMedium: TextStyle(
          color: secondaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        labelSmall: TextStyle(
          color: secondaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        )));
