import 'package:awesome_score/components/settings/values/body.dart';
import 'package:awesome_score/components/settings/values/value_dialog_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/common/bottom_app_bar.dart';
import '../../components/common/custom_app_bar.dart';
import '../../utils/spacing.dart';

class ValuesScreen extends StatelessWidget {
  const ValuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Values'),
      body: Container(
        margin: const EdgeInsets.only(top: Spacing.m),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.pagePadding),
          child: ValuesBody(),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Add value',
            titlePadding: const EdgeInsets.only(top: Spacing.l),
            content: const ValueDialogBody(),
          );
        },
        tooltip: 'Add player',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
