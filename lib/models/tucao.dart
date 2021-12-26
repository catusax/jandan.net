import 'dart:convert';

class TuCaoResp {
  int code;
  String msg;
  TuCaoResp({
    required this.code,
    required this.msg,
  });

  TuCaoResp copyWith({
    int? code,
    String? msg,
  }) {
    return TuCaoResp(
      code: code ?? this.code,
      msg: msg ?? this.msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
    };
  }

  factory TuCaoResp.fromMap(Map<String, dynamic> map) {
    return TuCaoResp(
      code: map['code']?.toInt() ?? 0,
      msg: map['msg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TuCaoResp.fromJson(String source) =>
      TuCaoResp.fromMap(json.decode(source));

  @override
  String toString() => 'TuCaoResp(code: $code, msg: $msg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TuCaoResp && other.code == code && other.msg == msg;
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode;
}
