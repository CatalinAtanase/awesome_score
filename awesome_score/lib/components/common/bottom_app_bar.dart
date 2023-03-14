import 'package:awesome_score/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getScreenWidth(context) / 2 - Spacing.l,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.emoji_people, color: Colors.white),
                  onPressed: () {
                    if (Get.routing.current != '/') {
                      Get.offAllNamed('/');
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: getScreenWidth(context) / 2 - Spacing.l,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    String currentRoute = Get.currentRoute;
                    if (currentRoute.contains('/settings')) {
                      Navigator.of(context).popUntil((route) => route.settings.name == '/settings');
                    } else if (Get.routing.current != '/settings') {
                      Get.toNamed('/settings');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
