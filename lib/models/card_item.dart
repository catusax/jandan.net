// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

//用来在卡片上展示的数据
class CardItem {
  bool? ooxx; // 用来标记本地ooxx状态
  final String comment_post_ID;
  final String comment_ID;
  final String comment_author;
  final String comment_date;
  final int user_id;
  int vote_positive;
  int vote_negative;
  int sub_comment_count;
  final String text_content;
  final List<String> pics;
  CardItem({
    this.ooxx,
    required this.comment_post_ID,
    required this.comment_ID,
    required this.comment_author,
    required this.comment_date,
    required this.user_id,
    required this.vote_positive,
    required this.vote_negative,
    required this.sub_comment_count,
    required this.text_content,
    required this.pics,
  });

  CardItem copyWith({
    bool? ooxx,
    String? comment_post_ID,
    String? comment_ID,
    String? comment_author,
    String? comment_date,
    int? user_id,
    int? vote_positive,
    int? vote_negative,
    int? sub_comment_count,
    String? text_content,
    List<String>? pics,
  }) {
    return CardItem(
      ooxx: ooxx ?? this.ooxx,
      comment_post_ID: comment_post_ID ?? this.comment_post_ID,
      comment_ID: comment_ID ?? this.comment_ID,
      comment_author: comment_author ?? this.comment_author,
      comment_date: comment_date ?? this.comment_date,
      user_id: user_id ?? this.user_id,
      vote_positive: vote_positive ?? this.vote_positive,
      vote_negative: vote_negative ?? this.vote_negative,
      sub_comment_count: sub_comment_count ?? this.sub_comment_count,
      text_content: text_content ?? this.text_content,
      pics: pics ?? this.pics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ooxx': ooxx,
      'comment_post_ID': comment_post_ID,
      'comment_ID': comment_ID,
      'comment_author': comment_author,
      'comment_date': comment_date,
      'user_id': user_id,
      'vote_positive': vote_positive,
      'vote_negative': vote_negative,
      'sub_comment_count': sub_comment_count,
      'text_content': text_content,
      'pics': pics,
    };
  }

  factory CardItem.fromMap(Map<String, dynamic> map) {
    return CardItem(
      ooxx: map['ooxx'],
      comment_post_ID: map['comment_post_ID'] ?? '',
      comment_ID: map['comment_ID'] ?? '',
      comment_author: map['comment_author'] ?? '',
      comment_date: map['comment_date'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      vote_positive: map['vote_positive']?.toInt() ?? 0,
      vote_negative: map['vote_negative']?.toInt() ?? 0,
      sub_comment_count: map['sub_comment_count']?.toInt() ?? 0,
      text_content: map['text_content'] ?? '',
      pics: List<String>.from(map['pics']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardItem.fromJson(String source) =>
      CardItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardItem(ooxx: $ooxx, comment_post_ID: $comment_post_ID, comment_ID: $comment_ID, comment_author: $comment_author, comment_date: $comment_date, user_id: $user_id, vote_positive: $vote_positive, vote_negative: $vote_negative, sub_comment_count: $sub_comment_count, text_content: $text_content, pics: $pics)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardItem &&
        other.ooxx == ooxx &&
        other.comment_post_ID == comment_post_ID &&
        other.comment_ID == comment_ID &&
        other.comment_author == comment_author &&
        other.comment_date == comment_date &&
        other.user_id == user_id &&
        other.vote_positive == vote_positive &&
        other.vote_negative == vote_negative &&
        other.sub_comment_count == sub_comment_count &&
        other.text_content == text_content &&
        listEquals(other.pics, pics);
  }

  @override
  int get hashCode {
    return ooxx.hashCode ^
        comment_post_ID.hashCode ^
        comment_ID.hashCode ^
        comment_author.hashCode ^
        comment_date.hashCode ^
        user_id.hashCode ^
        vote_positive.hashCode ^
        vote_negative.hashCode ^
        sub_comment_count.hashCode ^
        text_content.hashCode ^
        pics.hashCode;
  }
}
