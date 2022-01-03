import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../router/router_map.dart';
import '../../utils/provider.dart';
import '../setting/setting_page.dart';
import 'hot/hot_page.dart';
import 'lomo/lomo_page.dart';
import 'news/news_page.dart';
import 'wuliao/wuliao_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const buttonMargin = 40.0; //左右边距
  static const buttonPadding = 15.0;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController wuliaoScrollController = ScrollController();

  final ScrollController newsScrollController = ScrollController();

  final ScrollController hotScrollController = ScrollController();

  final ScrollController lomoScrollController = ScrollController();

  final ScrollController fmlScrollController = ScrollController();

  int currentPosition = -1;

  @override
  Widget build(BuildContext context) {
    //TODO: https://gist.github.com/iRbouh/219a81b3f2e32c3ef725972b45627f2e
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  //TODO: 发帖页面
                },
                icon: const Icon(Icons.add),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_rounded),
                itemBuilder: (BuildContext popupMenuContext) => [
                  PopupMenuItem(
                    child: ListTile(
                      title: Text(locator<S>().darkmode),
                      onTap: () {
                        Store.value<AppSetting>(context).changeBrightness();
                        Navigator.of(popupMenuContext).pop();
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: Text(locator<S>().favorities),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: Text(locator<S>().setting),
                    ),
                    onTap: () {
                      Navigator.of(popupMenuContext).pop();
                      //TODO: BUG,需要navigate两遍才能进入页面，不知道为什么
                      RouteMaps.navigateTo(context, SettingPage.routeName,
                          params: {});
                      RouteMaps.navigateTo(context, SettingPage.routeName,
                          params: {});
                      // RouteMaps.navigateTo(
                      //     popupMenuContext, SettingPage.routeName,
                      //     params: {});
                    },
                  )
                ],
              )
            ],
            title: const Text("Jandan"),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                tabs: [
                  Tab(text: locator<S>().news),
                  Tab(text: locator<S>().tending),
                  Tab(text: locator<S>().pics),
                  Tab(text: locator<S>().lomo),
                  Tab(text: locator<S>().fml),
                ],
                onTap: (position) {
                  switch (position) {
                    case 2:
                      if (currentPosition == position) {
                        wuliaoScrollController.jumpTo(0);
                      }
                      break;
                    case 0:
                      if (currentPosition == position) {
                        newsScrollController.jumpTo(0);
                      }
                      break;
                    default:
                  }
                  currentPosition = position;
                  //TODO:双击刷新
                  // _wuliaorefreshController.requestRefresh();
                },
              ),
            )),
        body: TabBarView(
          children: [
            NewsPage(
              scrollController: newsScrollController,
            ),
            HotPage(
              scrollController: hotScrollController,
            ),
            WuliaoPage(
              scrollController: wuliaoScrollController,
            ),
            LomoPage(
              commentId: "21183",
              scrollController: lomoScrollController,
            ),
            LomoPage(
              commentId: "102312",
              scrollController: fmlScrollController,
            ),
          ],
        ),
      ),
    );
  }
}
