import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/data/data.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/constants.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Expense> expenses;
  const TransactionList(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Expanded(
      child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, int i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: ESizes.sm),
              child: Container(
                decoration: BoxDecoration(
                    color:
                        dark ? EColors.darkContainer : EColors.lightContainer,
                    borderRadius: BorderRadius.circular(ESizes.borderRadiusLg)),
                child: Padding(
                  padding: const EdgeInsets.all(ESizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: ESizes.containerSize,
                                height: ESizes.containerSize,
                                decoration: BoxDecoration(
                                    color: Color(expenses[i].category.color),
                                    shape: BoxShape.circle),
                              ),
                              Image.asset(
                                expenses[i].category.icon,
                                scale: 2,
                              ),
                            ],
                          ),
                          const SizedBox(width: ESizes.md),
                          Text(expenses[i].category.name,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Column(
                        children: [
                          Text("\$${expenses[i].amount}.00",
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                              DateFormat(ETexts.dateFormat)
                                  .format(expenses[i].date),
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
