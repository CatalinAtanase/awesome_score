import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Get.toNamed('/settings/values/');
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(Spacing.s),
          ),
          title: const Text('Values'),
          trailing: const Icon(Icons.chevron_right),
        )
      ],
    );
  }
}
