import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomeWidget extends StatelessWidget {
  const IncomeWidget({
    super.key,
    required this.title,
    required this.money,
  });

  final String title;
  final String money;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: dark ? EColors.darkContainer : EColors.darkContainer,
              shape: BoxShape.circle),
          child: const Center(
              child: Icon(
            CupertinoIcons.arrow_down,
            color: EColors.grey,
            size: ESizes.md,
          )),
        ),
        const SizedBox(width: ESizes.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: EColors.textWhite),
            ),
            Text(
              money,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: EColors.textWhite),
            )
          ],
        )
      ],
    );
  }
}
