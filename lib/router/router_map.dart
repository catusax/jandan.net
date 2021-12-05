import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../core/utils/log.dart';
import '../init/splash.dart';
import '../models/wuliao/comment.dart';
import '../page/home/homepage.dart';
import '../page/home/wuliao/tucao_page.dart';

final router = FluroRouter();

class RouteMaps {
  void defineRoutes() {
    router.define("/", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const SplashPage();
    }));
    router.define("/home", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return MyHomePage();
    }));
    router.define(TucaoPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return TucaoPage(
        item: Comment.fromJson(params['item']!.first),
      );
    }));
  }

  //自定义的参数跳转
  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic>? params,
      TransitionType transition = TransitionType.inFromRight,
      bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "&";
        }
        query += "$key=$value";
        index++;
      }
    }
    path += query;
    Log.route.info(path);
    return router.navigateTo(context, path,
        transition: transition,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings);
  }
}
