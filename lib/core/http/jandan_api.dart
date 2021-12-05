import '../../models/resp/ooxx.dart';
import '../../models/wuliao/tucao.dart';
import '../../models/wuliao/wuliao.dart';
import '../utils/log.dart';
import 'http.dart';

class JandanApi {
  static Future<Wuliao> wuliao({int page = 0}) async {
    final resp = await XHttp.get(
        "/", {"oxwlxojflwblxbsapi": "jandan.get_pic_comments", "page": page});
    Log.log.fine(resp);
    return Wuliao.fromMap(resp);
  }

  static Future<OOXXResp> ooxxComment(bool positive, String commentId) async {
    final resp = await XHttp.post("https://jandan.net/api/comment/vote", {
      "like_type": positive ? "pos" : "neg",
      "comment_id": commentId,
      "data_type": "comment"
    });
    Log.log.fine(resp);
    return OOXXResp.fromMap(resp);
  }

  static Future<OOXXResp> ooxxTucao(bool positive, String commentId) async {
    final resp = await XHttp.post("https://jandan.net/api/comment/vote", {
      "like_type": positive ? "pos" : "neg",
      "comment_id": commentId,
      "data_type": "tucao"
    });
    Log.log.fine(resp);
    return OOXXResp.fromMap(resp);
  }

  static Future<TuCao> getTucao(String commentId) async {
    final resp =
        await XHttp.get("https://api.jandan.net/api/v1/tucao/list/$commentId");
    Log.log.fine(resp);
    return TuCao.fromMap(resp);
  }
}
