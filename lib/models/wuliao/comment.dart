// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Comment {
  final String comment_ID;
  final String comment_post_ID;
  final String comment_author;
  final String comment_date;
  final String comment_date_gmt;
  final String comment_content;
  final String user_id;
  final String vote_positive;
  final String vote_negative;
  final String sub_comment_count;
  final String text_content;
  final List<String> pics;
  Comment({
    required this.comment_ID,
    required this.comment_post_ID,
    required this.comment_author,
    required this.comment_date,
    required this.comment_date_gmt,
    required this.comment_content,
    required this.user_id,
    required this.vote_positive,
    required this.vote_negative,
    required this.sub_comment_count,
    required this.text_content,
    required this.pics,
  });

  Comment copyWith({
    String? comment_ID,
    String? comment_post_ID,
    String? comment_author,
    String? comment_date,
    String? comment_date_gmt,
    String? comment_content,
    String? user_id,
    String? vote_positive,
    String? vote_negative,
    String? sub_comment_count,
    String? text_content,
    List<String>? pics,
  }) {
    return Comment(
      comment_ID: comment_ID ?? this.comment_ID,
      comment_post_ID: comment_post_ID ?? this.comment_post_ID,
      comment_author: comment_author ?? this.comment_author,
      comment_date: comment_date ?? this.comment_date,
      comment_date_gmt: comment_date_gmt ?? this.comment_date_gmt,
      comment_content: comment_content ?? this.comment_content,
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
      'comment_ID': comment_ID,
      'comment_post_ID': comment_post_ID,
      'comment_author': comment_author,
      'comment_date': comment_date,
      'comment_date_gmt': comment_date_gmt,
      'comment_content': comment_content,
      'user_id': user_id,
      'vote_positive': vote_positive,
      'vote_negative': vote_negative,
      'sub_comment_count': sub_comment_count,
      'text_content': text_content,
      'pics': pics,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      comment_ID: map['comment_ID'],
      comment_post_ID: map['comment_post_ID'],
      comment_author: map['comment_author'],
      comment_date: map['comment_date'],
      comment_date_gmt: map['comment_date_gmt'],
      comment_content: map['comment_content'],
      user_id: map['user_id'],
      vote_positive: map['vote_positive'],
      vote_negative: map['vote_negative'],
      sub_comment_count: map['sub_comment_count'],
      text_content: map['text_content'],
      pics: List<String>.from(map['pics']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(comment_ID: $comment_ID, comment_post_ID: $comment_post_ID, comment_author: $comment_author, comment_date: $comment_date, comment_date_gmt: $comment_date_gmt, comment_content: $comment_content, user_id: $user_id, vote_positive: $vote_positive, vote_negative: $vote_negative, sub_comment_count: $sub_comment_count, text_content: $text_content, pics: $pics)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.comment_ID == comment_ID &&
        other.comment_post_ID == comment_post_ID &&
        other.comment_author == comment_author &&
        other.comment_date == comment_date &&
        other.comment_date_gmt == comment_date_gmt &&
        other.comment_content == comment_content &&
        other.user_id == user_id &&
        other.vote_positive == vote_positive &&
        other.vote_negative == vote_negative &&
        other.sub_comment_count == sub_comment_count &&
        other.text_content == text_content &&
        listEquals(other.pics, pics);
  }

  @override
  int get hashCode {
    return comment_ID.hashCode ^
        comment_post_ID.hashCode ^
        comment_author.hashCode ^
        comment_date.hashCode ^
        comment_date_gmt.hashCode ^
        comment_content.hashCode ^
        user_id.hashCode ^
        vote_positive.hashCode ^
        vote_negative.hashCode ^
        sub_comment_count.hashCode ^
        text_content.hashCode ^
        pics.hashCode;
  }
}
