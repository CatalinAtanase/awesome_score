import 'package:awesome_score/controllers/player_controller.dart';
import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/player.dart';

class PlayerDialogBody extends StatefulWidget {
  const PlayerDialogBody({super.key, this.defaultValue = '', this.player});

  final Player? player;
  final String defaultValue;

  @override
  State<PlayerDialogBody> createState() => _PlayerDialogBodyState();
}

class _PlayerDialogBodyState extends State<PlayerDialogBody> {
  final inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PlayerController _playerController = Get.find();
  late final bool isEdit;

  @override
  void initState() {
    super.initState();
    isEdit = widget.player != null;
    inputController.text = widget.defaultValue;
  }

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
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'Name is empty';
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Spacing.m))),
                hintText: 'Name...',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: Spacing.s),
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isEdit) {
                      _playerController.changePlayerName(widget.player, inputController.text);
                    } else {
                      _playerController.addPlayer(Player(name: inputController.text));
                    }
                    Get.back();
                  }
                },
                child: Text(widget.player == null ? 'Add' : 'Edit')),
          ),
        ],
      ),
    );
  }
}
