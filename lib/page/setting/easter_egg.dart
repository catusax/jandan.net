import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/provider.dart';

class EasterEggPage extends StatefulWidget {
  const EasterEggPage({Key? key}) : super(key: key);
  static const routeName = "/easter_egg";

  @override
  _EasterEggPageState createState() => _EasterEggPageState();
}

class _EasterEggPageState extends State<EasterEggPage> {
  Color imageColor = Colors.yellow;
  bool showorigin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dy.abs() <= 100 && details.delta.dx >= 10) {
            Navigator.of(context).pop();
          }
        },
        onTap: () {
          setState(() {
            final num = Random().nextInt(12);
            imageColor = AppSetting.materialColors[num] as Color;
          });
        },
        onLongPress: () {
          setState(() {
            showorigin = !showorigin;
          });
        },
        child: Center(
            child: Image.asset(
          Assets.assetsLoadFailed,
          color: showorigin ? null : imageColor,
        )),
      ),
    );
  }
}
