import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../card_item.dart';

class Lomo {
  final int code;
  final String msg;
  final List<LomoData> data;
  Lomo({
    required this.code,
    required this.msg,
    required this.data,
  });

  Lomo copyWith({
    int? code,
    String? msg,
    List<LomoData>? data,
  }) {
    return Lomo(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory Lomo.fromMap(Map<String, dynamic> map) {
    return Lomo(
      code: map['code']?.toInt() ?? 0,
      msg: map['msg'] ?? '',
      data: List<LomoData>.from(map['data']?.map((x) => LomoData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Lomo.fromJson(String source) => Lomo.fromMap(json.decode(source));

  @override
  String toString() => 'Lomo(code: $code, msg: $msg, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lomo &&
        other.code == code &&
        other.msg == msg &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode ^ data.hashCode;
}

class LomoData {
  final int id;
  final int post_id;
  final String author;
  final int author_type;
  final String date;
  final int date_unix;
  final String post_title;
  final String content;
  final int user_id;
  final int vote_positive;
  final int vote_negative;
  final List<Image> images;
  final int sub_comment_count;
  LomoData({
    required this.id,
    required this.post_id,
    required this.author,
    required this.author_type,
    required this.date,
    required this.date_unix,
    required this.post_title,
    required this.content,
    required this.user_id,
    required this.vote_positive,
    required this.vote_negative,
    required this.images,
    required this.sub_comment_count,
  });

  LomoData copyWith({
    int? id,
    int? post_id,
    String? author,
    int? author_type,
    String? date,
    int? date_unix,
    String? post_title,
    String? content,
    int? user_id,
    int? vote_positive,
    int? vote_negative,
    List<Image>? images,
    int? sub_comment_count,
  }) {
    return LomoData(
      id: id ?? this.id,
      post_id: post_id ?? this.post_id,
      author: author ?? this.author,
      author_type: author_type ?? this.author_type,
      date: date ?? this.date,
      date_unix: date_unix ?? this.date_unix,
      post_title: post_title ?? this.post_title,
      content: content ?? this.content,
      user_id: user_id ?? this.user_id,
      vote_positive: vote_positive ?? this.vote_positive,
      vote_negative: vote_negative ?? this.vote_negative,
      images: images ?? this.images,
      sub_comment_count: sub_comment_count ?? this.sub_comment_count,
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
      'post_title': post_title,
      'content': content,
      'user_id': user_id,
      'vote_positive': vote_positive,
      'vote_negative': vote_negative,
      'images': images.map((x) => x.toMap()).toList(),
      'sub_comment_count': sub_comment_count,
    };
  }

  factory LomoData.fromMap(Map<String, dynamic> map) {
    return LomoData(
      id: map['id']?.toInt() ?? 0,
      post_id: map['post_id']?.toInt() ?? 0,
      author: map['author'] ?? '',
      author_type: map['author_type']?.toInt() ?? 0,
      date: map['date'] ?? '',
      date_unix: map['date_unix']?.toInt() ?? 0,
      post_title: map['post_title'] ?? '',
      content: map['content'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      vote_positive: map['vote_positive']?.toInt() ?? 0,
      vote_negative: map['vote_negative']?.toInt() ?? 0,
      images: List<Image>.from(map['images']?.map((x) => Image.fromMap(x))),
      sub_comment_count: map['sub_comment_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LomoData.fromJson(String source) =>
      LomoData.fromMap(json.decode(source));

  CardItem toCardItem() => CardItem(
      comment_ID: id.toString(),
      comment_author: author,
      comment_date: date,
      user_id: user_id,
      vote_positive: vote_positive,
      vote_negative: vote_negative,
      sub_comment_count: sub_comment_count,
      text_content: content,
      pics: images.map<String>((e) => e.full_url).toList());

  @override
  String toString() {
    return 'Data(id: $id, post_id: $post_id, author: $author, author_type: $author_type, date: $date, date_unix: $date_unix, post_title: $post_title, content: $content, user_id: $user_id, vote_positive: $vote_positive, vote_negative: $vote_negative, images: $images, sub_comment_count: $sub_comment_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LomoData &&
        other.id == id &&
        other.post_id == post_id &&
        other.author == author &&
        other.author_type == author_type &&
        other.date == date &&
        other.date_unix == date_unix &&
        other.post_title == post_title &&
        other.content == content &&
        other.user_id == user_id &&
        other.vote_positive == vote_positive &&
        other.vote_negative == vote_negative &&
        listEquals(other.images, images) &&
        other.sub_comment_count == sub_comment_count;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        post_id.hashCode ^
        author.hashCode ^
        author_type.hashCode ^
        date.hashCode ^
        date_unix.hashCode ^
        post_title.hashCode ^
        content.hashCode ^
        user_id.hashCode ^
        vote_positive.hashCode ^
        vote_negative.hashCode ^
        images.hashCode ^
        sub_comment_count.hashCode;
  }
}

class Image {
  final String url;
  final String full_url;
  final String host;
  final String thumb_size;
  final String ext;
  final String file_name;
  Image({
    required this.url,
    required this.full_url,
    required this.host,
    required this.thumb_size,
    required this.ext,
    required this.file_name,
  });

  Image copyWith({
    String? url,
    String? full_url,
    String? host,
    String? thumb_size,
    String? ext,
    String? file_name,
  }) {
    return Image(
      url: url ?? this.url,
      full_url: full_url ?? this.full_url,
      host: host ?? this.host,
      thumb_size: thumb_size ?? this.thumb_size,
      ext: ext ?? this.ext,
      file_name: file_name ?? this.file_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'full_url': full_url,
      'host': host,
      'thumb_size': thumb_size,
      'ext': ext,
      'file_name': file_name,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      url: map['url'] ?? '',
      full_url: map['full_url'] ?? '',
      host: map['host'] ?? '',
      thumb_size: map['thumb_size'] ?? '',
      ext: map['ext'] ?? '',
      file_name: map['file_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Image(url: $url, full_url: $full_url, host: $host, thumb_size: $thumb_size, ext: $ext, file_name: $file_name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image &&
        other.url == url &&
        other.full_url == full_url &&
        other.host == host &&
        other.thumb_size == thumb_size &&
        other.ext == ext &&
        other.file_name == file_name;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        full_url.hashCode ^
        host.hashCode ^
        thumb_size.hashCode ^
        ext.hashCode ^
        file_name.hashCode;
  }
}
