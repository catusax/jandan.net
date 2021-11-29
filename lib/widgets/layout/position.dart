import 'package:flutter/widgets.dart';
import 'package:online/init/themes.dart';

extension Position on Widget {
  Widget withPadding({
    double top = Styles.wigetVerticalMargin,
    double left = Styles.wigetHorizontalMargin,
    double right = Styles.wigetHorizontalMargin,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Widget withCenter() {
    return Center(child: this);
  }
}
