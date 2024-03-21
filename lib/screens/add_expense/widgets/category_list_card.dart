import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: ESizes.sm),
      child: Container(
        decoration: BoxDecoration(
            color: dark ? EColors.darkContainer : EColors.lightContainer,
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
                        width: ESizes.xl,
                        height: ESizes.xl,
                        decoration: const BoxDecoration(
                            color: EColors.primary, shape: BoxShape.circle),
                      ),
                      const Icon(Icons.home),
                    ],
                  ),
                  const SizedBox(width: ESizes.md),
                  Text(ETexts.food,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
