import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/controllers/sections_controller.dart';
import 'package:attandence_admin_panel/controllers/staff_management_controller.dart';
import 'package:attandence_admin_panel/views/exam_view/add_subject_exam_view.dart';
import 'package:attandence_admin_panel/views/exam_view/exam_list_view.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_management.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';
import '../../constants/helper_widgets.dart';
import '../profile_view/profile_view.dart';

class AddClassExamView extends StatefulWidget {
  const AddClassExamView({super.key});

  @override
  State<AddClassExamView> createState() => _AddClassExamViewState();
}

class _AddClassExamViewState extends State<AddClassExamView> {
  var sort;
  List<String> sortList = ["Name", "Gender", 'Designation'];
  final staffManageController = Get.find<StaffManagementController>();
  final sectionManageController = Get.find<SectionController>();

  @override
  void initState() {
    super.initState();
    staffManageController.getStaffs();
    sectionManageController.getSections();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              width: 500,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Class",
                              style: primaryFonts.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.back();
                                  const AddClassExamView();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 24,
                                )),
                          ],
                        ),
                      ),
                      h30,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          height: 200,
                          width: 450,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'ALL CLASS LIST',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    h10,
                                    for (int i = 0;
                                        i <
                                            sectionManageController
                                                .sectionModelList.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                                value: false,
                                                onChanged: (value) {}),
                                            Container(
                                              child: Text(
                                                  '${sectionManageController.sectionModelList[i].standerd} ${sectionManageController.sectionModelList[i].section}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                const AddClassExamView();
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('#0F2878')),
                                alignment: Alignment.center,
                                child: const Text(
                                  'ADD',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        h20
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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
              child: Image.asset(
                "assets/icons/vmhslogo.png",
                height: 70,
                width: 70,
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LeftBar(),
            Expanded(
              child: GetBuilder<StaffManagementController>(builder: (_) {
                return Container(
                  decoration: BoxDecoration(color: HexColor('#e3f2fd')),
                  height: size.height,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                        Get.to(ExamListView());
                                      },
                                      child: Icon(Icons.arrow_back)),
                                  Text(
                                    'EXAM SECTION MANAGEMENT',
                                    style: primaryFonts.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: () {
                                            // Get.to(
                                            //     () => const StaffManageView());
                                          },
                                          child: Container(
                                            height: 55,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .vertical_align_bottom,
                                                      color: Colors.black),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Export",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          onTap: () {
                                            _dialogBuilder(context);
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: HexColor('#0F2878'),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.7),
                                                      blurRadius: 3)
                                                ]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    "ADD CLASS",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          prefixIcon: const Icon(Icons.search),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.2)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.2))),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black54
                                                    .withOpacity(0.5))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButton<String>(
                                            value: sort,
                                            hint: Text(
                                              "Sort By",
                                              style: primaryFonts.copyWith(
                                                  fontSize: 14),
                                            ),
                                            isExpanded: true,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            elevation: 8,
                                            isDense: true,
                                            style: const TextStyle(
                                                color: Colors.black54),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.

                                              setState(() {
                                                sort = value!;
                                              });
                                            },
                                            items: sortList
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
                                ],
                              ),
                            ),
                            h20,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: tableHeadColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      child: Text(
                                        "Sl.No",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        "Standard",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        "Section",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Actions",
                                        style: primaryFonts.copyWith(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            h10,
                            // for (int i = 0;
                            //     i < staffManageController.staffList.length;
                            //     i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1,
                                            offset:
                                                Offset(0, 1), // Shadow position
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 40,
                                            child: Text(
                                              (0 + 1).toString(),
                                              style: primaryFonts.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            child: Text(
                                              staffManageController
                                                  .staffList[1].designation,
                                              style: primaryFonts.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            height: 55,
                                            child: Flexible(
                                              child: Text(
                                                staffManageController
                                                    .staffList[1].address,
                                                style: primaryFonts.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.green),
                                                    alignment: Alignment.center,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            const AddSubjectExamView());
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'Manage',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.red),
                                                  alignment: Alignment.center,
                                                  child: const Icon(
                                                    Icons.delete,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.blue),
                                                  alignment: Alignment.center,
                                                  child: const Icon(
                                                    Icons.edit,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const RightBar(),
          ],
        ));
  }
}
