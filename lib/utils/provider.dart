import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sputils.dart';

//状态管理
class Store {
  Store._internal();

  //全局初始化
  static init(Widget child) {
    //多个Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AppTheme(getDefaultTheme(), getDefaultBrightness())),
      ],
      child: child,
    );
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T value<T>(BuildContext context, {bool listen = false}) {
    return Provider.of<T>(context, listen: listen);
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T of<T>(BuildContext context, {bool listen = true}) {
    return Provider.of<T>(context, listen: listen);
  }

  // 不会引起页面的刷新，只刷新了 Consumer 的部分，极大地缩小你的控件刷新范围
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}

MaterialColor getDefaultTheme() {
  return AppTheme.materialColors[SPUtils.getThemeIndex()];
}

Brightness getDefaultBrightness() {
  return SPUtils.getBrightness();
}

///主题
class AppTheme with ChangeNotifier {
  static final List<MaterialColor> materialColors = [
    Colors.blue,
    Colors.lightBlue,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.lime
  ];

  MaterialColor _themeColor;

  Brightness _brightness;

  AppTheme(this._themeColor, this._brightness);

  void setColor(MaterialColor color) {
    _themeColor = color;
    notifyListeners();
  }

  void changeColor(int index) {
    _themeColor = materialColors[index];
    SPUtils.saveThemeIndex(index);
    notifyListeners();
  }

  void setBrightness(bool isDark) {
    _brightness = isDark ? Brightness.dark : Brightness.light;
    SPUtils.saveBrightness(isDark);
    notifyListeners();
  }

  void changeBrightness() {
    _brightness =
        _brightness == Brightness.light ? Brightness.dark : Brightness.light;
    SPUtils.saveBrightness(_brightness == Brightness.dark);
    notifyListeners();
  }

  MaterialColor get themeColor => _themeColor;

  Brightness get brightness => _brightness;
}
