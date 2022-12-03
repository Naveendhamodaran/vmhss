import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightBar extends StatelessWidget {
  const RightBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.sms_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "SMS",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
            const  SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.adf_scanner_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Bonafied",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
            const  SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.home_work_rounded,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Home Work",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
            const  SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.book_outlined,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Achivement",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
            const  SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.event,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              Text(
                "Events",
                style: primaryFonts.copyWith(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 4, 63, 110),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}
