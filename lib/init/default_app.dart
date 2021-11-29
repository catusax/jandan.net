import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../core/http/http.dart';
import '../generated/l10n.dart';
import '../router/router_map.dart';
import '../utils/provider.dart';
import '../utils/sputils.dart';
import 'locator.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    initFirst().then((value) => runApp(Store.init(const MyApp())));
    initApp();
  }

  /// 必须要优先初始化的内容
  static Future<void> initFirst() async {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      log(record.message,
          name: record.loggerName,
          level: record.level.value,
          time: record.time,
          zone: record.zone,
          stackTrace: record.stackTrace,
          error: record.error,
          sequenceNumber: record.sequenceNumber);
    });
    await SPUtils.init();
    setupLocator();
  }

  /// 程序初始化操作
  static void initApp() {
    RouteMaps().defineRoutes();
    XHttp.init();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, appTheme, _) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            primarySwatch: appTheme.themeColor,
            textTheme: const TextTheme(button: TextStyle(color: Colors.black)),
            buttonTheme: const ButtonThemeData(
              buttonColor: Colors.teal,
              textTheme: ButtonTextTheme.normal,
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(appTheme.themeColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          title: 'ImFIl',
          onGenerateRoute: router.generator,
        );
      },
    );
  }
}
