import 'package:flutter/material.dart';

class MinusPlusButtonsWidget extends StatelessWidget {
  final void Function() onMinusPressed;
  final void Function() onPlusPressed;

  const MinusPlusButtonsWidget({
    super.key,
    required this.onMinusPressed,
    required this.onPlusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          style: TextButton.styleFrom(
            splashFactory: InkSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.all(0),
            backgroundColor: const Color(0xff222747),
            shape: const CircleBorder(),
          ),
          onPressed: () {
            onMinusPressed();
            // setState(() {
            //   bmiBrain.modifyAge(false);
            // });
          },
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {
            onPlusPressed();
          },
          style: TextButton.styleFrom(
            splashFactory: InkSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.all(0),
            backgroundColor: const Color(0xff222747),
            shape: const CircleBorder(),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
