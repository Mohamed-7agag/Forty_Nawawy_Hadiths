// ignore_for_file: sort_child_properties_last,unused_local_variable,

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/database/database.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/views/audio_screen2.dart';
import 'package:flutter_application_ahades_40/utiles/appstring.dart';
import 'package:flutter_svg/svg.dart';

class AudiosGridView extends StatefulWidget {
  const AudiosGridView({super.key});

  @override
  State<AudiosGridView> createState() => _AudiosGridViewState();
}

class _AudiosGridViewState extends State<AudiosGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Row(
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
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: AppText.header2,
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/background.svg",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                FutureBuilder(
                  future: MyData.getAlldata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Hadith item = snapshot.data[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AudioScreen2(
                                    name: item.nameHadith,
                                    mp3: item.audioHadith,
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/images/Path 40.png"),
                                SvgPicture.asset("assets/images/Path 41.svg"),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${item.key}",
                                      style: const TextStyle(
                                        fontSize: 9,
                                        color: Colors.amber,
                                        fontFamily: "myfont",
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      "${item.nameHadith}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.amber,
                                        fontFamily: "myfont",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
