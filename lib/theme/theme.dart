import 'package:flutter/material.dart';

const baseTextColor = Colors.black87;
const secondaryTextColor = Colors.black54;

final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    useMaterial3: true,
    dividerTheme: const DividerThemeData(
      color: secondaryTextColor,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: baseTextColor,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: baseTextColor,
        ),
        labelSmall: TextStyle(
          color: secondaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        )));
