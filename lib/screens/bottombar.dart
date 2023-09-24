// ignore_for_file: prefer_const_constructors, sort_child_properties_last, 

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/screens/audio_screen.dart';
import 'package:flutter_application_ahades_40/screens/hadith_detail.dart';
import 'package:flutter_application_ahades_40/screens/hadith_text.dart';
import 'package:flutter_application_ahades_40/screens/transulate_screen.dart';
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
  Widget currentScreen = HadithText(
    text: "",
    name: "",
    kry: "",
  );

  @override
  Widget build(BuildContext context) {
    // currentScreen = HadithText(text: widget.hadith.textHadith);
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currenttab == 0
            ? HadithText(
                text: widget.hadith.textHadith,
                name: widget.hadith.nameHadith,
                kry: widget.hadith.key,
              )
            : currenttab == 1
                ? HadithDetail(explain: widget.hadith.explanationHadith)
                : currenttab == 2
                    ? TransualteScreen(
                        transulate: widget.hadith.translateNarrator,
                      )
                    : AudioScreen(name: widget.hadith.nameHadith,mp3: widget.hadith.audioHadith,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(widget.hadith.textHadith,
              subject: widget.hadith.textHadith);
        },
        child: Icon(Icons.share),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = HadithText(
                      text: widget.hadith.textHadith,
                      name: widget.hadith.nameHadith,
                      kry: widget.hadith.key,
                    );
                    currenttab = 0;
                  });
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.book,
                  size: 30,
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
                  size: 30,
                  color: currenttab == 1 ? Colors.green : Colors.grey,
                ),
              ),
              SizedBox(
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
                  size: 30,
                  color: currenttab == 2 ? Colors.green : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = AudioScreen(name: widget.hadith.nameHadith,mp3: widget.hadith.audioHadith,);
                    currenttab = 3;
                  });
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.volume_up,
                  size: 30,
                  color: currenttab == 3 ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        elevation: 15,
      ),
    );
  }
}
