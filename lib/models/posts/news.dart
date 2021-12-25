// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class News {
  final String status;
  final int count;
  final int count_total;
  final int pages;
  final List<Post> posts;
  News({
    required this.status,
    required this.count,
    required this.count_total,
    required this.pages,
    required this.posts,
  });

  News copyWith({
    String? status,
    int? count,
    int? count_total,
    int? pages,
    List<Post>? posts,
  }) {
    return News(
      status: status ?? this.status,
      count: count ?? this.count,
      count_total: count_total ?? this.count_total,
      pages: pages ?? this.pages,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'count': count,
      'count_total': count_total,
      'pages': pages,
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      status: map['status'] ?? '',
      count: map['count']?.toInt() ?? 0,
      count_total: map['count_total']?.toInt() ?? 0,
      pages: map['pages']?.toInt() ?? 0,
      posts: List<Post>.from(map['posts']?.map((x) => Post.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Posts(status: $status, count: $count, count_total: $count_total, pages: $pages, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.status == status &&
        other.count == count &&
        other.count_total == count_total &&
        other.pages == pages &&
        listEquals(other.posts, posts);
  }

  @override
  int get hashCode {
    return status.hashCode ^
        count.hashCode ^
        count_total.hashCode ^
        pages.hashCode ^
        posts.hashCode;
  }
}

class Post {
  final int id;
  final String url;
  final String title;
  final String excerpt;
  final String date;
  final List<Tag> tags;
  final Author author;
  final int comment_count;
  final String comment_status;
  final Custom_fields custom_fields;
  Post({
    required this.id,
    required this.url,
    required this.title,
    required this.excerpt,
    required this.date,
    required this.tags,
    required this.author,
    required this.comment_count,
    required this.comment_status,
    required this.custom_fields,
  });

  Post copyWith({
    int? id,
    String? url,
    String? title,
    String? excerpt,
    String? date,
    List<Tag>? tags,
    Author? author,
    int? comment_count,
    String? comment_status,
    Custom_fields? custom_fields,
  }) {
    return Post(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      excerpt: excerpt ?? this.excerpt,
      date: date ?? this.date,
      tags: tags ?? this.tags,
      author: author ?? this.author,
      comment_count: comment_count ?? this.comment_count,
      comment_status: comment_status ?? this.comment_status,
      custom_fields: custom_fields ?? this.custom_fields,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'title': title,
      'excerpt': excerpt,
      'date': date,
      'tags': tags.map((x) => x.toMap()).toList(),
      'author': author.toMap(),
      'comment_count': comment_count,
      'comment_status': comment_status,
      'custom_fields': custom_fields.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id']?.toInt() ?? 0,
      url: map['url'] ?? '',
      title: map['title'] ?? '',
      excerpt: map['excerpt'] ?? '',
      date: map['date'] ?? '',
      tags: List<Tag>.from(map['tags']?.map((x) => Tag.fromMap(x))),
      author: Author.fromMap(map['author']),
      comment_count: map['comment_count']?.toInt() ?? 0,
      comment_status: map['comment_status'] ?? '',
      custom_fields: Custom_fields.fromMap(map['custom_fields']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, url: $url, title: $title, excerpt: $excerpt, date: $date, tags: $tags, author: $author, comment_count: $comment_count, comment_status: $comment_status, custom_fields: $custom_fields)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.url == url &&
        other.title == title &&
        other.excerpt == excerpt &&
        other.date == date &&
        listEquals(other.tags, tags) &&
        other.author == author &&
        other.comment_count == comment_count &&
        other.comment_status == comment_status &&
        other.custom_fields == custom_fields;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        url.hashCode ^
        title.hashCode ^
        excerpt.hashCode ^
        date.hashCode ^
        tags.hashCode ^
        author.hashCode ^
        comment_count.hashCode ^
        comment_status.hashCode ^
        custom_fields.hashCode;
  }
}

class Tag {
  final int id;
  final String slug;
  final String title;
  final String description;
  final int post_count;
  Tag({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.post_count,
  });

  Tag copyWith({
    int? id,
    String? slug,
    String? title,
    String? description,
    int? post_count,
  }) {
    return Tag(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      description: description ?? this.description,
      post_count: post_count ?? this.post_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'slug': slug,
      'title': title,
      'description': description,
      'post_count': post_count,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id']?.toInt() ?? 0,
      slug: map['slug'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      post_count: map['post_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) => Tag.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tag(id: $id, slug: $slug, title: $title, description: $description, post_count: $post_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tag &&
        other.id == id &&
        other.slug == slug &&
        other.title == title &&
        other.description == description &&
        other.post_count == post_count;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        title.hashCode ^
        description.hashCode ^
        post_count.hashCode;
  }
}

class Author {
  final int id;
  final String slug;
  final String name;
  final String first_name;
  final String last_name;
  final String nickname;
  final String url;
  final String description;
  Author({
    required this.id,
    required this.slug,
    required this.name,
    required this.first_name,
    required this.last_name,
    required this.nickname,
    required this.url,
    required this.description,
  });

  Author copyWith({
    int? id,
    String? slug,
    String? name,
    String? first_name,
    String? last_name,
    String? nickname,
    String? url,
    String? description,
  }) {
    return Author(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      nickname: nickname ?? this.nickname,
      url: url ?? this.url,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'first_name': first_name,
      'last_name': last_name,
      'nickname': nickname,
      'url': url,
      'description': description,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      id: map['id']?.toInt() ?? 0,
      slug: map['slug'] ?? '',
      name: map['name'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      nickname: map['nickname'] ?? '',
      url: map['url'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Author(id: $id, slug: $slug, name: $name, first_name: $first_name, last_name: $last_name, nickname: $nickname, url: $url, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Author &&
        other.id == id &&
        other.slug == slug &&
        other.name == name &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.nickname == nickname &&
        other.url == url &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        name.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        nickname.hashCode ^
        url.hashCode ^
        description.hashCode;
  }
}

class Custom_fields {
  final List<String> thumb_c;
  Custom_fields({
    required this.thumb_c,
  });

  Custom_fields copyWith({
    List<String>? thumb_c,
  }) {
    return Custom_fields(
      thumb_c: thumb_c ?? this.thumb_c,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumb_c': thumb_c,
    };
  }

  factory Custom_fields.fromMap(Map<String, dynamic> map) {
    return Custom_fields(
      thumb_c: List<String>.from(map['thumb_c']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Custom_fields.fromJson(String source) =>
      Custom_fields.fromMap(json.decode(source));

  @override
  String toString() => 'Custom_fields(thumb_c: $thumb_c)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Custom_fields && listEquals(other.thumb_c, thumb_c);
  }

  @override
  int get hashCode => thumb_c.hashCode;
}
