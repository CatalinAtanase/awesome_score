import 'package:awesome_score/components/settings/values/value_list_item.dart';
import 'package:awesome_score/controllers/values_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;

import '../../../models/values.dart';
import '../../../utils/spacing.dart';

class ValuesBody extends StatelessWidget {
  ValuesBody({super.key});

  final ValuesController valuesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: valuesController.values.length,
        itemBuilder: (context, index) {
          return ValueListItem(
            valuesController: valuesController,
            value: valuesController.values[index],
          );
        },
      ),
    );
  }
}
