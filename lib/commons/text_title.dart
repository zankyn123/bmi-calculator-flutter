import 'package:bmi_calculator/constant/constant.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;

  const TextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.merge(TextStyle(color: kInactiveColor)),
    );
  }
}
