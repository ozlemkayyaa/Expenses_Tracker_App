import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EIconTheme {
  EIconTheme._();

  // Light Theme
  static const lightIconTheme = IconThemeData(
    color: EColors.darkerGrey,
    size: 24,
  );

  // Dark Theme
  static const darkIconTheme = IconThemeData(
    color: EColors.grey,
    size: 24,
  );
}
