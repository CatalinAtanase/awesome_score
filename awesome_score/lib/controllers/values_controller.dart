import 'dart:convert';

import 'package:get/get.dart' hide Value;
import 'package:awesome_score/models/values.dart';
import 'package:get_storage/get_storage.dart';

class ValuesController extends GetxController {
  RxList<Value> values = RxList();
  List<Value> get selectedValues => values.where((el) => el.enabled).toList();
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    values.addAll((storage.read('values') as List<dynamic>).map((e) => Value.fromMap(json.decode(e))).toList());
  }

  void addValue(int amount) {
    values.add(Value(amount: amount));
    values.sort((a, b) => a.amount < b.amount ? -1 : 1);
    writeToBox();
  }

  void removeValue(Value value) {
    values.remove(value);
    writeToBox();
  }

  bool isValueAlreadyAdded(int amount) {
    return values.firstWhereOrNull((element) => element.amount == amount) != null;
  }

  void toggleEnabled(Value value) {
    int index = values.indexOf(value);
    Value newValue = values[index];
    newValue.enabled = !newValue.enabled;
    values[index] = newValue;
    writeToBox();
  }

  void writeToBox() {
    storage.write('values', values);
  }
}
