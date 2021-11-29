// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'comment.dart';

class WuLiao {
  final String status;
  final int current_page;
  final int total_comments;
  final int page_count;
  final int count;
  final List<Comment> comments;
  WuLiao({
    required this.status,
    required this.current_page,
    required this.total_comments,
    required this.page_count,
    required this.count,
    required this.comments,
  });

  WuLiao copyWith({
    String? status,
    int? current_page,
    int? total_comments,
    int? page_count,
    int? count,
    List<Comment>? comments,
  }) {
    return WuLiao(
      status: status ?? this.status,
      current_page: current_page ?? this.current_page,
      total_comments: total_comments ?? this.total_comments,
      page_count: page_count ?? this.page_count,
      count: count ?? this.count,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'current_page': current_page,
      'total_comments': total_comments,
      'page_count': page_count,
      'count': count,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory WuLiao.fromMap(Map<String, dynamic> map) {
    return WuLiao(
      status: map['status'],
      current_page: map['current_page']?.toInt(),
      total_comments: map['total_comments']?.toInt(),
      page_count: map['page_count']?.toInt(),
      count: map['count']?.toInt(),
      comments:
          List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WuLiao.fromJson(String source) => WuLiao.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WuLiao(status: $status, current_page: $current_page, total_comments: $total_comments, page_count: $page_count, count: $count, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WuLiao &&
        other.status == status &&
        other.current_page == current_page &&
        other.total_comments == total_comments &&
        other.page_count == page_count &&
        other.count == count &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return status.hashCode ^
        current_page.hashCode ^
        total_comments.hashCode ^
        page_count.hashCode ^
        count.hashCode ^
        comments.hashCode;
  }
}
