import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/identity.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static SharedPreferences? _spf;

  static Future<SharedPreferences> init() async {
    _spf ??= await SharedPreferences.getInstance();
    return _spf!;
  }

  ///主题
  static Future<bool> saveThemeColor(int value) {
    return _spf!.setInt('key_theme_color', value);
  }

  static int getThemeColor() {
    if (_spf!.containsKey('key_theme_color')) {
      return _spf!.getInt('key_theme_color') != null
          ? _spf!.getInt('key_theme_color')!
          : Colors.blue.value;
    }
    return Colors.blue.value;
  }

  ///深色模式
  static Future<bool> saveBrightness(bool isDark) {
    return _spf!.setBool('key_brightness', isDark);
  }

  static Brightness getBrightness() {
    bool isDark = _spf!.containsKey('key_brightness')
        ? _spf!.getBool('key_brightness')!
        : false;
    return isDark ? Brightness.dark : Brightness.light;
  }

  ///是否同意隐私协议
  static Future<bool> saveIsAgreePrivacy(bool isAgree) {
    return _spf!.setBool('key_agree_privacy', isAgree);
  }

  static bool getisAgreePrivacy() {
    if (!_spf!.containsKey('key_agree_privacy')) {
      return false;
    }
    return _spf!.getBool('key_agree_privacy')!;
  }

  ///是否隐藏不受欢迎内容
  static Future<bool> saveHideUnwelcome(bool isAgree) {
    return _spf!.setBool('key_hide_unwelcome', isAgree);
  }

  static bool getHideUnwelcome() {
    if (!_spf!.containsKey('key_hide_unwelcome')) {
      return false;
    }
    return _spf!.getBool('key_hide_unwelcome')!;
  }

  ///用户身份
  static Future<bool> saveIdentity(Identity identity) {
    return _spf!.setString('key_identity', identity.toJson());
  }

  static Identity? getIdentity() {
    if (!_spf!.containsKey('key_identity')) {
      return null;
    }
    return Identity.fromJson(_spf!.getString('key_identity')!);
  }
}
