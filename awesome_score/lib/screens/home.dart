import 'package:awesome_score/components/common/custom_app_bar.dart';
import 'package:awesome_score/components/home/body.dart';
import 'package:awesome_score/components/home/dialog_add_player_content.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/common/bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      body: Container(
        margin: const EdgeInsets.only(top: Spacing.m),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.pagePadding),
          child: HomeBody(),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Add player',
            titlePadding: const EdgeInsets.only(top: Spacing.l),
            content: const PlayerDialogBody(),
          );
        },
        tooltip: 'Add player',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
