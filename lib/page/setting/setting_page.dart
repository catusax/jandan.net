import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:jandan/init/themes.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../router/router_map.dart';
import '../../utils/provider.dart';
import '../../widgets/layout/identity_dialog.dart';
import 'easter_egg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = "/setting";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String version = "1.0.0";
  Timer timer = Timer(const Duration(seconds: 0), () {});
  int clickTimes = 0;

  @override
  void initState() {
    //TODO: 修复版本号问题

    // () async {
    //   final packageinfo = await PackageInfo.fromPlatform();
    //   setState(() {
    //     version = "${packageinfo.version} [${packageinfo.buildNumber}]";
    //   });
    // }.call();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(locator<S>().setting),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Styles.wigetHorizontalMargin, 10,
                Styles.wigetHorizontalMargin, 0),
            child: Text(
              locator<S>().general_setting,
              style: titleStyle,
            ),
          ),
          // 隐藏不欢迎
          ListTile(
            title: Text(locator<S>().hide_unwelcome),
            subtitle: Text(locator<S>().hide_unwelcome_msg),
            trailing: Consumer<AppSetting>(
              builder: (context, appSetting, _) {
                return Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: appSetting.hideUnwelcome,
                  onChanged: (value) {
                    appSetting.setHideUnwelcome(value);
                  },
                );
              },
            ),
            onTap: () {},
          ),
          // 身份
          ListTile(
            title: Text(locator<S>().identity),
            subtitle: Text(locator<S>().identity_msg),
            onTap: () {
              showidentityDialog(context);
            },
          ),
          // 主题
          ListTile(
            title: Text(locator<S>().theme),
            subtitle: Text(locator<S>().theme_color),
            onTap: () {
              showColorPickerDialog(context);
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(Styles.wigetHorizontalMargin, 10,
                Styles.wigetHorizontalMargin, 0),
            child: Text(locator<S>().other, style: titleStyle),
          ),
          // 关于
          ListTile(
            title: Text(locator<S>().about),
            onTap: () {
              //TODO: 关于
            },
          ),
          ListTile(
            // 版本号
            title: Text(locator<S>().version),
            subtitle: Text(version),
            onTap: () {
              timer.cancel();
              clickTimes++;
              if (clickTimes == 5) {
                clickTimes = 0;
                RouteMaps.navigateTo(context, EasterEggPage.routeName);
              } else {
                timer = Timer(const Duration(seconds: 1), () {
                  clickTimes = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

showColorPickerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(locator<S>().theme_color),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlockPicker(
              pickerColor: Store.value<AppSetting>(context).themeColor,
              onColorChanged: (color) {
                Store.value<AppSetting>(context).setColor(color);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    },
  );
}
