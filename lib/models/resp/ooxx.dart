import 'dart:convert';

class OOXXResp {
  final int code;
  final String msg;
  final String? data;
  OOXXResp({
    required this.code,
    required this.msg,
    this.data,
  });

  OOXXResp copyWith({
    int? code,
    String? msg,
    String? data,
  }) {
    return OOXXResp(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
      'data': data,
    };
  }

  factory OOXXResp.fromMap(Map<String, dynamic> map) {
    return OOXXResp(
      code: map['code'],
      msg: map['msg'],
      data: map['data'] != null ? map['data'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OOXXResp.fromJson(String source) =>
      OOXXResp.fromMap(json.decode(source));

  @override
  String toString() => 'OOXXResp(code: $code, msg: $msg, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OOXXResp &&
        other.code == code &&
        other.msg == msg &&
        other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode ^ data.hashCode;
}
