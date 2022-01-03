// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class OOXXTucaoResp {
  final int error;
  final String msg;
  final int comment_id;
  OOXXTucaoResp({
    required this.error,
    required this.msg,
    required this.comment_id,
  });

  OOXXTucaoResp copyWith({
    int? error,
    String? msg,
    int? comment_id,
  }) {
    return OOXXTucaoResp(
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

  factory OOXXTucaoResp.fromMap(Map<String, dynamic> map) {
    return OOXXTucaoResp(
      error: map['error']?.toInt() ?? 0,
      msg: map['msg'] ?? '',
      comment_id: map['comment_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OOXXTucaoResp.fromJson(String source) =>
      OOXXTucaoResp.fromMap(json.decode(source));

  @override
  String toString() =>
      'OOXXTucaoResp(error: $error, msg: $msg, comment_id: $comment_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OOXXTucaoResp &&
        other.error == error &&
        other.msg == msg &&
        other.comment_id == comment_id;
  }

  @override
  int get hashCode => error.hashCode ^ msg.hashCode ^ comment_id.hashCode;
}
