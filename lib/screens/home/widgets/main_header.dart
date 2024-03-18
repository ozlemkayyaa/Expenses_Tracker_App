import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: EColors.profile,
                  ),
                ),
                const Icon(CupertinoIcons.person_fill)
              ],
            ),
            const SizedBox(width: ESizes.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ETexts.welcome,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: EColors.darkGrey)),
                Text(ETexts.userName,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            )
          ],
        ),
        const Icon(CupertinoIcons.settings)
      ],
    );
  }
}
