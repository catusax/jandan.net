import 'package:flutter/material.dart';

import '../../core/utils/log.dart';
import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../utils/provider.dart';
import '../../widgets/layout/position.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = "/setting";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
          Divider(),
          Text(
            "其它",
            style: titleStyle,
          ).withPadding()
        ],
      ),
    );
  }
}
