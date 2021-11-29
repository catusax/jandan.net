import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WuliaoPage extends StatelessWidget {
  const WuliaoPage({Key? key, required this.refreshController})
      : super(key: key);
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: () {
        Future.delayed(Duration(seconds: 3), () {
          refreshController.refreshCompleted();
        });
      },
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      child: ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          itemBuilder: (context, idx) {
            return Text("asd");
          }),
    );
  }
}
