import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF171717),
  textTheme: TextTheme(
    bodySmall: TextStyle(fontSize: 12, color: Colors.grey.shade600),
    bodyMedium: TextStyle(
      fontSize: 13.5,
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade200,
    ),
    bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: redBorder,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

// Add Post

const categroyTitle = 'Categories This Project';
const videoUpload = 'Select a video from Gallery';
const thumbUpload = 'Add a Thumbnail';

// color

const redBorder = Color(0xAFC70000);
