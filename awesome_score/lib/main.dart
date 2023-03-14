import 'package:awesome_score/bindings/home.dart';
import 'package:awesome_score/bindings/values.dart';
import 'package:awesome_score/screens/home.dart';
import 'package:awesome_score/screens/settings/settings.dart';
import 'package:awesome_score/screens/settings/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: 'Awesome Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen(), binding: HomeBinding()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
        GetPage(name: '/settings/values/', page: () => const ValuesScreen(), binding: ValuesBinding()),
      ],
    ),
  );
}
