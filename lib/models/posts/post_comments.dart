import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostComments {
  final String status;
  final PostCommentData post;
  final String previous_url;
  final String next_url;
  PostComments({
    required this.status,
    required this.post,
    required this.previous_url,
    required this.next_url,
  });

  PostComments copyWith({
    String? status,
    PostCommentData? post,
    String? previous_url,
    String? next_url,
  }) {
    return PostComments(
      status: status ?? this.status,
      post: post ?? this.post,
      previous_url: previous_url ?? this.previous_url,
      next_url: next_url ?? this.next_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'post': post.toMap(),
      'previous_url': previous_url,
      'next_url': next_url,
    };
  }

  factory PostComments.fromMap(Map<String, dynamic> map) {
    return PostComments(
      status: map['status'] ?? '',
      post: PostCommentData.fromMap(map['post']),
      previous_url: map['previous_url'] ?? '',
      next_url: map['next_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostComments.fromJson(String source) =>
      PostComments.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostComments(status: $status, post: $post, previous_url: $previous_url, next_url: $next_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostComments &&
        other.status == status &&
        other.post == post &&
        other.previous_url == previous_url &&
        other.next_url == next_url;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        post.hashCode ^
        previous_url.hashCode ^
        next_url.hashCode;
  }
}

class PostCommentData {
  final int id;
  final List<PostCommentItem> comments;
  PostCommentData({
    required this.id,
    required this.comments,
  });

  PostCommentData copyWith({
    int? id,
    List<PostCommentItem>? comments,
  }) {
    return PostCommentData(
      id: id ?? this.id,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory PostCommentData.fromMap(Map<String, dynamic> map) {
    return PostCommentData(
      id: map['id']?.toInt() ?? 0,
      comments: List<PostCommentItem>.from(
          map['comments']?.map((x) => PostCommentItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostCommentData.fromJson(String source) =>
      PostCommentData.fromMap(json.decode(source));

  @override
  String toString() => 'Post(id: $id, comments: $comments)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostCommentData &&
        other.id == id &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode => id.hashCode ^ comments.hashCode;
}

class PostCommentItem {
  bool? ooxx;
  final int id;
  final String name;
  final String url;
  final String date;
  final String content;
  final int parent;
  int vote_positive;
  int vote_negative;
  final int index;
  PostCommentItem({
    required this.id,
    required this.name,
    required this.url,
    required this.date,
    required this.content,
    required this.parent,
    required this.vote_positive,
    required this.vote_negative,
    required this.index,
  });

  PostCommentItem copyWith({
    int? id,
    String? name,
    String? url,
    String? date,
    String? content,
    int? parent,
    int? vote_positive,
    int? vote_negative,
    int? index,
  }) {
    return PostCommentItem(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      date: date ?? this.date,
      content: content ?? this.content,
      parent: parent ?? this.parent,
      vote_positive: vote_positive ?? this.vote_positive,
      vote_negative: vote_negative ?? this.vote_negative,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'date': date,
      'content': content,
      'parent': parent,
      'vote_positive': vote_positive,
      'vote_negative': vote_negative,
      'index': index,
    };
  }

  factory PostCommentItem.fromMap(Map<String, dynamic> map) {
    return PostCommentItem(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      date: map['date'] ?? '',
      content: map['content'] ?? '',
      parent: map['parent']?.toInt() ?? 0,
      vote_positive: map['vote_positive']?.toInt() ?? 0,
      vote_negative: map['vote_negative']?.toInt() ?? 0,
      index: map['index']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostCommentItem.fromJson(String source) =>
      PostCommentItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, name: $name, url: $url, date: $date, content: $content, parent: $parent, vote_positive: $vote_positive, vote_negative: $vote_negative, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostCommentItem &&
        other.id == id &&
        other.name == name &&
        other.url == url &&
        other.date == date &&
        other.content == content &&
        other.parent == parent &&
        other.vote_positive == vote_positive &&
        other.vote_negative == vote_negative &&
        other.index == index;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        url.hashCode ^
        date.hashCode ^
        content.hashCode ^
        parent.hashCode ^
        vote_positive.hashCode ^
        vote_negative.hashCode ^
        index.hashCode;
  }
}
