// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/views/home_view.dart';
import 'package:flutter_application_ahades_40/utiles/appcolor.dart';
import 'package:flutter_application_ahades_40/utiles/appstring.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.green1,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/splash.svg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/islamic.svg",
                  width: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                AppText.splashScreen
              ],
            ),
          ],
        ));
  }
}
