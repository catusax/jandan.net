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

  /// `cancle`
  String get cancle {
    return Intl.message(
      'cancle',
      name: 'cancle',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
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

  /// `darkmode`
  String get darkmode {
    return Intl.message(
      'darkmode',
      name: 'darkmode',
      desc: '',
      args: [],
    );
  }

  /// `setting`
  String get setting {
    return Intl.message(
      'setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Favorities`
  String get favorities {
    return Intl.message(
      'Favorities',
      name: 'favorities',
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

  /// `Failed to save image`
  String get failed_to_save {
    return Intl.message(
      'Failed to save image',
      name: 'failed_to_save',
      desc: '',
      args: [],
    );
  }

  /// `Successfully saved image`
  String get save_success {
    return Intl.message(
      'Successfully saved image',
      name: 'save_success',
      desc: '',
      args: [],
    );
  }

  /// `Failed to share image`
  String get failed_to_share {
    return Intl.message(
      'Failed to share image',
      name: 'failed_to_share',
      desc: '',
      args: [],
    );
  }

  /// `Tap to see full image`
  String get tap_to_see_full_img {
    return Intl.message(
      'Tap to see full image',
      name: 'tap_to_see_full_img',
      desc: '',
      args: [],
    );
  }

  /// `load image failed, click to reload`
  String get load_failed {
    return Intl.message(
      'load image failed, click to reload',
      name: 'load_failed',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general_setting {
    return Intl.message(
      'General',
      name: 'general_setting',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Identity`
  String get identity {
    return Intl.message(
      'Identity',
      name: 'identity',
      desc: '',
      args: [],
    );
  }

  /// `Identity to comment`
  String get identity_msg {
    return Intl.message(
      'Identity to comment',
      name: 'identity_msg',
      desc: '',
      args: [],
    );
  }

  /// `Nick name`
  String get nickname {
    return Intl.message(
      'Nick name',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Hide unwelcome`
  String get hide_unwelcome {
    return Intl.message(
      'Hide unwelcome',
      name: 'hide_unwelcome',
      desc: '',
      args: [],
    );
  }

  /// `Hide comment that xx >=5 && xx >= oo`
  String get hide_unwelcome_msg {
    return Intl.message(
      'Hide comment that xx >=5 && xx >= oo',
      name: 'hide_unwelcome_msg',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Theme color`
  String get theme_color {
    return Intl.message(
      'Theme color',
      name: 'theme_color',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
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
