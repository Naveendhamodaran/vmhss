import 'package:attandence_admin_panel/views/dash_board_view/home_page_view.dart';
import 'package:attandence_admin_panel/views/exam_view/add_class_exam_view.dart';
import 'package:attandence_admin_panel/views/exam_view/add_subject_exam_view.dart';
import 'package:attandence_admin_panel/views/exam_view/exam_list_view.dart';
import 'package:attandence_admin_panel/views/sections_view/section_view.dart';
import 'package:attandence_admin_panel/views/sms_view/sms_view.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_detsils_list_view.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_management.dart';
import 'package:attandence_admin_panel/views/student_management/student_management_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controllers/auth_controller.dart';
import 'controllers/sections_controller.dart';
import 'controllers/staff_management_controller.dart';
import 'controllers/student_management_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController());
  Get.put(SectionController());
  Get.put(StaffManagementController());
  Get.put(StudentManagementController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: const SplashScreenView(),
      // home: SectionView(),
      home: SmsView(),
    );
  }
}
