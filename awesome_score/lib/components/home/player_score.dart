import 'package:awesome_score/controllers/player_controller.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/score_controller.dart';
import '../../models/player.dart';
import '../common/round_icon_button.dart';

class PlayerScore extends StatelessWidget {
  PlayerScore({super.key, required this.player});

  final Player player;
  final PlayerController playerController = Get.find();
  final ScoreController scoreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      RoundIconButton(
        backgrounColor: Colors.blue,
        icon: const Icon(
          Icons.remove,
          color: Colors.white,
        ),
        onPressed: () {
          playerController.changeScore(player, scoreController.decrementer.value);
        },
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: Spacing.xs)),
      Text(
        '${player.score}',
        style: const TextStyle(fontSize: Spacing.m),
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: Spacing.xs)),
      RoundIconButton(
        backgrounColor: Colors.blue,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          playerController.changeScore(player, scoreController.incrementer.value);
        },
      ),
    ]);
  }
}
