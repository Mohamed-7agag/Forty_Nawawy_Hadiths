// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, prefer_spread_collections
import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.hadith.key}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "myfont",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 500,
                child: SingleChildScrollView(
                  child: _convertHadith(context, widget.hadith.textHadith),
                ),
              ),
            ],
          ),
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
      style: const TextStyle(
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
                  style: const TextStyle(
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
