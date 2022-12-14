import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_fonts.dart';
import '../../constants/decoration.dart';
import '../../constants/helper_widgets.dart';
import '../../controllers/sections_controller.dart';
import '../../controllers/staff_management_controller.dart';
import '../../controllers/student_management_controller.dart';
import '../../widgets/common_widgets/left_bar.dart';
import '../profile_view/profile_view.dart';

class SmsView extends StatefulWidget {
  const SmsView({Key? key}) : super(key: key);

  @override
  State<SmsView> createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
  final sectionController = Get.find<SectionController>();
  final staffManageController = Get.find<StaffManagementController>();

  @override
  void initState() {
    super.initState();

    sectionController.getSections();
    staffManageController.getStaffs();
  }

  var selectedClass = '';
  var smsFor;
  var smsForStudent;
  var smsForStaffs;
  var messageController = TextEditingController();
  var template1 =
      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Fuga eos quidem animi atque eveniet quos architecto consequuntur ut blanditiis, ratione odit ab tenetur placeat amet! Fuga qui consequatur impedit nostrum!';
  var template2 =
      ' ipsum dolor sit amet consectetur adipisicing elit. Fuga eos quidem animi atque eveniet quos architecto consequuntur ut blanditiis, ratione odit ab tenetur placeat amet! Fuga qui consequatur impedit nostrum!';

  List<String> smsList = ["Common to all", "Students", 'Staffs'];
  List<String> smsStudentList = ["Common to all", "Class"];
  List<String> smsStaffList = [
    "Common to all",
    'Selected',
    "Primary",
    "High School",
    "HR Sec",
    "Special Teacher",
    "Driver",
    "Attender",
    "AAYA",
    "Security",
    "Office Staff"
  ];
  String? text = '';

  List<String> classList = [];
  List<String> staffList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        child: Row(children: [
          const LeftBar(),
          Expanded(
            child: GetBuilder<StudentManagementController>(builder: (_) {
              return Container(
                decoration: BoxDecoration(color: HexColor('#e3f2fd')),
                height: size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            h30,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'BULK SMS',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            h20,
                            Divider(),
                            h30,
                            Container(
                              height: 55,
                              width: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black54.withOpacity(0.5))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: DropdownButton<String>(
                                  value: smsFor,
                                  hint: Text(
                                    "SMS For*",
                                    style: primaryFonts.copyWith(fontSize: 14),
                                  ),
                                  isExpanded: true,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  elevation: 0,
                                  itemHeight: 55,
                                  isDense: true,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.

                                    setState(() {
                                      smsFor = value!;
                                    });
                                  },
                                  items: smsList.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            h30,
                            if (smsFor == 'Students') ...[
                              Container(
                                  height: 50,
                                  width: 500,
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
                                      value: smsForStudent,
                                      hint: Text(
                                        "SMS For Students In*",
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
                                          smsForStudent = value!;
                                        });
                                      },
                                      items: smsStudentList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: Colors.black87),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                              if (smsForStudent == 'Class') ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Container(
                                    height: 300,
                                    width: 900,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black26),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        sectionController
                                                            .sectionModelList
                                                            .length;
                                                    i++)
                                                  Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 3),
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (classList.contains(
                                                                  "${sectionController.sectionModelList[i].standerd}") ==
                                                              false) {
                                                            classList.add(
                                                                "${sectionController.sectionModelList[i].standerd}");
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          child: Text(
                                                              sectionController
                                                                  .sectionModelList[
                                                                      i]
                                                                  .standerd),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: double.infinity,
                                            color: Colors.blueGrey,
                                            child: ListView.builder(
                                              itemCount: classList.length,
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  AlwaysScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 330,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              classList[index]),
                                                          InkWell(
                                                            onTap: () {
                                                              classList
                                                                  .removeAt(
                                                                      index);
                                                            },
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .xmark,
                                                              size: 10,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ] else if (smsFor == 'Staffs') ...[
                              Container(
                                  height: 50,
                                  width: 500,
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
                                      value: smsForStaffs,
                                      hint: Text(
                                        "SMS For Staffs In*",
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
                                          smsForStaffs = value!;
                                        });
                                      },
                                      items: smsStaffList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: Colors.black87),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                              if (smsForStaffs == 'Selected') ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Container(
                                    height: 300,
                                    width: 900,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black26),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              for (int i = 0;
                                                  i <
                                                      staffManageController
                                                          .staffList.length;
                                                  i++)
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (staffList.contains(
                                                                "${staffManageController.staffList[i].fullName}") ==
                                                            false) {
                                                          staffList.add(
                                                              "${staffManageController.staffList[i].fullName}");
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: double.infinity,
                                                      child: Text(
                                                          staffManageController
                                                              .staffList[i]
                                                              .fullName),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                h20,
                                if (staffList.isNotEmpty) ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                            )
                                          ]),
                                      child: ListView.builder(
                                        itemCount: staffList.length,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              staffList[index]),
                                                          InkWell(
                                                            onTap: () {
                                                              staffList
                                                                  .removeAt(
                                                                      index);
                                                            },
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .xmark,
                                                              size: 10,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              w10,
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            ],
                            h30,
                            Container(
                              width: 900,
                              child: TextField(
                                maxLines: 10,
                                controller: messageController,
                                decoration: kTextField.copyWith(
                                  labelText: 'Message',
                                ),
                              ),
                            ),
                            h30,
                            Row(
                              children: [
                                TemplateWidget(
                                  template: template1,
                                  onTap: () {
                                    messageController.text = template1;
                                  },
                                ),
                                w30,
                                TemplateWidget(
                                  template: template2,
                                  onTap: () {
                                    messageController.text = template2;
                                  },
                                ),
                                w30,
                                TemplateWidget(
                                  template: template1,
                                  onTap: () {
                                    messageController.text = template1;
                                  },
                                ),
                                w30,
                                TemplateWidget(
                                  template: template1,
                                  onTap: () {
                                    messageController.text = template1;
                                  },
                                ),
                              ],
                            ),
                            h30,
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: HexColor('#0F2878'),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      'Send',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ))),
                            h30
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const RightBar(),
        ]),
      ),
    );
  }
}

class TemplateWidget extends StatelessWidget {
  const TemplateWidget({
    Key? key,
    required this.template,
    required this.onTap,
  }) : super(key: key);

  final String template;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor('#A0B3F3'),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            template,
            style: TextStyle(color: HexColor('#000000')),
          ),
        ),
      ),
    );
  }
}
