import 'package:flutter/widgets.dart';

class SimpleBlodText extends StatelessWidget {
  const SimpleBlodText(this.text, {Key? key, this.fontSize}) : super(key: key);
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
