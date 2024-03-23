import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ETextButtonTheme {
  ETextButtonTheme._();

  // Light Theme
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: EColors.primary,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: ESizes.paddingLg),
      textStyle: const TextStyle(
        fontSize: ESizes.fontSizeSm,
        color: EColors.primary,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ESizes.borderRadiusLg),
      ),
    ),
  );

  // Dark Theme
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: EColors.primary,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: ESizes.paddingLg),
      textStyle: const TextStyle(
        fontSize: ESizes.fontSizeSm,
        color: EColors.primary,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ESizes.borderRadiusLg),
      ),
    ),
  );
}
