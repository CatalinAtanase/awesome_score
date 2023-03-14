import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BoldText extends StatelessWidget {
  const BoldText({super.key, required this.text, this.fontSize = Spacing.s});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }
}
