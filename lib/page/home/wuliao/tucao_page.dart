import 'package:flutter/material.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../generated/l10n.dart';
import '../../../init/locator.dart';
import '../../../init/themes.dart';
import '../../../models/card_item.dart';
import '../../../models/wuliao/tucao.dart';
import '../../../utils/snackbar.dart';
import '../../../widgets/card/tucao_card.dart';
import '../../../widgets/card/wuliao_card.dart';
import '../../../widgets/layout/comment_navigation_bar.dart';

class TucaoPage extends StatefulWidget {
  const TucaoPage({Key? key, required this.item}) : super(key: key);
  static const routeName = "/wuliao_comment";
  static const paramItem = "item";
  final CardItem item;

  @override
  State<TucaoPage> createState() => _TucaoPageState();
}

class _TucaoPageState extends State<TucaoPage> {
  final commentController = CommentController();

  TuCao? tucao;

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
      body: Stack(
        children: [
          ListView(
            children: [
              WuliaoCard(item: widget.item),
              tucao == null || tucao!.data.list.isEmpty
                  ? InkWell(
                      onTap: () {
                        resresh();
                      },
                      child: Center(
                        child: Text(
                          locator<S>().have_no_comment_refresh,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              ..._hotComment(context),
              ..._normalComment(context),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CommentNavigationBar(
              commentController: commentController,
              commentType: CommentType.tucao,
              commentId: widget.item.comment_ID,
              commentPostId: widget.item.comment_post_ID,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _hotComment(BuildContext context) {
    if (tucao == null || tucao!.data.hot.isEmpty) {
      return [];
    } else {
      return [
        Padding(
          padding: Styles.padding,
          child: Text(
            locator<S>().hot_comment,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        ListView.builder(
          itemCount: tucao!.data.hot.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, idx) {
            return TucaoCard(
              idx: idx,
              tucaoList: tucao!.data.hot,
              commentController: commentController,
            );
          },
        ),
      ];
    }
  }

  List<Widget> _normalComment(BuildContext context) {
    if (tucao == null || tucao!.data.list.isEmpty) {
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
          itemCount: tucao!.data.list.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, idx) {
            return TucaoCard(
              idx: idx,
              tucaoList: tucao!.data.list,
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
        final tucaon = await JandanApi.getTucao(widget.item.comment_ID);
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
