// ignore_for_file:unnecessary_string_interpolations, sized_box_for_whitespace, invalid_use_of_visible_for_testing_member,

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_svg/svg.dart';

class AudioView extends StatefulWidget {
  final Hadith hadith;
  final bool? isFromBottomBar;
  const AudioView(
      {super.key, required this.hadith, this.isFromBottomBar = false});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  late AudioPlayer player;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playMusic() async {
    await player.play(AssetSource('audios/${widget.hadith.audioHadith}'));
  }

  void pauseMusic() async {
    await player.pause();
  }

  bool isplaying = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          await player.stop();
        }
      },
      child: Scaffold(
          body: SafeArea(
            child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
            SvgPicture.asset("assets/images/background.svg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: widget.isFromBottomBar == true
                        ? SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: 65,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("     "),
                              SvgPicture.asset(
                                "assets/images/logo.svg",
                                width: 65,
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_forward_ios_rounded),
                              )
                            ],
                          ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${widget.hadith.nameHadith}",
                          style: const TextStyle(
                              fontFamily: "myfont",
                              fontSize: 22,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SvgPicture.asset(
                    "assets/images/Group 31.svg",
                    width: 280,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 400,
                    child: Slider(
                      activeColor: Colors.yellow,
                      value: 0.5,
                      onChanged: (val) {},
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 65,
                    height: 65,
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
                          pauseMusic();
                        } else {
                          setState(() {
                            isplaying = true;
                          });
                          playMusic();
                        }
                      },
                      icon: Icon(
                        isplaying == true ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
                    ],
                  ),
          )),
    );
  }
}