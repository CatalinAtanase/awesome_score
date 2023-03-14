import 'package:awesome_score/controllers/values_controller.dart';
import 'package:get/get.dart';

class ValuesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ValuesController());
  }
}
