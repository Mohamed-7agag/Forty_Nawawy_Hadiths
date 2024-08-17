// ignore_for_file: sort_child_properties_last,unused_local_variable,

import 'package:flutter/material.dart';
import 'package:flutter_application_ahades_40/database/database.dart';
import 'package:flutter_application_ahades_40/model/hadith.dart';
import 'package:flutter_application_ahades_40/screens/bottombar.dart';
import 'package:flutter_application_ahades_40/screens/homepage.dart';
import 'package:flutter_application_ahades_40/utiles/appstring.dart';
import 'package:flutter_svg/svg.dart';

class HadithsScreen extends StatefulWidget {
  const HadithsScreen({super.key});

  @override
  State<HadithsScreen> createState() => _HadithsScreenState();
}

class _HadithsScreenState extends State<HadithsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/background.svg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("  "),
                          SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: 65,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const Homepage(),
                                ));
                              },
                              child: SvgPicture.asset(
                                  "assets/images/arrow-right.svg",
                                  width: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.topRight,
                      child: AppText.header1,
                    )
                  ],
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/background.svg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                FutureBuilder(
                  future: Mydata.getAlldata(),
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
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomBar(hadith: item),
                              ));
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
                                          fontFamily: "myfont"),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
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
