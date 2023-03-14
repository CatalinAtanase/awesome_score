import 'package:awesome_score/components/home/player_list_item.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/player_controller.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final PlayerController _playerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemCount: _playerController.players.length,
        itemBuilder: (_, index) {
          return PlayerListItem(player: _playerController.players[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
