import 'package:flutter/material.dart';

class EColors {
  EColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF00B2E7);
  static const Color secondary = Color(0xFFE064F7);
  static const Color tertiary = Color(0xFFFF8D6C);
  static const Color profile = Colors.amberAccent;

  // Text Colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Colors.white;
  static const Color buttonDisabled = Color(0xA0D9D9D9);

  // Border Colors
  static const Color borderPrimary = Color.fromARGB(255, 182, 182, 182);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // Transactions
  static const Color food = Colors.orangeAccent;
  static const Color shopping = Colors.deepPurpleAccent;
  static const Color entertainment = Color.fromARGB(255, 210, 18, 5);
  static const Color travel = Colors.cyan;
  static const Color petShop = Colors.indigo;
  static const Color home = Colors.lime;
  static const Color health = Colors.green;
  static const Color netflixYouTube = Colors.grey;
}
