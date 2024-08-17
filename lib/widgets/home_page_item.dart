import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({
    super.key,
    required this.title,
    required this.image,
    required this.colors,
    required this.destScreen,
  });
  final Widget title;
  final String image;
  final List<Color> colors;
  final Widget destScreen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => destScreen,
        ));
      },
      child: SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.centerRight,
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 7),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: title,
              ),
              Positioned(
                top: -10,
                right: 20,
                child: Image.asset(
                  image,
                  height: 65,
                ),
              )
            ],
          )),
    );
  }
}
