import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'wuliao/wuliao_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const buttonMargin = 40.0; //左右边距
  static const buttonPadding = 15.0;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();

  int currentPosition = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: ExtendedNestedScrollView(
          controller: scrollController,
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
                  tabs: const [
                    Tab(text: "新鲜事"),
                    Tab(text: "热榜"),
                    Tab(text: "无聊图"),
                    Tab(text: "随手拍"),
                    Tab(text: "树洞"),
                  ],
                  onTap: (position) {
                    switch (position) {
                      case 2:
                        if (currentPosition == position) {
                          scrollController.jumpTo(0);
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
              const Icon(Icons.directions_car),
              const Icon(Icons.directions_car),
              WuliaoPage(
                scrollController: scrollController,
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



// return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: "新鲜事"),
//               Tab(text: "热榜"),
//               Tab(text: "无聊图"),
//               Tab(text: "随手拍"),
//               Tab(text: "树洞"),
//             ],
//           ),
//           title: const Text('Jandan'),
//         ),
//         body: TabBarView(
//           children: [
//             const Icon(Icons.directions_car),
//             const Icon(Icons.directions_car),
//             WuliaoPage(refreshController: _wuliaorefreshController),
//             const Icon(Icons.directions_bike),
//             const Icon(Icons.directions_bike),
//           ],
//         ),
//       ),
//     )