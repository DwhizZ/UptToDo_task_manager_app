import 'package:flutter/material.dart';

class IntroImage extends StatelessWidget {
  final String introPng;
  final String navPng;

  const IntroImage({Key? key, required this.introPng, required this.navPng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(introPng),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Image.asset(navPng),
        ),
      ],
    );
  }
}
