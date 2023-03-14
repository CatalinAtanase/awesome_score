import 'package:awesome_score/components/common/bold_text.dart';
import 'package:awesome_score/components/home/value_bottom_sheet.dart';
import 'package:awesome_score/controllers/values_controller.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/player.dart';

class PlayerBottomSheet extends StatelessWidget {
  PlayerBottomSheet({super.key, required this.player});

  final Player player;
  final ValuesController valuesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.pagePadding, horizontal: Spacing.pagePadding * 1.5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldText(
              text: player.name,
              fontSize: Spacing.xl,
            ),
            Text(
              '${player.score}',
              style: const TextStyle(fontSize: Spacing.m),
            ),
            const Divider(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: Spacing.xl,
                runSpacing: Spacing.xl,
                children: [
                  ...valuesController.selectedValues.map((e) => ValueBottomSheet(player: player, value: e.amount)),
                ],
              ),
            ),
            const SizedBox(
              height: Spacing.xxxl,
            )
          ],
        ),
      ),
    );
  }
}
