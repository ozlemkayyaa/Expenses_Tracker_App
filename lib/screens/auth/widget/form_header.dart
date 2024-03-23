import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.paddingValue,
    required this.header,
    required this.headerMessage,
  });

  final String header;
  final String headerMessage;
  final double paddingValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingValue),
      child: Center(
        child: Column(
          children: [
            Text(
              header,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(ESizes.sm),
              child: Text(headerMessage,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          ],
        ),
      ),
    );
  }
}
