import 'package:flutter/material.dart';

RichText convertHadith(BuildContext context, String text) {
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
      children: [
        TextSpan(text: split.first),
        ...hadiths
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
            .toList()
      ],
    ),
    textDirection: TextDirection.rtl,
  );
}
