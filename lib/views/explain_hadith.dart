// ignore_for_file: sized_box_for_whitespace, prefer_spread_collections

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/utiles/helper/text_converter.dart';
import 'package:flutter_svg/svg.dart';

class ExplainHadith extends StatefulWidget {
  final Hadith hadith;
  const ExplainHadith({super.key, required this.hadith});

  @override
  State<ExplainHadith> createState() => _ExplainHadithState();
}

class _ExplainHadithState extends State<ExplainHadith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 65,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 575,
              child: SingleChildScrollView(
                child: convertHadith(context, widget.hadith.explanationHadith),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

