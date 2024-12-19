import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double width = 8;

  const HorizontalSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
