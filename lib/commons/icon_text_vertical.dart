import 'package:flutter/material.dart';

class IconTextVertical extends StatelessWidget {
  final IconData icons;
  final String text;

  const IconTextVertical({
    super.key,
    required this.icons,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons, size: 54),
        Text(text),
      ],
    );
  }
}
