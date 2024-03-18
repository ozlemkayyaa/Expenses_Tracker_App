import 'package:expenses_tracker/screens/stats/chart.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ESizes.lg, vertical: ESizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ETexts.transactions,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: ESizes.paddingXl),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ESizes.borderRadiusLg),
                  color: dark ? EColors.darkContainer : EColors.lightContainer),
              child: const Padding(
                padding: EdgeInsets.only(
                    right: ESizes.xs,
                    left: ESizes.xs,
                    top: ESizes.lg,
                    bottom: ESizes.md),
                child: Chart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
