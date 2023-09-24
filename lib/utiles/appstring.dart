import 'package:flutter/material.dart';

abstract class AppText {
  static const Text splashScreen = Text(
    "ألاربعون النوويه",
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36,fontFamily: "myfont"),
  );

  static const Text topHomeScreen = Text(
    "ألاربعون النوويه",
    textDirection: TextDirection.rtl,
    style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "myfont"),
  );
  static const Text headerHomeScreen = Text(
    "لحفظ وسماع الاحاديث النوويه",
    style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "myfont"),
  );

  static const Text bookOneScreen = Text(
    "ألأحاديث الاربعون",
    style: TextStyle(
        fontFamily: "myfont",
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold),
  );
  static const Text header1 = Text(
    "ألأحاديث الاربعون",
    style: TextStyle(
        fontFamily: "myfont",
        fontSize: 25,
        color: Colors.green,
        fontWeight: FontWeight.bold),
  );
  static const Text bookTwoScreen = Text(
    "ألأستماع للأحاديث",
    style: TextStyle(
        fontFamily: "myfont",
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold),
  );
  static const Text header2 = Text(
    "ألأستماع للأحاديث",
    style: TextStyle(
        fontFamily: "myfont",
        fontSize: 23,
        color: Colors.green,
        fontWeight: FontWeight.bold),
  );
  static const Text bookThreeScreen = Text(
    "ألأحاديث المحفوظه",
    style: TextStyle(
        fontFamily: "myfont",
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold),
  );
}
