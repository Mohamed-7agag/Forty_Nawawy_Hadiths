// ignore_for_file: sized_box_for_whitespace, prefer_spread_collections

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/utiles/helper/text_converter.dart';
import 'package:flutter_svg/svg.dart';

class HadithDetail extends StatefulWidget {
  final String explain;
  const HadithDetail({super.key, required this.explain});

  @override
  State<HadithDetail> createState() => _HadithDetailState();
}

class _HadithDetailState extends State<HadithDetail> {
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
                child: convertHadith(context, widget.explain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


