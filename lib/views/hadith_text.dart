// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, prefer_spread_collections
import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/utiles/helper/text_converter.dart';
import 'package:flutter_svg/svg.dart';

class HadithText extends StatefulWidget {
  final Hadith hadith;
  const HadithText({super.key, required this.hadith});

  @override
  State<HadithText> createState() => _HadithTextState();
}

class _HadithTextState extends State<HadithText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    width: 65,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "${widget.hadith.key}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "myfont",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${widget.hadith.nameHadith}",
                  style: const TextStyle(
                      fontSize: 21,
                      fontFamily: "myfont",
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 25),
                convertHadith(context, widget.hadith.textHadith),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
