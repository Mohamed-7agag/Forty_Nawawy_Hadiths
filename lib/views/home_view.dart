// ignore_for_file: sort_child_properties_last,

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/views/audios_grid_view.dart';
import 'package:flutter_application_ahades_40/views/hadiths_grid_view.dart';
import 'package:flutter_application_ahades_40/utiles/appcolor.dart';
import 'package:flutter_application_ahades_40/utiles/appstring.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/home_page_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          SvgPicture.asset("assets/images/background.svg"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 70),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    width: 65,
                  ),
                ),
                const SizedBox(height: 40),
                AppText.topHomeScreen,
                const SizedBox(height: 10),
                AppText.headerHomeScreen,
                const SizedBox(height: 70),
                const HomePageItem(
                  title: AppText.bookOneScreen,
                  image: "assets/images/quran(3)@3x.png",
                  colors: [AppColor.green2, AppColor.green1],
                  destScreen: HadithsGridView(),
                ),
                const SizedBox(height: 10),
                const HomePageItem(
                  title: AppText.bookTwoScreen,
                  image: "assets/images/play@3x.png",
                  colors: [
                    Color.fromARGB(255, 222, 115, 8),
                    Color.fromARGB(255, 239, 217, 26)
                  ],
                  destScreen: AudiosGridView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
