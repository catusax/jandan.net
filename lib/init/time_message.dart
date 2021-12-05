import 'package:timeago/timeago.dart';

class CNTimeMessage extends LookupMessages {
  @override
  String aDay(int hours) {
    return "一天前";
  }

  @override
  String aboutAMinute(int minutes) {
    return "一分钟前";
  }

  @override
  String aboutAMonth(int days) {
    return "一个月前";
  }

  @override
  String aboutAYear(int year) {
    return "一年前";
  }

  @override
  String aboutAnHour(int minutes) {
    return "一小时前";
  }

  @override
  String days(int days) {
    return "$days天前";
  }

  @override
  String hours(int hours) {
    return "$hours小时前";
  }

  @override
  String lessThanOneMinute(int seconds) {
    return "刚刚";
  }

  @override
  String minutes(int minutes) {
    return "$minutes分钟前";
  }

  @override
  String months(int months) {
    return "$months月前";
  }

  @override
  String prefixAgo() {
    return "";
  }

  @override
  String prefixFromNow() {
    return "";
  }

  @override
  String suffixAgo() {
    return "";
  }

  @override
  String suffixFromNow() {
    return "";
  }

  @override
  String years(int years) {
    return "$years年前";
  }
}
