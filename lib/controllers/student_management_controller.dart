import 'dart:io';
import 'dart:async';
import 'package:attandence_admin_panel/constants/colllections_namings.dart';
import 'package:attandence_admin_panel/models/staff_model.dart';
import 'package:attandence_admin_panel/models/student_model.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_detsils_list_view.dart';
import 'package:attandence_admin_panel/views/student_management/students_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StudentmanagementController extends GetxController {
  List<StudentModel> studentsList = [];

  writeToStudentmanagement(StudentModel studentsModel) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(studentsCollection);

    users.add(studentsModel.toJson()).then((value) {
      Get.snackbar("Student added successfully", "",
          maxWidth: 400,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      Get.off(() => StudentsListView());
    }).catchError((error) {
      Get.snackbar("Something went wrong", "",
          maxWidth: 400, colorText: Colors.white, backgroundColor: Colors.red);
    });
  }

  getStudents() async {
    studentsList.clear();
    FirebaseFirestore.instance
        .collection(studentsCollection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        StudentModel studentModel = StudentModel(
          image: doc["full_name"],
          fullName: doc["full_name"],
          admissionNo: doc["admission_No"],
          gender: doc["gender"],
          address: doc["address"],
          joiningSttanderd: doc["joining_standerd"],
          dob: (doc["dob"] as Timestamp).toDate(),
          joiningDate: (doc["joining_date"] as Timestamp).toDate(),
          medium: doc["medium"],
          firstLanguage: doc["first_language"],
          nationality: doc["nationality"],
          state: doc["state"],
          religion: doc["religion"],
          cast: doc["cast"],
          community: doc["community"],
          motherToungue: doc["mother_tounge"],
          previousSchool: doc["previous_school"],
          previousStanderds: doc["previous_statnderd"],
        );
        studentsList.add(studentModel);
      }
      update();
    });
  }

  Future<String> storeImage(
      {required Uint8List? images,
      required String employeename,
      required String imageName}) async {
    print("::::::::::::::1:::::::::::::::::::");
    final storageReference =
        FirebaseStorage.instance.ref().child("Staffs/$employeename");
    print("::::::::::::::2:::::::::::::::::::");
    await storageReference.putData(images!);
    print("::::::::::::::3:::::::::::::::::::");
    final String url = await storageReference.getDownloadURL();
    return url;
  }
}
