import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF007BFF); // Blue
const Color secondaryColor = Color(0xFFF0F0F0); // White
const Color errorColor = Color(0xFFFF0000); // Red

const ColorScheme kColorScheme = ColorScheme(
  primary: primaryColor,
  secondary: secondaryColor,
  error: errorColor,
  brightness: Brightness.light,
  onPrimary: secondaryColor,
  onSecondary: primaryColor,
  onError: errorColor,
  surface: secondaryColor,
  onSurface: primaryColor,
);
