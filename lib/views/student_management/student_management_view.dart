import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/constants/app_styles.dart';
import 'package:attandence_admin_panel/constants/helper_widgets.dart';
import 'package:attandence_admin_panel/controllers/student_management_controller.dart';
import 'package:attandence_admin_panel/models/student_model.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

class StudentManagementView extends StatefulWidget {
  const StudentManagementView({super.key});

  @override
  State<StudentManagementView> createState() => _StudentManagementViewState();
}

class _StudentManagementViewState extends State<StudentManagementView> {
  DateTime _date = DateTime.now();
  DateTime _date2 = DateTime.now();
  final studentController = Get.find<StudentmanagementController>();
  var startdateController = TextEditingController();
  var enddateController = TextEditingController();

  var gender;
  var designation;
  var nationality;
  var state;
  var releagion;

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
        startdateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
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
        enddateController.text = formatDate(picked, [dd, "-", mm, "-", yyyy]);
      });
    }
  }

  var fullNameController = TextEditingController();
  var admissionNoController = TextEditingController();
  var addressController = TextEditingController();
  var joingStandersController = TextEditingController();
  var firstlangController = TextEditingController();
  var castController = TextEditingController();
  var communityControler = TextEditingController();
  var motherToungeController = TextEditingController();
  var previousSchoolController = TextEditingController();
  var previousstanderdController = TextEditingController();

  Uint8List? imagePath;
  String imageName = "";

  chooseImage() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    setState(() {
      imagePath = bytesFromPicker!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftBar(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.6))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 20, left: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Student details',
                            style: primaryFonts.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Divider(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          child: InkWell(
                            onTap: () {
                              chooseImage();
                            },
                            child: imagePath == null
                                ? Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                        h15,
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    height: 50,
                                    child: TextField(
                                      controller: fullNameController,
                                      decoration: InputDecoration(
                                          labelText: "Full Name",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: admissionNoController,
                                      decoration: InputDecoration(
                                          labelText: "Admission No",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: DropdownButton<String>(
                                        value: gender,
                                        hint: Text(
                                          "Gender*",
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
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
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      maxLines: 2,
                                      controller: addressController,
                                      decoration: InputDecoration(
                                          labelText: "Address*",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        h30,
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: joingStandersController,
                                      decoration: InputDecoration(
                                          labelText: "Joining standard*",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    child: TextField(
                                        controller: enddateController,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 330,
                                child: TextField(
                                    controller: startdateController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectedDate(context);
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Joining Date*",
                                      suffixIcon: const Icon(Icons.date_range),
                                      enabledBorder: borderstyle,
                                      focusedBorder: borderstyle,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
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
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
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
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: firstlangController,
                                      decoration: InputDecoration(
                                          labelText: "First Language",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
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
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
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
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: DropdownButton<String>(
                                        value: state,
                                        isExpanded: true,
                                        hint: Text(
                                          "State*",
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black54
                                                .withOpacity(0.5))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: DropdownButton<String>(
                                        value: releagion,
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
                                          style: primaryFonts.copyWith(
                                              fontSize: 14),
                                        ),
                                        onChanged: (String? value) {
                                          // This is called when the user selects an item.

                                          setState(() {
                                            releagion = value!;
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
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: castController,
                                      decoration: InputDecoration(
                                          labelText: "Cast*",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    height: 50,
                                    child: TextField(
                                      controller: communityControler,
                                      decoration: InputDecoration(
                                          labelText: "Community",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: motherToungeController,
                                      decoration: InputDecoration(
                                          labelText: "Mother Tongue",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Previous datas',
                            style: primaryFonts.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, bottom: 10),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
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
                                  )
                                ],
                              ),
                              w30,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: TextField(
                                      controller: previousstanderdController,
                                      decoration: InputDecoration(
                                          labelText: "Previous Standard",
                                          enabledBorder: borderstyle,
                                          focusedBorder: borderstyle),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () async {
                              String url = await studentController.storeImage(
                                  images: imagePath,
                                  employeename: fullNameController.text,
                                  imageName: imageName);
                              print(url);
                              StudentModel studentModel = StudentModel(
                                  image: url,
                                  fullName: fullNameController.text,
                                  admissionNo: admissionNoController.text,
                                  gender: gender,
                                  address: addressController.text,
                                  joiningSttanderd:
                                      joingStandersController.text,
                                  dob: _date2,
                                  joiningDate: _date,
                                  cast: castController.text,
                                  community: communityControler.text,
                                  firstLanguage: firstlangController.text,
                                  medium: designation,
                                  motherToungue: motherToungeController.text,
                                  nationality: nationality,
                                  previousSchool: previousSchoolController.text,
                                  previousStanderds:
                                      previousstanderdController.text,
                                  religion: releagion,
                                  state: state);
                              studentController
                                  .writeToStudentmanagement(studentModel);
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
                                style:
                                    primaryFonts.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          RightBar()
        ],
      ),
    );
  }
}
