import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../models/posts/news.dart';
import '../../../models/wuliao/hot.dart';
import '../../../router/router_map.dart';
import '../../../widgets/card/wuliao_card.dart';
import '../wuliao/tucao_page.dart';

class HotPage extends StatefulWidget {
  const HotPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  // final RefreshController refreshController;
  final ScrollController scrollController;

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> with AutomaticKeepAliveClientMixin {
  final LoadMoreListSource source = LoadMoreListSource();
  List<Post> posts = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        try {
          final hots = await JandanApi.hot();
          source.clear();
          setState(() {
            source.addAll(hots.comments);
            // comments = wuliao.comments;
          });
        } catch (e) {
          Log.http.severe(e);
          rethrow;
        }
      },
      child: LoadingMoreList<HotComment>(
        ListConfig<HotComment>(
          controller: widget.scrollController,
          sourceList: source,
          itemBuilder: (BuildContext c, HotComment item, int idx) {
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

class LoadMoreListSource extends LoadingMoreBase<HotComment> {
  LoadMoreListSource();
  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    final hots = await JandanApi.hot();
    addAll(hots.comments);
    return false;
  }
}
