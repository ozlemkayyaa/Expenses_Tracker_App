import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:expenses_tracker/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Tracker',
        themeMode: ThemeMode.system,
        theme: ExpensesTrackerAppTheme.lightTheme,
        darkTheme: ExpensesTrackerAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
