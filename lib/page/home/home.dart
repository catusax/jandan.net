import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const buttonMargin = 40.0; //左右边距
  static const buttonPadding = 15.0; //按钮内部上下边距

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
