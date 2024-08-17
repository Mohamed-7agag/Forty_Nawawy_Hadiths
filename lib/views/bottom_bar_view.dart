// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/views/audio_view.dart';
import 'package:flutter_application_ahades_40/views/explain_and_transulate_hadith.dart';
import 'package:flutter_application_ahades_40/views/hadith_text.dart';
import 'package:share/share.dart';

class BottomBarView extends StatefulWidget {
  final Hadith hadith;
  const BottomBarView({super.key, required this.hadith});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: [
          HadithText(hadith: widget.hadith),
          ExplainAndTransulateHadith(text: widget.hadith.explanationHadith),
          ExplainAndTransulateHadith(text: widget.hadith.translateNarrator),
          AudioView(
            isFromBottomBar: true,
            hadith: widget.hadith,
          ),
        ],
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
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() => currentTab = 0);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.book,
                  color: currentTab == 0 ? Colors.green : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() => currentTab = 1);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.library_books,
                  color: currentTab == 1 ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 40.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() => currentTab = 2);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.collections_bookmark,
                  color: currentTab == 2 ? Colors.green : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() => currentTab = 3);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.volume_up,
                  color: currentTab == 3 ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
