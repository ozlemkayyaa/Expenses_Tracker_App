import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/bloc/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:expenses_tracker/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: BlocProvider(
          create: (context) =>
              GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
          child: const HomeScreen(),
        ));
  }
}
