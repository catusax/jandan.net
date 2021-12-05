// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `dismiss`
  String get dismiss {
    return Intl.message(
      'dismiss',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Network error`
  String get network_error {
    return Intl.message(
      'Network error',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `Connect Timeout`
  String get connect_timeout {
    return Intl.message(
      'Connect Timeout',
      name: 'connect_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Send Timeout`
  String get send_timeout {
    return Intl.message(
      'Send Timeout',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Ceceive Timeout`
  String get receive_timeout {
    return Intl.message(
      'Ceceive Timeout',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Response Error`
  String get response {
    return Intl.message(
      'Response Error',
      name: 'response',
      desc: '',
      args: [],
    );
  }

  /// `Request Canceled`
  String get request_cancle {
    return Intl.message(
      'Request Canceled',
      name: 'request_cancle',
      desc: '',
      args: [],
    );
  }

  /// `Unknow Error`
  String get unknow_error {
    return Intl.message(
      'Unknow Error',
      name: 'unknow_error',
      desc: '',
      args: [],
    );
  }

  /// `Jandan`
  String get jandan {
    return Intl.message(
      'Jandan',
      name: 'jandan',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Add To Favorities`
  String get add_to_fav {
    return Intl.message(
      'Add To Favorities',
      name: 'add_to_fav',
      desc: '',
      args: [],
    );
  }

  /// `Copy Link Address`
  String get copy_addr {
    return Intl.message(
      'Copy Link Address',
      name: 'copy_addr',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Failed To Vote`
  String get failed_to_vote {
    return Intl.message(
      'Failed To Vote',
      name: 'failed_to_vote',
      desc: '',
      args: [],
    );
  }

  /// `NEWS`
  String get news {
    return Intl.message(
      'NEWS',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `TENDING`
  String get tending {
    return Intl.message(
      'TENDING',
      name: 'tending',
      desc: '',
      args: [],
    );
  }

  /// `PICS`
  String get pics {
    return Intl.message(
      'PICS',
      name: 'pics',
      desc: '',
      args: [],
    );
  }

  /// `LOMO`
  String get lomo {
    return Intl.message(
      'LOMO',
      name: 'lomo',
      desc: '',
      args: [],
    );
  }

  /// `FML`
  String get fml {
    return Intl.message(
      'FML',
      name: 'fml',
      desc: '',
      args: [],
    );
  }

  /// `Hot comment`
  String get hot_comment {
    return Intl.message(
      'Hot comment',
      name: 'hot_comment',
      desc: '',
      args: [],
    );
  }

  /// `Latest comment`
  String get latest_comment {
    return Intl.message(
      'Latest comment',
      name: 'latest_comment',
      desc: '',
      args: [],
    );
  }

  /// `Have no comment yet,click to refresh`
  String get have_no_comment_refresh {
    return Intl.message(
      'Have no comment yet,click to refresh',
      name: 'have_no_comment_refresh',
      desc: '',
      args: [],
    );
  }

  /// `Copy comment`
  String get copy_comment {
    return Intl.message(
      'Copy comment',
      name: 'copy_comment',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get reply {
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
