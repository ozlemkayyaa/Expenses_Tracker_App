import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(ETexts.transactions,
            style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          onPressed: () {},
          child:
              Text(ETexts.view, style: Theme.of(context).textTheme.bodySmall),
        )
      ],
    );
  }
}
