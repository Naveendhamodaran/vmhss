import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/views/staff_management/staff_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/student_management/student_management_view.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(color: secondaryColor.withOpacity(0.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.menu,
                  color: primaryColor,
                  size: 17,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.dashboard_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "DashBoard",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.cloud_upload_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Data Import",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  CupertinoIcons.star,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Privilages",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.photo_size_select_small_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Section",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Get.to(() => const StudentManagementView());
            },
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.portrait_rounded,
                    color: primaryColor,
                    size: 17,
                  ),
                ),
                Text(
                  "Student",
                  style: primaryFonts.copyWith(
                      fontSize: 10,
                      color: const Color.fromARGB(255, 4, 63, 110),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => StaffManageView());
            },
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.person_pin,
                    color: primaryColor,
                    size: 17,
                  ),
                ),
                Text(
                  "Staf",
                  style: primaryFonts.copyWith(
                      fontSize: 10,
                      color: const Color.fromARGB(255, 4, 63, 110),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.bus_alert_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Bus",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.table_chart_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Attandance",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.calculate_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Exam",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.data_saver_off_sharp,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Mark",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
