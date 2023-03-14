import 'package:awesome_score/components/common/round_icon_button.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/player_controller.dart';
import '../../models/player.dart';

class ValueBottomSheet extends StatelessWidget {
  ValueBottomSheet({super.key, required this.player, required this.value});

  final Player player;
  final PlayerController playerController = Get.find();
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundIconButton(
          onPressed: () {
            playerController.changeScore(player, value);
          },
          backgrounColor: Colors.green,
          icon: const Icon(
            Icons.add,
          ),
        ),
        Container(
          decoration: const ShapeDecoration(
            color: Colors.blue,
            shape: CircleBorder(),
          ),
          margin: const EdgeInsets.symmetric(vertical: Spacing.s),
          height: value > 999 ? 48 : 36,
          width: value > 999 ? 48 : 36,
          alignment: Alignment.center,
          child: Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: Spacing.m,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        RoundIconButton(
          onPressed: () {
            playerController.changeScore(player, -value);
          },
          backgrounColor: Colors.red,
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
