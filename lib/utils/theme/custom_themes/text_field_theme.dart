import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ETextFormFieldTheme {
  ETextFormFieldTheme._();

  // Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: EColors.darkGrey,
    suffixIconColor: EColors.darkGrey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: ESizes.fontSizeSm, color: EColors.darkGrey),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ESizes.fontSizeSm, color: EColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: EColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 2, color: EColors.warning),
    ),
  );

  // Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: EColors.darkGrey,
    suffixIconColor: EColors.darkGrey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: ESizes.fontSizeSm, color: EColors.grey),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ESizes.fontSizeSm, color: EColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: EColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: EColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.borderRadiusXl),
      borderSide: const BorderSide(width: 2, color: EColors.warning),
    ),
  );
}
