// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations, prefer_spread_collections

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HadithText extends StatefulWidget {
  final String text;
  final String name;
  final String kry;
  const HadithText(
      {super.key, required this.text, required this.name, required this.kry});

  @override
  State<HadithText> createState() => _HadithTextState();
}

class _HadithTextState extends State<HadithText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 65,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${widget.kry}",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.name}",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: double.infinity,
              height: 480,
              child: SingleChildScrollView(
                child: _convertHadith(context, widget.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(["{${texts.first}}", (e.substring(texts.first.length + 1))]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: TextStyle(
          fontSize: 20,
          color: Colors.green,
          fontWeight: FontWeight.w700,
          fontFamily: "myfont",
          height: 1.8),
      //style: DefaultTextStyle.of(context).style,
      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map((text) => text.contains("{")
              ? TextSpan(
                  text: text,
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      height: 1.8,
                      fontFamily: "myfont"))
              : TextSpan(text: text))
          .toList()),
    ),
    textDirection: TextDirection.rtl,
  );
}
