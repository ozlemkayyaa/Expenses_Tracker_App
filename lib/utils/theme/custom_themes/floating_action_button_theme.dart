import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EFloatingActionButtonTheme {
  EFloatingActionButtonTheme._();

  // Light Theme
  static final lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    foregroundColor: EColors.white,
    backgroundColor: EColors.buttonPrimary,
    splashColor: EColors.buttonPrimary.withOpacity(0.5),
    elevation: 5,
    focusElevation: 5,
    hoverElevation: 5,
    highlightElevation: 5,
    shape: const CircleBorder(),
  );

  // Dark Theme
  static final darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    foregroundColor: EColors.white,
    backgroundColor: EColors.buttonPrimary,
    splashColor: EColors.buttonPrimary.withOpacity(0.5),
    elevation: 5,
    focusElevation: 5,
    hoverElevation: 5,
    highlightElevation: 5,
    shape: const CircleBorder(),
  );
}
