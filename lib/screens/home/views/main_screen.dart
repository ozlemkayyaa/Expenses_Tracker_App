import 'package:expenses_tracker/screens/home/widgets/main_card.dart';
import 'package:expenses_tracker/screens/home/widgets/main_header.dart';
import 'package:expenses_tracker/screens/home/widgets/transaction_list.dart';
import 'package:expenses_tracker/screens/home/widgets/transactions.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ESizes.lg, vertical: ESizes.sm),
        child: Column(
          children: [
            MainHeader(),
            SizedBox(height: ESizes.paddingXl),
            MainCard(),
            SizedBox(height: ESizes.paddingXl),
            Transactions(),
            SizedBox(height: ESizes.paddingXl),
            TransactionList()
          ],
        ),
      ),
    );
  }
}
