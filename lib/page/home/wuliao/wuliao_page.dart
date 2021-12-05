import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../models/wuliao/comment.dart';
import '../../../router/router_map.dart';
import '../../../widgets/card/wuliao_card.dart';
import 'tucao_page.dart';

class WuliaoPage extends StatefulWidget {
  const WuliaoPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  // final RefreshController refreshController;
  final ScrollController scrollController;

  @override
  State<WuliaoPage> createState() => _WuliaoPageState();
}

class _WuliaoPageState extends State<WuliaoPage>
    with AutomaticKeepAliveClientMixin {
  final LoadMoreListSource source = LoadMoreListSource();
  List<Comment> comments = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        onRefresh: () async {
          try {
            final wuliao = await JandanApi.wuliao(page: 0);
            source.clear();
            setState(() {
              source.addAll(wuliao.comments);
              // comments = wuliao.comments;
            });
          } catch (e) {
            Log.http.severe(e);
          }
        },
        // onLoading: () async {
        //   Log.log.fine("loading");
        //   try {
        //     final wuliao = await JandanApi.wuliao(page: currentPage + 1);
        //     setState(() {
        //       currentPage = wuliao.current_page;
        //       comments.addAll(wuliao.comments);
        //     });
        //   } catch (e) {
        //     Log.http.severe(e);
        //   } finally {
        //     widget.refreshController.refreshCompleted();
        //   }
        // },
        // controller: widget.refreshController,
        // enablePullDown: true,
        // enablePullUp: true,
        child: LoadingMoreList<Comment>(
          ListConfig<Comment>(
            controller: widget.scrollController,
            sourceList: source,
            itemBuilder: (BuildContext c, Comment item, int idx) {
              return InkWell(
                onTap: () {
                  RouteMaps.navigateTo(context, TucaoPage.routeName,
                      params: {TucaoPage.paramItem: item.toJson()});
                },
                child: WuliaoCard(
                  item: item,
                ),
              );
            },
          ),
        )

        //  ListView.builder(
        //     itemCount: comments.length,
        //     itemBuilder: (context, idx) {
        //       return Card(
        //           child: Column(
        //         children: [
        //           Text(comments[idx].comment_content),
        //           CachedNetworkImage(
        //             imageUrl: comments[idx].pics.first,
        //             placeholder: (context, url) => CircularProgressIndicator(),
        //             errorWidget: (context, url, error) => Icon(Icons.error),
        //           ),
        //         ],
        //       ));
        //     }),
        );
  }

  @override
  bool get wantKeepAlive => true;
}

class LoadMoreListSource extends LoadingMoreBase<Comment> {
  int currenPage = 0;

  LoadMoreListSource();
  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    final wuliao = await JandanApi.wuliao(page: currenPage + 1);
    currenPage = wuliao.current_page;
    addAll(wuliao.comments);
    return true;
  }
}
