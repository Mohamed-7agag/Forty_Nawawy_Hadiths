// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/screens/hadiths_aud_screen.dart';
import 'package:flutter_application_ahades_40/screens/hadiths_screen.dart';
import 'package:flutter_application_ahades_40/utiles/appcolor.dart';
import 'package:flutter_application_ahades_40/utiles/appstring.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset("assets/images/background.svg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    width: 65,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                AppText.topHomeScreen,
                SizedBox(
                  height: 10,
                ),
                AppText.headerHomeScreen,
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HadithsScreen(),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: double.infinity,
                    height: 115,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.green2, AppColor.green1],
                      ),
                      color: AppColor.green1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/quran(3).png",
                          height: 70.0,
                        ),
                        AppText.bookOneScreen,
                        SvgPicture.asset("assets/images/one.svg")
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HadithsScreenAudio(),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: double.infinity,
                    height: 115,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 222, 115, 8),
                          Color.fromARGB(255, 239, 217, 26)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/play.png",
                          height: 60.0,
                        ),
                        AppText.bookTwoScreen,
                        SvgPicture.asset("assets/images/two.svg")
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColor.red1, AppColor.red2],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/save-instagram.png",
                        height: 60.0,
                      ),
                      AppText.bookThreeScreen,
                      SvgPicture.asset("assets/images/three.svg")
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}
