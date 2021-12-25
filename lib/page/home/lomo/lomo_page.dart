import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../models/lomo/lomo.dart';
import '../../../widgets/card/wuliao_card.dart';

class LomoPage extends StatefulWidget {
  const LomoPage({
    Key? key,
    required this.scrollController,
    required this.commentId,
  }) : super(key: key);
  // final RefreshController refreshController;
  final ScrollController scrollController;
  final String commentId;

  @override
  State<LomoPage> createState() => _LomoPageState();
}

class _LomoPageState extends State<LomoPage>
    with AutomaticKeepAliveClientMixin {
  late LoadMoreListSource source;
  List<LomoData> posts = List.empty(growable: true);

  @override
  void initState() {
    source = LoadMoreListSource(widget.commentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        try {
          final lomo = await JandanApi.lomo(widget.commentId);
          source.clear();
          setState(() {
            source.addAll(lomo.data);
            // comments = wuliao.comments;
          });
        } catch (e) {
          Log.http.severe(e);
        }
      },
      child: LoadingMoreList<LomoData>(
        ListConfig<LomoData>(
          controller: widget.scrollController,
          sourceList: source,
          itemBuilder: (BuildContext c, LomoData item, int idx) {
            return InkWell(
              onTap: () {
                // RouteMaps.navigateTo(context, TucaoPage.routeName,
                //     params: {TucaoPage.paramItem: item.toJson()});
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

class LoadMoreListSource extends LoadingMoreBase<LomoData> {
  String? lastid;
  final String commentId;

  LoadMoreListSource(this.commentId);
  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    final lomo = await JandanApi.lomo(commentId, startid: lastid);
    lastid = lomo.data.last.id.toString();
    addAll(lomo.data);
    return true;
  }

  @override
  void clear() {
    lastid = null;
    super.clear();
  }
}
