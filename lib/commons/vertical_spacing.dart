import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double _height;

  const VerticalSpacing(this._height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }

  factory VerticalSpacing.large() => const VerticalSpacing(22);
  factory VerticalSpacing.small() => const VerticalSpacing(8);
}
