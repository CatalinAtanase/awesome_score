import 'package:awesome_score/components/home/player_bottom_sheet.dart';
import 'package:awesome_score/components/home/player_score.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/player_controller.dart';
import '../../models/player.dart';
import 'dialog_add_player_content.dart';

class PlayerListItem extends StatelessWidget {
  PlayerListItem({super.key, required this.player});

  final Player player;
  final PlayerController playerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(player.name),
      onDismissed: (DismissDirection direction) {
        playerController.removePlayer(player);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: Spacing.l),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: ListTile(
        leading: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Get.defaultDialog(
              title: 'Edit player',
              titlePadding: const EdgeInsets.only(top: Spacing.l),
              content: PlayerDialogBody(
                player: player,
                defaultValue: player.name,
              ),
            );
          },
        ),
        title: Text(player.name),
        trailing: PlayerScore(
          player: player,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return Obx(
                () => PlayerBottomSheet(player: playerController.players.firstWhere((element) => element == player)),
              );
            },
          );
        },
        horizontalTitleGap: Spacing.xs,
        contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.xxs),
      ),
    );
  }
}
