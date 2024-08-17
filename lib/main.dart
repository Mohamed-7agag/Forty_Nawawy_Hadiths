// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '40_Ahadiths',
      home: SplashView(),
    );
  }
}
