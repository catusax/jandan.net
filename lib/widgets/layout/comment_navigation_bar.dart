import 'package:flutter/material.dart';

import '../../core/http/jandan_api.dart';
import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../utils/snackbar.dart';
import '../../utils/sputils.dart';
import 'identity_dialog.dart';

class CommentNavigationBar extends StatelessWidget {
  const CommentNavigationBar({
    Key? key,
    required this.commentController,
    required this.commentType,
    required this.commentPostId,
    required this.commentId,
  }) : super(key: key);

  final CommentController commentController;
  final CommentType commentType;

  final String commentPostId;
  final String commentId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: commentController.textEditingController,
              maxLines: 5,
              minLines: 1,
              scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                hintText: commentController.hintText,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          )),
          IconButton(
              onPressed: () async {
                final identity = SPUtils.getIdentity();
                if (identity == null) {
                  showidentityDialog(context);
                } else {
                  if (commentController.textEditingController.text.isEmpty) {
                    return;
                  }
                  switch (commentType) {
                    case CommentType.comment:
                      {
                        final resp = await JandanApi.comment(
                            postId: commentPostId,
                            author: identity.name,
                            email: identity.email,
                            comment: commentController.prefix +
                                commentController.textEditingController.text);
                        if (resp != "0") {
                          SnackBarUtil.showSnackbar(context, Text(resp));
                        }
                      }
                      break;
                    case CommentType.tucao:
                      {
                        final resp = await JandanApi.tucao(
                            postId: commentPostId,
                            author: identity.name,
                            email: identity.email,
                            comment: commentController.prefix +
                                commentController.textEditingController.text,
                            commentId: commentId);
                        if (resp.code != 0) {
                          SnackBarUtil.showSnackbar(context, Text(resp.msg));
                        }
                      }
                  }
                  commentController.refresh();
                }
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}

class CommentController {
  final TextEditingController textEditingController = TextEditingController();
  String prefix = "";
  String hintText = locator<S>().reply;
  late Function() refresh;

  CommentController();
}
