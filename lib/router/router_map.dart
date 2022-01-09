import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../core/utils/log.dart';
import '../init/splash.dart';
import '../models/card_item.dart';
import '../models/posts/news.dart';
import '../page/home/homepage.dart';
import '../page/home/news/news_detail_page.dart';
import '../page/home/news/news_tucao_page.dart';
import '../page/home/pics/tucao_page.dart';
import '../page/image_viewer/image_viewer_page.dart';
import '../page/setting/easter_egg.dart';
import '../page/setting/setting_page.dart';

final router = FluroRouter();

class RouteMaps {
  void defineRoutes() {
    router.define("/", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const SplashPage();
    }));
    router.define("/home", handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const MyHomePage();
    }));
    router.define(TucaoPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return TucaoPage(
        item: CardItem.fromJson(params['item']!.first),
      );
    }));
    router.define(NewsTucaoPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return NewsTucaoPage(
        post: Post.fromJson(params['post']!.first),
      );
    }));
    router.define(ImageViewerPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return ImageViewerPage(
        images: List<String>.from(json.decode(params['images']!.first)),
        currentIndex: int.parse(params['currentIndex']!.first),
      );
    }));
    router.define(NewsDetailPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return NewsDetailPage(
        post: Post.fromJson(params[NewsDetailPage.paramPost]!.first),
      );
    }));
    router.define(SettingPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const SettingPage();
    }));
    router.define(EasterEggPage.routeName, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const EasterEggPage();
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
