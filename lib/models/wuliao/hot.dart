import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../card_item.dart';

class Hot {
  final String status;
  final List<HotComment> comments;
  Hot({
    required this.status,
    required this.comments,
  });

  Hot copyWith({
    String? status,
    List<HotComment>? comments,
  }) {
    return Hot(
      status: status ?? this.status,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory Hot.fromMap(Map<String, dynamic> map) {
    return Hot(
      status: map['status'] ?? '',
      comments: List<HotComment>.from(
          map['comments']?.map((x) => HotComment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hot.fromJson(String source) => Hot.fromMap(json.decode(source));

  @override
  String toString() => 'Hot(status: $status, comments: $comments)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hot &&
        other.status == status &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode => status.hashCode ^ comments.hashCode;
}

class HotComment {
  final String comment_ID;
  final String comment_author;
  final String comment_date;
  final int user_id;
  String vote_positive;
  String vote_negative;
  final String sub_comment_count;
  final String text_content;
  final List<String> pics;
  final String parent_link;
  final String parent_title;
  final Extra extra;
  HotComment({
    required this.comment_ID,
    required this.comment_author,
    required this.comment_date,
    required this.user_id,
    required this.vote_positive,
    required this.vote_negative,
    required this.sub_comment_count,
    required this.text_content,
    required this.pics,
    required this.parent_link,
    required this.parent_title,
    required this.extra,
  });

  HotComment copyWith({
    String? comment_ID,
    String? comment_author,
    String? comment_date,
    int? user_id,
    String? vote_positive,
    String? vote_negative,
    String? sub_comment_count,
    String? text_content,
    List<String>? pics,
    String? parent_link,
    String? parent_title,
    Extra? extra,
  }) {
    return HotComment(
      comment_ID: comment_ID ?? this.comment_ID,
      comment_author: comment_author ?? this.comment_author,
      comment_date: comment_date ?? this.comment_date,
      user_id: user_id ?? this.user_id,
      vote_positive: vote_positive ?? this.vote_positive,
      vote_negative: vote_negative ?? this.vote_negative,
      sub_comment_count: sub_comment_count ?? this.sub_comment_count,
      text_content: text_content ?? this.text_content,
      pics: pics ?? this.pics,
      parent_link: parent_link ?? this.parent_link,
      parent_title: parent_title ?? this.parent_title,
      extra: extra ?? this.extra,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment_ID': comment_ID,
      'comment_author': comment_author,
      'comment_date': comment_date,
      'user_id': user_id,
      'vote_positive': vote_positive,
      'vote_negative': vote_negative,
      'sub_comment_count': sub_comment_count,
      'text_content': text_content,
      'pics': pics,
      'parent_link': parent_link,
      'parent_title': parent_title,
      '_extra': extra.toMap(),
    };
  }

  factory HotComment.fromMap(Map<String, dynamic> map) {
    return HotComment(
      comment_ID: map['comment_ID'] ?? '',
      comment_author: map['comment_author'] ?? '',
      comment_date: map['comment_date'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      vote_positive: map['vote_positive'] ?? '',
      vote_negative: map['vote_negative'] ?? '',
      sub_comment_count: map['sub_comment_count'] ?? '',
      text_content: map['text_content'] ?? '',
      pics: List<String>.from(map['pics']),
      parent_link: map['parent_link'] ?? '',
      parent_title: map['parent_title'] ?? '',
      extra: Extra.fromMap(map['_extra']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HotComment.fromJson(String source) =>
      HotComment.fromMap(json.decode(source));

  CardItem toCardItem() => CardItem(
      comment_ID: comment_ID,
      comment_author: comment_author,
      comment_date: comment_date,
      user_id: user_id,
      vote_positive: int.parse(vote_positive),
      vote_negative: int.parse(vote_negative),
      sub_comment_count: int.parse(sub_comment_count),
      text_content: text_content,
      pics: pics);

  @override
  String toString() {
    return 'HotComment(comment_ID: $comment_ID, comment_author: $comment_author, comment_date: $comment_date, user_id: $user_id, vote_positive: $vote_positive, vote_negative: $vote_negative, sub_comment_count: $sub_comment_count, text_content: $text_content, pics: $pics, parent_link: $parent_link, parent_title: $parent_title, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HotComment &&
        other.comment_ID == comment_ID &&
        other.comment_author == comment_author &&
        other.comment_date == comment_date &&
        other.user_id == user_id &&
        other.vote_positive == vote_positive &&
        other.vote_negative == vote_negative &&
        other.sub_comment_count == sub_comment_count &&
        other.text_content == text_content &&
        listEquals(other.pics, pics) &&
        other.parent_link == parent_link &&
        other.parent_title == parent_title &&
        other.extra == extra;
  }

  @override
  int get hashCode {
    return comment_ID.hashCode ^
        comment_author.hashCode ^
        comment_date.hashCode ^
        user_id.hashCode ^
        vote_positive.hashCode ^
        vote_negative.hashCode ^
        sub_comment_count.hashCode ^
        text_content.hashCode ^
        pics.hashCode ^
        parent_link.hashCode ^
        parent_title.hashCode ^
        extra.hashCode;
  }
}

class Extra {
  final String category_type;
  final String page_num;
  Extra({
    required this.category_type,
    required this.page_num,
  });

  Extra copyWith({
    String? category_type,
    String? page_num,
  }) {
    return Extra(
      category_type: category_type ?? this.category_type,
      page_num: page_num ?? this.page_num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category_type': category_type,
      'page_num': page_num,
    };
  }

  factory Extra.fromMap(Map<String, dynamic> map) {
    return Extra(
      category_type: map['category_type'] ?? '',
      page_num: map['page_num'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Extra.fromJson(String source) => Extra.fromMap(json.decode(source));

  @override
  String toString() =>
      '_extra(category_type: $category_type, page_num: $page_num)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Extra &&
        other.category_type == category_type &&
        other.page_num == page_num;
  }

  @override
  int get hashCode => category_type.hashCode ^ page_num.hashCode;
}
