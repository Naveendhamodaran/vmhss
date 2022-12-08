import 'dart:io';

import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/student_model.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../constants/decoration.dart';
import '../profile_view/profile_view.dart';

class StudentManagementView extends StatefulWidget {
  const StudentManagementView({super.key});

  @override
  State<StudentManagementView> createState() => _StudentManagementViewState();
}

class _StudentManagementViewState extends State<StudentManagementView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();
  final studentController = Get.find<StudentManagementController>();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  var gender;
  var designation;
  var nationality;
  var state;
  var religion;

  List<String> genderList = ["Male", "Female"];

  List<String> designationList = ["Tamil", "English", "Telugu"];
  List<String> nationalityList = ["Indian", "NRI"];
  List<String> stateList = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana	",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];
  List<String> releagionList = [
    "Hindu",
    "Muslim",
    "Christian",
    "Sikh",
    "Buddhist",
    "Jain"
  ];

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now().subtract(const Duration(days: 10000)),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date = picked;
        startDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  _selectedDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date2,
        firstDate: DateTime.now().subtract(const Duration(days: 10000)),
        lastDate: DateTime.now().add(const Duration(days: 700)));

    if (picked != null && picked != _date2) {
      print("Date selected ${_date.toString()}");
      setState(() {
        _date2 = picked;
        endDateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  var fullNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var admissionNoController = TextEditingController();
  var addressController = TextEditingController();
  var joiningStandardController = TextEditingController();
  var firstLanguageController = TextEditingController();
  var castController = TextEditingController();
  var communityController = TextEditingController();
  var motherTongueController = TextEditingController();
  var previousSchoolController = TextEditingController();
  var previousStandardController = TextEditingController();
  var motherNameController = TextEditingController();
  var fatherOccupationController = TextEditingController();
  var motherOccupationController = TextEditingController();
  var fatherQualificationController = TextEditingController();
  var motherQualificationController = TextEditingController();
  var incomeController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var guardianNameController = TextEditingController();
  var guardianMobileNumberController = TextEditingController();
  var guardianAddressController = TextEditingController();
  var transportController = TextEditingController();
  var routeController = TextEditingController();
  var busStopController = TextEditingController();
  var emisCodeController = TextEditingController();
  var birthCertificateController = TextEditingController();
  var aadhaarController = TextEditingController();
  var transferCertificateController = TextEditingController();
  var markSheetController = TextEditingController();
  var verifiedByController = TextEditingController();

  Uint8List? imagePath;
  String imageName = "";

  chooseImage() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    setState(() {
      imagePath = bytesFromPicker!;
    });
  }

  File? file;
  Future filePick() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    final path = result.files.first.name;
    setState(() {
      file = File(path);
    });
    // if (result != null) {
    //   Uint8List? fileBytes = result.files.first.bytes;
    //   String fileName = result.files.first.name;
    //
    //   Upload file
    //   await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? file!.path : 'Select files';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: HexColor('#F7E467'),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Image.asset(
                "assets/icons/vmhslogo.png",
                height: 70,
                width: 70,
              ),
            ),
          ),
          leadingWidth: 100,
          centerTitle: true,
          // title: Row(
          //   children: [
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           color: secondaryColor.withOpacity(0.3),
          //           borderRadius: BorderRadius.circular(13)),
          //       alignment: Alignment.center,
          //       child: Icon(
          //         Icons.menu,
          //         color: secondaryColor,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Container(
          //       width: 400,
          //       child: TextField(
          //         decoration: InputDecoration(
          //             hintText: "Search",
          //             prefixIcon: const Icon(Icons.search),
          //             enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(13),
          //                 borderSide: const BorderSide(
          //                     color: Colors.black, width: 0.2)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(13),
          //                 borderSide: const BorderSide(
          //                     color: Colors.black, width: 0.2))),
          //       ),
          //     )
          //   ],
          // ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: HexColor('#0F2878'),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.notifications_none,
                    // color: HexColor('#0F2878'),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ProfileView());
                    },
                    child: Container(
                      height: 36,
                      width: 74,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: HexColor('#F7E467'),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: HexColor('#5E72C4'),
                              size: 23,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.settings_outlined,
                              color: HexColor('#5E72C4'),
                              size: 23,
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: HexColor('#e3f2fd'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LeftBar(),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          h10,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'STUDENT DETAILS',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Divider(),
                          ),
                          h10,
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 15),
                            child: InkWell(
                              onTap: () {
                                chooseImage();
                              },
                              child: imagePath == null
                                  ? Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300]),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.memory(imagePath!),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  h20,

                  ////STUDENT INFORMATION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            h10,
                            Text(
                              'STUDENT INFORMATION',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            h10,
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Divider(),
                            ),
                            h10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: fullNameController,
                                  labelText: 'Full Name',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: admissionNoController,
                                  labelText: 'Admission Number',
                                  maxLine: 1,
                                ),
                                Container(
                                  height: 50,
                                  width: 330,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              Colors.black54.withOpacity(0.5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButton<String>(
                                      value: gender,
                                      hint: Text(
                                        "Gender*",
                                        style:
                                            primaryFonts.copyWith(fontSize: 14),
                                      ),
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      elevation: 0,
                                      itemHeight: 55,
                                      isDense: true,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.

                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                      items: genderList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 330,
                                  child: TextField(
                                      controller: endDateController,
                                      readOnly: true,
                                      onTap: () {
                                        _selectedDateEnd(context);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Date of Birth*",
                                        suffixIcon:
                                            const Icon(Icons.date_range),
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle,
                                      )),
                                ),
                                Container(
                                  width: 330,
                                  child: TextField(
                                    controller: joiningStandardController,
                                    decoration: InputDecoration(
                                        labelText: "Joining standard*",
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 330,
                                  child: TextField(
                                      controller: startDateController,
                                      readOnly: true,
                                      onTap: () {
                                        _selectedDate(context);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Joining Date*",
                                        suffixIcon:
                                            const Icon(Icons.date_range),
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle,
                                      )),
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 330,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              Colors.black54.withOpacity(0.5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButton<String>(
                                      value: designation,
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      elevation: 0,
                                      itemHeight: 55,
                                      isDense: true,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      hint: Text(
                                        "Medium*",
                                        style:
                                            primaryFonts.copyWith(fontSize: 14),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.

                                        setState(() {
                                          designation = value!;
                                        });
                                      },
                                      items: designationList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 330,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              Colors.black54.withOpacity(0.5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButton<String>(
                                      value: nationality,
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      elevation: 0,
                                      itemHeight: 55,
                                      isDense: true,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      hint: Text(
                                        "Nationality*",
                                        style:
                                            primaryFonts.copyWith(fontSize: 14),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.

                                        setState(() {
                                          nationality = value!;
                                        });
                                      },
                                      items: nationalityList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 330,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              Colors.black54.withOpacity(0.5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButton<String>(
                                      value: religion,
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      elevation: 0,
                                      itemHeight: 55,
                                      isDense: true,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      hint: Text(
                                        "Religion*",
                                        style:
                                            primaryFonts.copyWith(fontSize: 14),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.

                                        setState(() {
                                          religion = value!;
                                        });
                                      },
                                      items: releagionList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: castController,
                                  labelText: 'Caste',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: communityController,
                                  labelText: 'Community',
                                  maxLine: 1,
                                ),
                                Container(
                                  height: 50,
                                  width: 330,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              Colors.black54.withOpacity(0.5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButton<String>(
                                      value: state,
                                      isExpanded: true,
                                      hint: Text(
                                        "State*",
                                        style:
                                            primaryFonts.copyWith(fontSize: 14),
                                      ),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      elevation: 0,
                                      itemHeight: 55,
                                      isDense: true,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          state = value!;
                                        });
                                      },
                                      items: stateList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: motherTongueController,
                                  labelText: 'Mother Tongue',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: firstLanguageController,
                                  labelText: 'First Language',
                                  maxLine: 1,
                                ),
                              ],
                            ),
                            h20,
                          ],
                        ),
                      ),
                    ),
                  ),
                  h20,

                  ////PARENT INFORMATION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            h10,
                            Text(
                              'PARENT INFORMATION',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            h10,
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Divider(),
                            ),
                            h10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: fatherNameController,
                                  labelText: 'Father Name',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: fatherOccupationController,
                                  labelText: 'Father Occupation',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: fatherQualificationController,
                                  labelText: 'Father Qualification',
                                  maxLine: 1,
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: motherNameController,
                                  labelText: 'Mother Name',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: motherOccupationController,
                                  labelText: 'Mother Occupation',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: motherQualificationController,
                                  labelText: 'Mother Qualification',
                                  maxLine: 1,
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: mobileNumberController,
                                  labelText: 'Mobile Number',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: incomeController,
                                  labelText: 'Monthly Income',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: addressController,
                                  labelText: 'Address',
                                  maxLine: 3,
                                ),
                              ],
                            ),
                            h20,
                          ],
                        ),
                      ),
                    ),
                  ),
                  h20,
                  ////GUARDIAN INFORMATION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            h10,
                            Text(
                              'GUARDIAN INFORMATION',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            h10,
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Divider(),
                            ),
                            h10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                h15,
                                TextFieldCommon(
                                  controller: guardianNameController,
                                  labelText: 'Guardian Name',
                                  maxLine: 1,
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                                TextFieldCommon(
                                  controller: guardianMobileNumberController,
                                  labelText: 'Guardian Mobile Number',
                                  maxLine: 1,
                                ),
                                h15,
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: guardianAddressController,
                                  labelText: 'Guardian Address',
                                  maxLine: 3,
                                ),
                              ],
                            ),
                            h20
                          ],
                        ),
                      ),
                    ),
                  ),
                  h20,
                  ////OTHER INFORMATION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            h10,
                            Text(
                              'OTHER INFORMATION',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            h10,
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Divider(),
                            ),
                            h10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: emisCodeController,
                                  labelText: "EMIS Code",
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: transportController,
                                  labelText: 'Transport (Y/N)',
                                  maxLine: 1,
                                ),
                                TextFieldCommon(
                                  controller: routeController,
                                  labelText: "Route Number",
                                  maxLine: 1,
                                ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: busStopController,
                                  labelText: 'Bus stop',
                                  maxLine: 1,
                                ),
                                // TextFieldCommon(
                                //   controller: birthCertificateController,
                                //   labelText: 'Birth Certificate',
                                //   maxLine: 1,
                                // ),
                                Container(
                                  width: 330,
                                  height: 55,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Text('Birth Certificate'),
                                          color: Colors.blue,
                                        ),
                                        onTap: () {
                                          filePick();
                                        },
                                      ),
                                      Text(fileName)
                                      // Text(file == null
                                      //     ? 'Click to select Birth Certificate'
                                      //     : '${fileName = file!.path}')
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 330,
                                  height: 55,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Text('Transfer Certificate'),
                                          color: Colors.blue,
                                        ),
                                        onTap: () {
                                          filePick();
                                        },
                                      ),
                                      // Text(file == null
                                      //     ? 'Click to select Transfer Certificate'
                                      //     : '${fileName = (file!.path)}')
                                      Text(fileName)
                                    ],
                                  ),
                                ),
                                // TextFieldCommon(
                                //   controller: transferCertificateController,
                                //   labelText: 'Transfer Certificate',
                                //   maxLine: 1,
                                // ),
                              ],
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldCommon(
                                  controller: aadhaarController,
                                  labelText: 'Aadhaar',
                                  maxLine: 1,
                                ),
                                h15,
                                TextFieldCommon(
                                  controller: markSheetController,
                                  labelText: 'Mark Sheet',
                                  maxLine: 1,
                                ),
                              ],
                            ),
                            h20
                          ],
                        ),
                      ),
                    ),
                  ),
                  h20,
                  ////PREVIOUS SCHOOL
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            h10,
                            Text(
                              'PREVIOUS SCHOOL INFORMATION',
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            h10,
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Divider(),
                            ),
                            h10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 330,
                                  height: 50,
                                  child: TextField(
                                    controller: previousSchoolController,
                                    decoration: InputDecoration(
                                        labelText: "Previous School",
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle),
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                                Container(
                                  width: 330,
                                  child: TextField(
                                    controller: previousStandardController,
                                    decoration: InputDecoration(
                                        labelText: "Previous Standard",
                                        enabledBorder: borderstyle,
                                        focusedBorder: borderstyle),
                                  ),
                                ),
                              ],
                            ),
                            h20
                          ],
                        ),
                      ),
                    ),
                  ),
                  h20,
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          String url = await studentController.storeImage(
                              images: imagePath,
                              employeename: fullNameController.text,
                              imageName: imageName);
                          print(url);
                          StudentModel studentModel = StudentModel(
                              image: url,
                              fullName: fullNameController.text,
                              admissionNumber: admissionNoController.text,
                              gender: gender,
                              address: addressController.text,
                              joiningStandard: joiningStandardController.text,
                              dob: _date2,
                              joiningDate: _date,
                              caste: castController.text,
                              community: communityController.text,
                              firstLanguage: firstLanguageController.text,
                              medium: designation,
                              motherTongue: motherTongueController.text,
                              nationality: nationality,
                              previousSchool: previousSchoolController.text,
                              previousStandards:
                                  previousStandardController.text,
                              religion: religion,
                              state: state,
                              fatherName: fatherNameController.text,
                              emisCode: emisCodeController.text,
                              busStop: busStopController.text,
                              route: routeController.text,
                              transport: transportController.text,
                              guardianAddress: guardianAddressController.text,
                              guardianMobileNumber:
                                  guardianMobileNumberController.text,
                              guardianName: guardianNameController.text,
                              mobileNumber: mobileNumberController.text,
                              monthlyIncome: incomeController.text,
                              motherQualification:
                                  motherQualificationController.text,
                              fatherQualification:
                                  fatherQualificationController.text,
                              motherOccupation: motherOccupationController.text,
                              fatherOccupation: fatherOccupationController.text,
                              motherName: motherNameController.text);
                          studentController
                              .writeToStudentManagement(studentModel);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primaryColor),
                          alignment: Alignment.center,
                          child: Text(
                            "Save",
                            style: primaryFonts.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  h30,
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           h20,
                  //           h15,
                  //           Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 20),
                  //             child: Column(
                  //               children: [],
                  //             ),
                  //           ),
                  //           h30,
                  //           Padding(
                  //             padding: const EdgeInsets.only(left: 15),
                  //             child: Text(
                  //               'PREVIOUS SCHOOL DATA',
                  //               style: primaryFonts.copyWith(
                  //                   fontWeight: FontWeight.w600, fontSize: 20),
                  //             ),
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.only(
                  //                 left: 15, right: 15, bottom: 10),
                  //             child: Divider(),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(left: 15),
                  //
                  //           ),
                  //           const SizedBox(
                  //             height: 50,
                  //           ),
                  //
                  //           h20
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const RightBar()
          ],
        ),
      ),
    );
  }
}

class TextFieldCommon extends StatelessWidget {
  TextFieldCommon({
    required this.controller,
    required this.labelText,
    required this.maxLine,
  });

  final TextEditingController controller;
  final String labelText;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 330,
          child: TextField(
            maxLines: maxLine,
            controller: controller,
            decoration: kTextField.copyWith(
              labelText: labelText,
            ),
          ),
        )
      ],
    );
  }
}
