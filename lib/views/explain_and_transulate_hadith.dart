// ignore_for_file: sized_box_for_whitespace, prefer_spread_collections

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/utiles/helper/text_converter.dart';
import 'package:flutter_svg/svg.dart';

class ExplainAndTransulateHadith extends StatefulWidget {
  final String text;
  const ExplainAndTransulateHadith({super.key, required this.text});

  @override
  State<ExplainAndTransulateHadith> createState() =>
      _ExplainAndTransulateHadithState();
}

class _ExplainAndTransulateHadithState
    extends State<ExplainAndTransulateHadith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  width: 65,
                ),
                const SizedBox(height: 50),
                convertHadith(context, widget.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
