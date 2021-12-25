import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';

class CommentNavigationBar extends StatelessWidget {
  const CommentNavigationBar({
    Key? key,
    required this.commentController,
  }) : super(key: key);

  final CommentController commentController;

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
              onPressed: () {
                //TOOD: 发送评论
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
