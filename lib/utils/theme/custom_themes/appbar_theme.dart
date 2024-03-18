import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EAppBarTheme {
  EAppBarTheme._();

  // Light Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: EColors.darkerGrey, size: ESizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: EColors.darkerGrey, size: ESizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: ESizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: EColors.black),
  );

  // Dark Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: EColors.grey, size: ESizes.iconMd),
    actionsIconTheme: IconThemeData(color: EColors.grey, size: ESizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: ESizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: EColors.white),
  );
}
