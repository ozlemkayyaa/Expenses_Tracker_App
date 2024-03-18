import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EElevatedButtonTheme {
  EElevatedButtonTheme._();

  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: EColors.white,
      backgroundColor: EColors.buttonPrimary,
      disabledForegroundColor: EColors.darkGrey,
      disabledBackgroundColor: EColors.darkGrey,
      side: const BorderSide(color: EColors.buttonPrimary),
      padding: const EdgeInsets.symmetric(vertical: ESizes.paddingLg),
      textStyle: const TextStyle(
          fontSize: ESizes.fontSizeMd,
          color: Colors.white,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ESizes.borderRadiusLg)),
    ),
  );

  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: EColors.white,
      backgroundColor: EColors.buttonPrimary,
      disabledForegroundColor: EColors.darkGrey,
      disabledBackgroundColor: EColors.darkGrey,
      side: const BorderSide(color: EColors.buttonPrimary),
      padding: const EdgeInsets.symmetric(vertical: ESizes.paddingLg),
      textStyle: const TextStyle(
          fontSize: ESizes.fontSizeMd,
          color: EColors.white,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ESizes.borderRadiusLg)),
    ),
  );
}
