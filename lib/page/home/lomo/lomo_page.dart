import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/http/jandan_api.dart';
import '../../../models/lomo/lomo.dart';
import '../../../router/router_map.dart';
import '../../../widgets/card/wuliao_card.dart';
import '../wuliao/tucao_page.dart';

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
  final PagingController<int, LomoData> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int _page) async {
    try {
      final lomo = await JandanApi.lomo(widget.commentId,
          startid: _page == 0 ? null : _page.toString());
      _pagingController.appendPage(lomo.data, lomo.data.last.id);
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<LomoData>(
          itemBuilder: (context, item, index) => InkWell(
            onTap: () {
              RouteMaps.navigateTo(context, TucaoPage.routeName,
                  params: {TucaoPage.paramItem: item.toCardItem().toJson()});
            },
            child: WuliaoCard(
              item: item.toCardItem(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
