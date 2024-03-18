import 'dart:math';

import 'package:expenses_tracker/screens/home/widgets/income_widget.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            EColors.primary,
            EColors.secondary,
            EColors.tertiary,
          ], transform: GradientRotation(pi / 4)),
          borderRadius: BorderRadius.circular(ESizes.borderRadiusXxl),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: dark ? EColors.darkerGrey : EColors.grey,
                offset: const Offset(5, 5))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(ETexts.totalBalance,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: EColors.textWhite)),
          const SizedBox(height: ESizes.md),
          Text(ETexts.expenseMoney,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(color: EColors.textWhite)),
          const Padding(
            padding: EdgeInsets.symmetric(
                vertical: ESizes.md, horizontal: ESizes.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IncomeWidget(
                  title: ETexts.income,
                  money: ETexts.incomeExpense,
                ),
                IncomeWidget(
                    title: ETexts.expenses, money: ETexts.expensesMoney)
              ],
            ),
          )
        ],
      ),
    );
  }
}
