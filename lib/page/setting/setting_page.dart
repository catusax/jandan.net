import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/utils/log.dart';
import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../router/router_map.dart';
import '../../utils/provider.dart';
import '../../widgets/layout/position.dart';
import 'easter_egg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = "/setting";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String version = "";
  Timer timer = Timer(const Duration(seconds: 0), () {});
  int clickTimes = 0;

  @override
  void initState() {
    () async {
      final packageinfo = await PackageInfo.fromPlatform();
      setState(() {
        version = "${packageinfo.version} [${packageinfo.buildNumber}]";
      });
    }.call();

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
          Text(
            locator<S>().setting,
            style: titleStyle,
          ).withPadding(),
          ListTile(
            title: Text("隐藏不受欢迎内容"),
            subtitle: Text("隐藏xx数量多于10并且多于oo的内容"),
            trailing: Switch(
              value: Store.value<AppSetting>(context).hideUnwelcome,
              onChanged: (value) {
                Log.log.fine("hideUnwelcome: ${value}");
                Store.value<AppSetting>(context).setHideUnwelcome(value);
              },
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("游客帐号"),
            subtitle: Text("设置用于评论的身份"),
            onTap: () {
              //TODO: 游客身份 dialog
            },
          ),
          Divider(),
          Text(
            "其它",
            style: titleStyle,
          ).withPadding(),
          ListTile(
            title: Text("关于"),
            onTap: () {
              //TODO: 游客身份 dialog
            },
          ),
          ListTile(
            title: Text("版本号"),
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
