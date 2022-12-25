import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.backgrounColor,
    required this.icon,
    required this.onPressed,
  });

  final Color backgrounColor;
  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: backgrounColor,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.xxs, vertical: Spacing.xxs),
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        iconSize: Spacing.l,
        icon: icon,
      ),
    );
  }
}
