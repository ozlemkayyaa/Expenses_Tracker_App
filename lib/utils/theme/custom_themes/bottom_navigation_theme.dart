import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class EBottomNavigationTheme {
  EBottomNavigationTheme._();

  // Light Tema
  static final lightBottomNavigationTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: EColors.primary,
    unselectedItemColor: EColors.darkGrey,
    elevation: 5,
    selectedLabelStyle: ETextTheme.lightTextTheme.labelLarge,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );

  // Dark Tema

  static final darkBottomNavigationTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: EColors.primary,
    unselectedItemColor: EColors.darkGrey,
    elevation: 5,
    selectedLabelStyle: ETextTheme.lightTextTheme.labelMedium,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );
}
