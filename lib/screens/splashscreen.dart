import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/screens/homepage.dart';
import 'package:flutter_application_ahades_40/utiles/appcolor.dart';
import 'package:flutter_application_ahades_40/utiles/appstring.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Homepage(),
      ));
    });
    super.initState();
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
