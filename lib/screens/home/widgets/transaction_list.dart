import 'package:expenses_tracker/data/data.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Expanded(
      child: ListView.builder(
          itemCount: transactionsData.length,
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
                                    color: transactionsData[i]['color'],
                                    shape: BoxShape.circle),
                              ),
                              transactionsData[i]['icon'],
                            ],
                          ),
                          const SizedBox(width: ESizes.md),
                          Text(transactionsData[i]['name'],
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Column(
                        children: [
                          Text(transactionsData[i]['amount'],
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(transactionsData[i]['date'],
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
