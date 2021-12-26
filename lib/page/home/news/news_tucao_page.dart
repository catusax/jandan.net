import 'package:flutter/material.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../generated/l10n.dart';
import '../../../init/locator.dart';
import '../../../init/themes.dart';
import '../../../models/posts/news.dart';
import '../../../models/posts/post_comments.dart';
import '../../../utils/snackbar.dart';
import '../../../widgets/card/post_tucao_card.dart';
import '../../../widgets/layout/comment_navigation_bar.dart';

class NewsTucaoPage extends StatefulWidget {
  const NewsTucaoPage({Key? key, required this.post}) : super(key: key);
  static const routeName = "/news_comment";
  static const paramPost = "post";
  final Post post;

  @override
  State<NewsTucaoPage> createState() => _NewsTucaoPageState();
}

class _NewsTucaoPageState extends State<NewsTucaoPage> {
  final commentController = CommentController();

  PostComments? tucao;

  @override
  void initState() {
    super.initState();
    Log.log.fine("message");
    resresh();
    commentController.refresh = resresh;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locator<S>().comments),
      ),
      bottomNavigationBar: CommentNavigationBar(
        commentController: commentController,
        commentType: CommentType.comment,
        commentPostId: widget.post.id.toString(),
        commentId: "",
      ),
      body: ListView(
        children: [
          tucao == null || tucao!.post.comments.isEmpty
              ? InkWell(
                  onTap: () {
                    resresh();
                  },
                  child: Center(
                    child: Text(
                      locator<S>().have_no_comment_refresh,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          ..._normalComment(context),
        ],
      ),
    );
  }

  List<Widget> _normalComment(BuildContext context) {
    if (tucao == null || tucao!.post.comments.isEmpty) {
      return [];
    } else {
      return [
        Padding(
          padding: Styles.padding,
          child: Text(
            locator<S>().latest_comment,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        ListView.builder(
          itemCount: tucao!.post.comments.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, idx) {
            return PostTucaoCard(
              idx: idx,
              tucaoList: tucao!.post.comments,
              commentController: commentController,
            );
          },
        ),
      ];
    }
  }

  resresh() {
    () async {
      try {
        final tucaon = await JandanApi.getNewsTucao(widget.post.id);
        setState(() {
          tucao = tucaon;
        });
      } catch (e) {
        Log.http.severe(e);
        SnackBarUtil.showSnackbar(context, Text(locator<S>().network_error));
        rethrow;
      }
    }.call();
  }
}
