import 'package:jandan/core/http/http.dart';
import 'package:jandan/core/utils/log.dart';
import 'package:jandan/models/resp/ooxx.dart';
import 'package:jandan/models/wuliao/wuliao.dart';

class JandanApi {
  static Future<Wuliao> wuliao({int page = 0}) async {
    final resp = await XHttp.get(
        "/", {"oxwlxojflwblxbsapi": "jandan.get_pic_comments", "page": page});
    Log.log.fine(resp);
    return Wuliao.fromMap(resp);
  }

  static Future<OOXXResp> ooxxComment(bool positive, String commentId) async {
    final resp = await XHttp.post("https://api.jandan.net/api/v1/vote/comment",
        {"vote_type": positive ? "pos" : "neg", "comment_id": commentId});
    Log.log.fine(resp);
    return OOXXResp.fromMap(resp);
  }
}
