import 'package:awesome_score/components/settings/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common/bottom_app_bar.dart';
import '../../components/common/custom_app_bar.dart';
import '../../components/home/dialog_add_player_content.dart';
import '../../utils/spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Container(
        margin: const EdgeInsets.only(top: Spacing.m),
        child: const Padding(
          padding: EdgeInsets.all(Spacing.pagePadding),
          child: SettingsBody(),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
