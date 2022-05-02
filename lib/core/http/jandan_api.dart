import '../../models/pics/hot.dart';
import '../../models/pics/pics.dart';
import '../../models/pics/tucao.dart';
import '../../models/posts/news.dart';
import '../../models/posts/post.dart';
import '../../models/posts/post_comments.dart';
import '../../models/resp/ooxx.dart';
import '../../models/resp/ooxx_tucao_resp.dart';
import '../../models/tucao.dart';
import '../utils/log.dart';
import 'http.dart';

class JandanApi {
  static Future<News> news({int page = 0}) async {
    final resp = await XHttp.get("/", {
      "oxwlxojflwblxbsapi": "get_recent_posts",
      "include":
          "url,date,tags,author,title,excerpt,comment_count,comment_status,custom_fields",
      "custom_fields": "thumb_c,views",
      "page": page
    });
    Log.log.fine(resp);
    return News.fromMap(resp);
  }

  static Future<PostContent> postContent(int id) async {
    final resp = await XHttp.get("/", {
      "oxwlxojflwblxbsapi": "get_post",
      "include": "content,date,modified",
      "id": id,
    });
    Log.log.fine(resp);
    return PostContent.fromMap(resp);
  }

  static Future<Hot> hot() async {
    final resp =
        await XHttp.get("http://api.moyu.today/jandan/hot?category=recent");
    Log.log.fine(resp);
    return Hot.fromMap(resp);
  }

  /// startid 上一页最后一个条目的id
  static Future<Pics> lomo(String commentId, {String? startid}) async {
    String param = "";
    if (startid != null) param = "?start_id=" + startid;
    final resp = await XHttp.get(
        "https://api.jandan.net/api/v1/comment/list/" + commentId + param);
    Log.log.fine(resp);
    return Pics.fromMap(resp);
  }

  static Future<OOXXResp> ooxxComment(bool positive, String commentId) async {
    final resp =
        await XHttp.post("https://api.jandan.net/api/v1/vote/comment", {
      "vote_type": positive ? "pos" : "neg",
      "comment_id": commentId,
    });
    Log.log.fine(resp);
    return OOXXResp.fromMap(resp);
  }

  static Future<OOXXTucaoResp> ooxxTucao(bool positive, int commentId) async {
    final resp = await XHttp.post("/jandan-vote.php", {
      "data_type": "tucao",
      "comment_id": commentId,
      "like_type": positive ? "pos" : "neg",
    });
    Log.log.fine(resp);
    return OOXXTucaoResp.fromMap(resp);
  }

  static Future<TuCao> getTucao(String commentId) async {
    final resp =
        await XHttp.get("https://api.jandan.net/api/v1/tucao/list/$commentId");
    Log.log.fine(resp);
    return TuCao.fromMap(resp);
  }

  static Future<PostComments> getNewsTucao(int id) async {
    final resp = await XHttp.get("/", {
      "oxwlxojflwblxbsapi": "get_post",
      "include": "comments",
      "id": id,
    });
    Log.log.fine(resp);
    return PostComments.fromMap(resp);
  }

  /// 无聊图下面的吐槽
  static Future<TuCaoResp> tucao(
      {required String postId,
      required String author,
      required String commentId,
      required String email,
      required String comment}) async {
    final resp = await XHttp.get("/jandan-tucao.php", {
      "comment_post_ID": postId,
      "author": author,
      "comment_id": commentId,
      "email": email,
      "comment": comment,
    });
    Log.log.fine(resp);
    return TuCaoResp.fromMap(resp);
  }

  /// 新鲜事的评论
  static Future<String> comment(
      {required String postId,
      required String author,
      required String email,
      required String comment}) async {
    final resp = await XHttp.get("/jandan-comment.php", {
      "comment_post_ID": postId,
      "author": author,
      "email": email,
      "comment": comment,
    });
    Log.log.fine(resp);
    return resp;
  }
}

enum CommentType {
  /// 无聊图下面的吐槽
  tucao,

  /// 新鲜事的评论
  comment
}
