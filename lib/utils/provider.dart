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
            create: (_) => AppSetting(getDefaultTheme(), getDefaultBrightness(),
                getDefaultHideUnwelcome())),
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
  return MaterialColor(SPUtils.getThemeColor(), AppSetting.colorswatch);
}

Brightness getDefaultBrightness() {
  return SPUtils.getBrightness();
}

bool getDefaultHideUnwelcome() {
  return SPUtils.getHideUnwelcome();
}

///主题
class AppSetting with ChangeNotifier {
  static Map<int, Color> colorswatch = {
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: const Color.fromRGBO(136, 14, 79, .6),
    600: const Color.fromRGBO(136, 14, 79, .7),
    700: const Color.fromRGBO(136, 14, 79, .8),
    800: const Color.fromRGBO(136, 14, 79, .9),
    900: const Color.fromRGBO(136, 14, 79, 1),
  };

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
    Colors.lime,
  ];

  MaterialColor _themeColor;

  Brightness _brightness;

  bool _hideUnwelcome;

  AppSetting(this._themeColor, this._brightness, this._hideUnwelcome);

  void setColor(Color color) {
    _themeColor = MaterialColor(color.value, colorswatch);
    SPUtils.saveThemeColor(color.value);
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

  void setHideUnwelcome(bool hide) {
    _hideUnwelcome = hide;
    SPUtils.saveHideUnwelcome(hide);
    notifyListeners();
  }

  MaterialColor get themeColor => _themeColor;

  Brightness get brightness => _brightness;

  bool get hideUnwelcome => _hideUnwelcome;
}
