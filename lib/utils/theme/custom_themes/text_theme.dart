import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ETextTheme {
  ETextTheme._();

  // Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    // 3 tür Headline
    headlineLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXxl,
        fontWeight: FontWeight.bold,
        color: EColors.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: EColors.black),
    headlineSmall: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: EColors.black),

    // 3 tür Title
    titleLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: EColors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeMd,
        fontWeight: FontWeight.w500,
        color: EColors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeMd,
        fontWeight: FontWeight.w400,
        color: EColors.black),

    // 3 tür Body(Gövde)
    bodyLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        fontWeight: FontWeight.w500,
        color: EColors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: EColors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        fontWeight: FontWeight.w500,
        color: EColors.black.withOpacity(0.5)),

    // 2 tür LabelText (Etiket Yazısı)
    labelLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXs,
        fontWeight: FontWeight.normal,
        color: EColors.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXs,
        fontWeight: FontWeight.normal,
        color: EColors.black.withOpacity(0.5)),
  );

  // Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    // 3 tür Headline
    headlineLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXxl,
        fontWeight: FontWeight.bold,
        color: EColors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: EColors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: EColors.white),

    // 3 tür Title
    titleLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: EColors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeMd,
        fontWeight: FontWeight.w500,
        color: EColors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeMd,
        fontWeight: FontWeight.w400,
        color: EColors.white),

    // 3 tür Body(Gövde)
    bodyLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        fontWeight: FontWeight.w500,
        color: EColors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        fontWeight: FontWeight.normal,
        color: EColors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        fontWeight: FontWeight.w500,
        color: EColors.white.withOpacity(0.5)),

    // 2 tür LabelText (Etiket Yazısı)
    labelLarge: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXs,
        fontWeight: FontWeight.normal,
        color: EColors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeXs,
        fontWeight: FontWeight.normal,
        color: EColors.white.withOpacity(0.5)),
  );
}
