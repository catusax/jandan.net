import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../router/router_map.dart';
import '../../utils/provider.dart';
import '../../widgets/layout/identity_dialog.dart';
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
            locator<S>().general_setting,
            style: titleStyle,
          ).withPadding(),
          ListTile(
            title: Text(locator<S>().hide_unwelcome),
            subtitle: Text(locator<S>().hide_unwelcome_msg),
            trailing: Switch(
              value: Store.value<AppSetting>(context).hideUnwelcome,
              onChanged: (value) {
                Store.value<AppSetting>(context).setHideUnwelcome(value);
              },
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(locator<S>().identity),
            subtitle: Text(locator<S>().identity_msg),
            onTap: () {
              showidentityDialog(context);
            },
          ),
          const Divider(),
          Text(locator<S>().other, style: titleStyle).withPadding(),
          ListTile(
            title: Text(locator<S>().about),
            onTap: () {
              //TODO: 关于
            },
          ),
          ListTile(
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
