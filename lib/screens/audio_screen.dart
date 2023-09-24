// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, invalid_use_of_visible_for_testing_member, 

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AudioScreen extends StatefulWidget {
  final String name;
  final String mp3;
  const AudioScreen({super.key, required this.name, required this.mp3});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  //
  // AudioPlayer audioPlayer = AudioPlayer();
  // AudioCache audioCache = AudioCache(fixedplayer : audioPlayer);
  bool isplaying = false;
  // stopMusic() {}

  // playMusic() async {
    
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/background.svg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                  width: 65,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                          fontFamily: "myfont",
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SvgPicture.asset(
                "assets/images/Group 31.svg",
                width: 320,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                child: Slider(
                  activeColor: Colors.yellow,
                  value: 0.5,
                  onChanged: (val) {},
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow,
                ),
                child: IconButton(
                  onPressed: () {
                    if (isplaying == true) {
                      setState(() {
                        isplaying = false;
                      });
                      // stopMusic();
                    } else {
                      setState(() {
                        isplaying = true;
                      });
                      // playMusic();
                    }
                  },
                  icon: Icon(
                    isplaying == true ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
