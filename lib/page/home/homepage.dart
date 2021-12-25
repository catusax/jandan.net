import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';
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

  int currentPosition = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: ExtendedNestedScrollView(
          floatHeaderSlivers: true,
          onlyOneScrollInBody: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                title: const Text("Jandan"),
                bottom: TabBar(
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
              ),
            ];
          },
          body: TabBarView(
            children: [
              NewsPage(
                scrollController: newsScrollController,
              ),
              const Icon(Icons.directions_car),
              WuliaoPage(
                scrollController: wuliaoScrollController,
              ),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
