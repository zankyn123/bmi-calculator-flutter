import 'package:flutter/material.dart';

class ReusableContainerWidget extends StatelessWidget {
  final Color colour;
  final Widget child;
  final double? margin;

  const ReusableContainerWidget({
    super.key,
    required this.colour,
    required this.child,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: colour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(margin ?? 0),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
