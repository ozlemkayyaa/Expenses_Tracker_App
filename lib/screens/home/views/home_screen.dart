import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/bloc/create_category_bloc/create_category_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/views/add_expense.dart';
import 'package:expenses_tracker/screens/home/views/main_screen.dart';
import 'package:expenses_tracker/screens/stats/stat_screen.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList = [
    const MainScreen(),
    const StatScreen(),
  ];

  int index = 0;
  late Color selectedColor;
  Color unselectedColor = EColors.darkGrey;

  @override
  void initState() {
    selectedColor = EColors.primary;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarMethod(dark),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BlocProvider(
                create: (context) => CreateCategoryBloc(FirebaseExpenseRepo()),
                child: const AddExpense(),
              ),
            ),
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
      body: index == 0 ? const MainScreen() : const StatScreen(),
    );
  }

  //  Bottom Navigation Bar Method

  ClipRRect bottomNavigationBarMethod(bool dark) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(ESizes.borderRadiusXxl)),
      child: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
          // ignore: avoid_print
          print(value);
        },
        backgroundColor: dark ? EColors.darkContainer : EColors.lightContainer,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: index == 0 ? selectedColor : unselectedColor,
            ),
            label: ETexts.bottomHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.graph_square,
              color: index == 1 ? selectedColor : unselectedColor,
            ),
            label: ETexts.bottomStats,
          ),
        ],
      ),
    );
  }
}
