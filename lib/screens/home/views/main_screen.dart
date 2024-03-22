import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/screens/home/widgets/main_card.dart';
import 'package:expenses_tracker/screens/home/widgets/main_header.dart';
import 'package:expenses_tracker/screens/home/widgets/transaction_list.dart';
import 'package:expenses_tracker/screens/home/widgets/transactions.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final List<Expense> expenses;
  const MainScreen(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ESizes.lg, vertical: ESizes.sm),
        child: Column(
          children: [
            const MainHeader(),
            const SizedBox(height: ESizes.paddingXl),
            MainCard(expenses),
            const SizedBox(height: ESizes.paddingXl),
            const Transactions(),
            const SizedBox(height: ESizes.paddingXl),
            TransactionList(expenses),
          ],
        ),
      ),
    );
  }
}
