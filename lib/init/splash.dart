import 'package:flutter/material.dart';

import '../router/router_map.dart';

//类似广告启动页
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    countDown(context);
    return const Scaffold(
      body: Center(
        child: SizedBox(
          child: FlutterLogo(),
        ),
      ),
    );
  }

  //倒计时
  void countDown(BuildContext context) {
    var _duration = const Duration(milliseconds: 100);
    Future.delayed(_duration, () {
      goHomePage(context);
    });
  }

  //页面跳转
  void goHomePage(BuildContext context) {
    RouteMaps.navigateTo(context, '/home', clearStack: true);
  }
}
