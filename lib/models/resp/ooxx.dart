// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class OOXXResp {
  final int error;
  final String msg;
  final int comment_id;
  OOXXResp({
    required this.error,
    required this.msg,
    required this.comment_id,
  });

  OOXXResp copyWith({
    int? error,
    String? msg,
    int? comment_id,
  }) {
    return OOXXResp(
      error: error ?? this.error,
      msg: msg ?? this.msg,
      comment_id: comment_id ?? this.comment_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'msg': msg,
      'comment_id': comment_id,
    };
  }

  factory OOXXResp.fromMap(Map<String, dynamic> map) {
    return OOXXResp(
      error: map['error'],
      msg: map['msg'],
      comment_id: map['comment_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OOXXResp.fromJson(String source) =>
      OOXXResp.fromMap(json.decode(source));

  @override
  String toString() =>
      'OOXXResp(error: $error, msg: $msg, comment_id: $comment_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OOXXResp &&
        other.error == error &&
        other.msg == msg &&
        other.comment_id == comment_id;
  }

  @override
  int get hashCode => error.hashCode ^ msg.hashCode ^ comment_id.hashCode;
}
