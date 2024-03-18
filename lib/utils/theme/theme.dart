import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/appbar_theme.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/bottom_navigation_theme.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/floating_action_button_theme.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/icon_theme.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/text_field_theme.dart';
import 'package:expenses_tracker/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ExpensesTrackerAppTheme {
  ExpensesTrackerAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Raleway',
    brightness: Brightness.light,
    primaryColor: EColors.primary,
    textTheme: ETextTheme.lightTextTheme,
    iconTheme: EIconTheme.lightIconTheme,
    scaffoldBackgroundColor: EColors.white,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    floatingActionButtonTheme:
        EFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
    bottomNavigationBarTheme: EBottomNavigationTheme.lightBottomNavigationTheme,
    buttonTheme: const ButtonThemeData(buttonColor: EColors.lightGrey),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    primaryColor: EColors.primary,
    textTheme: ETextTheme.darkTextTheme,
    iconTheme: EIconTheme.darkIconTheme,
    scaffoldBackgroundColor: EColors.black,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    floatingActionButtonTheme:
        EFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
    bottomNavigationBarTheme: EBottomNavigationTheme.darkBottomNavigationTheme,
    buttonTheme: const ButtonThemeData(buttonColor: EColors.darkGrey),
  );
}
