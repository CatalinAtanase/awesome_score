import 'package:awesome_score/controllers/values_controller.dart';
import 'package:flutter/material.dart';

import '../../../models/values.dart';
import '../../../utils/spacing.dart';

class ValueListItem extends StatelessWidget {
  const ValueListItem({
    super.key,
    required this.valuesController,
    required this.value,
  });

  final ValuesController valuesController;
  final Value value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.s),
      child: Dismissible(
        key: ValueKey<int>(value.amount),
        onDismissed: (DismissDirection direction) {
          valuesController.removeValue(value);
        },
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: Spacing.l),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Spacing.s),
            color: Colors.red,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        direction: DismissDirection.endToStart,
        child: ListTile(
          title: Text('${value.amount}'),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(Spacing.s),
          ),
          tileColor: value.enabled ? Colors.lightGreen[100] : Colors.red[100],
          onTap: () {
            valuesController.toggleEnabled(value);
          },
          dense: true,
          visualDensity: const VisualDensity(vertical: -4),
          // selected: index % 2 == 0,
          onLongPress: () {},
        ),
      ),
    );
  }
}
