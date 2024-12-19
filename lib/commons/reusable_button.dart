import 'package:bmi_calculator/constant/constant.dart';
import 'package:flutter/material.dart';

class ReusableButtonWidget extends StatelessWidget {
  final bool enable;
  final Widget child;
  final Color backgroundColor;
  final void Function()? onPress;

  const ReusableButtonWidget({
    super.key,
    required this.enable,
    required this.backgroundColor,
    required this.child,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: InkSplash.splashFactory,
        backgroundColor: backgroundColor,
        textStyle: Theme.of(context).textTheme.bodyMedium,
        foregroundColor: enable
            ? Theme.of(context).textTheme.bodyMedium?.color
            : kInactiveColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enableFeedback: false,
        padding: const EdgeInsets.symmetric(vertical: 12),
        // disabledForegroundColor: Colors.grey.shade600,
      ),
      onPressed: onPress,
      child: child,
    );
  }
}
