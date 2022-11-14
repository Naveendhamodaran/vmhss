import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/views/sign_in_view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/profile_view/profile_view.dart';
import 'views/sections_view/section_view.dart';

void main() {
  Get.put(SectionController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Attandance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: SignINView(),
      home: SetionView(),
    );
  }
}
