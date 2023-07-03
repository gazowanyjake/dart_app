   import 'package:flutter/material.dart';

final blueRedTheme = ThemeData(
          fontFamily: 'Rounded',
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFFD62839),
            onPrimary: Colors.white,
            outline: Colors.lightBlue,
          ),
        );