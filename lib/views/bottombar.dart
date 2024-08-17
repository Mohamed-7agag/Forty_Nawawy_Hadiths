// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/views/audio_screen.dart';
import 'package:flutter_application_ahades_40/views/hadith_detail.dart';
import 'package:flutter_application_ahades_40/views/hadith_text.dart';
import 'package:flutter_application_ahades_40/views/transulate_screen.dart';
import 'package:share/share.dart';

class BottomBar extends StatefulWidget {
  final Hadith hadith;
  const BottomBar({super.key, required this.hadith});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currenttab = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = HadithText(
      hadith: widget.hadith,
    );
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currenttab == 0
            ? HadithText(
                hadith: widget.hadith,
              )
            : currenttab == 1
                ? HadithDetail(explain: widget.hadith.explanationHadith)
                : currenttab == 2
                    ? TransualteScreen(
                        transulate: widget.hadith.translateNarrator,
                      )
                    : AudioScreen(
                        name: widget.hadith.nameHadith,
                        mp3: widget.hadith.audioHadith,
                      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(widget.hadith.textHadith,
              subject: widget.hadith.textHadith);
        },
        shape: const OvalBorder(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.share, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 68,
        shape: const CircularNotchedRectangle(),
        child: Container(
          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = HadithText(
                      hadith: widget.hadith,
                    );
                    currenttab = 0;
                  });
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.book,
                  color: currenttab == 0 ? Colors.green : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = HadithDetail(
                      explain: widget.hadith.explanationHadith,
                    );
                    currenttab = 1;
                  });
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.library_books,
                  color: currenttab == 1 ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 40.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = TransualteScreen(
                      transulate: widget.hadith.translateNarrator,
                    );
                    currenttab = 2;
                  });
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.collections_bookmark,
                  color: currenttab == 2 ? Colors.green : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = AudioScreen(
                      name: widget.hadith.nameHadith,
                      mp3: widget.hadith.audioHadith,
                    );
                    currenttab = 3;
                  });
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.volume_up,
                  color: currenttab == 3 ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
