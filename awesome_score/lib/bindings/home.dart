import 'package:awesome_score/controllers/score_controller.dart';
import 'package:get/get.dart';

import '../controllers/player_controller.dart';
import '../controllers/values_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlayerController());
    Get.put(ScoreController());
    Get.put(ValuesController());
  }
}
