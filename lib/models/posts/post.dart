// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PostContent {
  final String status;
  final PostData post;
  final String previous_url;
  final String next_url;
  PostContent({
    required this.status,
    required this.post,
    required this.previous_url,
    required this.next_url,
  });

  PostContent copyWith({
    String? status,
    PostData? post,
    String? previous_url,
    String? next_url,
  }) {
    return PostContent(
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

  factory PostContent.fromMap(Map<String, dynamic> map) {
    return PostContent(
      status: map['status'] ?? '',
      post: PostData.fromMap(map['post']),
      previous_url: map['previous_url'] ?? '',
      next_url: map['next_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostContent.fromJson(String source) =>
      PostContent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostContent(status: $status, post: $post, previous_url: $previous_url, next_url: $next_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostContent &&
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

class PostData {
  final int id;
  final String content;
  final String date;
  final String modified;
  PostData({
    required this.id,
    required this.content,
    required this.date,
    required this.modified,
  });

  PostData copyWith({
    int? id,
    String? content,
    String? date,
    String? modified,
  }) {
    return PostData(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
      modified: modified ?? this.modified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'date': date,
      'modified': modified,
    };
  }

  factory PostData.fromMap(Map<String, dynamic> map) {
    return PostData(
      id: map['id']?.toInt() ?? 0,
      content: map['content'] ?? '',
      date: map['date'] ?? '',
      modified: map['modified'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostData.fromJson(String source) =>
      PostData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, content: $content, date: $date, modified: $modified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostData &&
        other.id == id &&
        other.content == content &&
        other.date == date &&
        other.modified == modified;
  }

  @override
  int get hashCode {
    return id.hashCode ^ content.hashCode ^ date.hashCode ^ modified.hashCode;
  }
}
