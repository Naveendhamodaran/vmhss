import 'package:attandence_admin_panel/constants/app_colors.dart';
import 'package:attandence_admin_panel/constants/app_fonts.dart';
import 'package:attandence_admin_panel/views/profile_view/profile_view.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/left_bar.dart';
import 'package:attandence_admin_panel/widgets/common_widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Image.asset(
              "assets/icons/vmhslogo.png",
            ),
            leadingWidth: 100,
            centerTitle: true,
            title: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(13)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.menu,
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.2))),
                  ),
                )
              ],
            ),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(13)),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.notifications_none,
                      color: secondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileView());
                      },
                      child: Container(
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.yellow.withOpacity(0.5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.blue[300],
                                size: 23,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.settings_outlined,
                                color: Colors.blue[300],
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
      ),

      ///app bar

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftBar(),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.8),
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "T",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "01",
                                          style: primaryFonts.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: size.width * 0.17,
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: size.width * 0.06,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Total No Of Staffs",
                                          style: primaryFonts.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.8),
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "T",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "01",
                                          style: primaryFonts.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: size.width * 0.17,
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: size.width * 0.06,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Total No Of Staffs",
                                          style: primaryFonts.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.8),
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "T",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "01",
                                          style: primaryFonts.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: size.width * 0.17,
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: size.width * 0.06,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Total No Of Staffs",
                                          style: primaryFonts.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.8),
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "T",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "01",
                                          style: primaryFonts.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: size.width * 0.17,
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: size.width * 0.06,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Total No Of Staffs",
                                          style: primaryFonts.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.8),
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "T",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "01",
                                          style: primaryFonts.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: size.width * 0.17,
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: size.width * 0.06,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Total No Of Staffs",
                                          style: primaryFonts.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.8),
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "T",
                                      style: primaryFonts.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "01",
                                          style: primaryFonts.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: size.width * 0.17,
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: size.width * 0.06,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Total No Of Staffs",
                                          style: primaryFonts.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 4, 63, 110)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          RightBar()
        ],
      ),
    );
  }
}
