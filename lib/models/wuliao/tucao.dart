import 'dart:convert';

import 'package:flutter/foundation.dart';

class TuCao {
  final int code;
  final String msg;
  final Data data;
  TuCao({
    required this.code,
    required this.msg,
    required this.data,
  });

  TuCao copyWith({
    int? code,
    String? msg,
    Data? data,
  }) {
    return TuCao(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
      'data': data.toMap(),
    };
  }

  factory TuCao.fromMap(Map<String, dynamic> map) {
    return TuCao(
      code: map['code']?.toInt(),
      msg: map['msg'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TuCao.fromJson(String source) => TuCao.fromMap(json.decode(source));

  @override
  String toString() => 'TuCao(code: $code, msg: $msg, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TuCao &&
        other.code == code &&
        other.msg == msg &&
        other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode ^ data.hashCode;
}

class Data {
  final List<TuCaoContent> hot;
  final List<TuCaoContent> list;
  Data({
    required this.hot,
    required this.list,
  });

  Data copyWith({
    List<TuCaoContent>? hot,
    List<TuCaoContent>? list,
  }) {
    return Data(
      hot: hot ?? this.hot,
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hot': hot.map((x) => x.toMap()).toList(),
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      hot: List<TuCaoContent>.from(
          map['hot']?.map((x) => TuCaoContent.fromMap(x))),
      list: List<TuCaoContent>.from(
          map['list']?.map((x) => TuCaoContent.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(hot: $hot, list: $list)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        listEquals(other.hot, hot) &&
        listEquals(other.list, list);
  }

  @override
  int get hashCode => hot.hashCode ^ list.hashCode;
}

class TuCaoContent {
  bool? ooxx;
  final int id;
  final int post_id;
  final String author;
  final int author_type;
  final String date;
  final int date_unix;
  final String content;
  final int user_id;
  int vote_positive;
  int vote_negative;
  final List<String> images;
  TuCaoContent({
    required this.id,
    required this.post_id,
    required this.author,
    required this.author_type,
    required this.date,
    required this.date_unix,
    required this.content,
    required this.user_id,
    required this.vote_positive,
    required this.vote_negative,
    required this.images,
  });

  TuCaoContent copyWith({
    int? id,
    int? post_id,
    String? author,
    int? author_type,
    String? date,
    int? date_unix,
    String? content,
    int? user_id,
    int? vote_positive,
    int? vote_negative,
    List<String>? images,
  }) {
    return TuCaoContent(
      id: id ?? this.id,
      post_id: post_id ?? this.post_id,
      author: author ?? this.author,
      author_type: author_type ?? this.author_type,
      date: date ?? this.date,
      date_unix: date_unix ?? this.date_unix,
      content: content ?? this.content,
      user_id: user_id ?? this.user_id,
      vote_positive: vote_positive ?? this.vote_positive,
      vote_negative: vote_negative ?? this.vote_negative,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_id': post_id,
      'author': author,
      'author_type': author_type,
      'date': date,
      'date_unix': date_unix,
      'content': content,
      'user_id': user_id,
      'vote_positive': vote_positive,
      'vote_negative': vote_negative,
      'images': images,
    };
  }

  factory TuCaoContent.fromMap(Map<String, dynamic> map) {
    return TuCaoContent(
      id: map['id'],
      post_id: map['post_id'],
      author: map['author'],
      author_type: map['author_type'],
      date: map['date'],
      date_unix: map['date_unix'],
      content: map['content'],
      user_id: map['user_id'],
      vote_positive: map['vote_positive'],
      vote_negative: map['vote_negative'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TuCaoContent.fromJson(String source) =>
      TuCaoContent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NormalList(id: $id, post_id: $post_id, author: $author, author_type: $author_type, date: $date, date_unix: $date_unix, content: $content, user_id: $user_id, vote_positive: $vote_positive, vote_negative: $vote_negative, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TuCaoContent &&
        other.id == id &&
        other.post_id == post_id &&
        other.author == author &&
        other.author_type == author_type &&
        other.date == date &&
        other.date_unix == date_unix &&
        other.content == content &&
        other.user_id == user_id &&
        other.vote_positive == vote_positive &&
        other.vote_negative == vote_negative &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        post_id.hashCode ^
        author.hashCode ^
        author_type.hashCode ^
        date.hashCode ^
        date_unix.hashCode ^
        content.hashCode ^
        user_id.hashCode ^
        vote_positive.hashCode ^
        vote_negative.hashCode ^
        images.hashCode;
  }
}
