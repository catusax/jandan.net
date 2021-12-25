import 'package:flutter/material.dart';
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
      child: LoadingMoreList<Comment>(
        ListConfig<Comment>(
          controller: widget.scrollController,
          sourceList: source,
          itemBuilder: (BuildContext c, Comment item, int idx) {
            return InkWell(
              onTap: () {
                RouteMaps.navigateTo(context, TucaoPage.routeName,
                    params: {TucaoPage.paramItem: item.toCardItem().toJson()});
              },
              child: WuliaoCard(
                item: item.toCardItem(),
              ),
            );
          },
        ),
      ),
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
    if (currenPage == wuliao.page_count) return false;
    return true;
  }
}
