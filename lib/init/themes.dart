import 'package:flutter/material.dart';

class Styles {
  static const double wigetVerticalMargin = 10; //组件之间的间距，组件都使用container
  static const double wigetHorizontalMargin = 25; //组件到页面两边的间距
  static const double bottomButtonHeight = 120; //最后一个按钮的容器高度

  static const padding = EdgeInsets.fromLTRB(
      //普通组建的padding
      Styles.wigetHorizontalMargin,
      Styles.wigetVerticalMargin,
      Styles.wigetHorizontalMargin,
      Styles.wigetVerticalMargin);

  static const double fontSizeSmall = 10;
  static const double fontSizeMiddle = 15;
  static const double fontSizeBig = 20;

  static const Color normalBg = Color(0x20A2D2FF);
  static const Color minerlBg = Color(0x20fee440);
  static const Color msigBg = Color(0x20ff865e);
}
