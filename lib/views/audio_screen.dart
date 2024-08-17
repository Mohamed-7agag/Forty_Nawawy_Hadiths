// ignore_for_file: unnecessary_string_interpolations, sized_box_for_whitespace, invalid_use_of_visible_for_testing_member,

import 'package:audioplayers/audioplayers.dart';
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
    await player.play(AssetSource('audios/${widget.mp3}'));
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
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    width: 65,
                  ),
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
                        "${widget.name}",
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
                  height: 60,
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
                  height: 15,
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
      )),
    );
  }
}