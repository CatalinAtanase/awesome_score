import 'package:awesome_score/controllers/values_controller.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueDialogBody extends StatefulWidget {
  const ValueDialogBody({super.key});

  @override
  State<ValueDialogBody> createState() => _ValueDialogBodyState();
}

class _ValueDialogBodyState extends State<ValueDialogBody> {
  final inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValuesController valuesController = Get.find();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.xs),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              autofocus: true,
              controller: inputController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'Value is empty';
                if (!value.isNum) return 'Value is not a number';
                if (valuesController.isValueAlreadyAdded(int.parse(value))) return 'Value already exists';
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Spacing.m))),
                hintText: 'Value...',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: Spacing.s),
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  valuesController.addValue(int.parse(inputController.text));
                  Get.back();
                }
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
