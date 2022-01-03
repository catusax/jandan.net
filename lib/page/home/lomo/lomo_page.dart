import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jandan/models/card_item.dart';
import 'package:jandan/utils/provider.dart';

import '../../../core/http/jandan_api.dart';
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
  final PagingController<int, CardItem> _pagingController =
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

      var itemList = lomo.data.map<CardItem>((e) => e.toCardItem()).toList();
      if (Store.value<AppSetting>(context).hideUnwelcome) {
        itemList.removeWhere((element) =>
            element.vote_negative >= 5 &&
            element.vote_negative >= element.vote_positive);
      }

      _pagingController.appendPage(itemList, lomo.data.last.id);
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
        cacheExtent: MediaQuery.of(context).size.height * 2,
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CardItem>(
          itemBuilder: (context, item, index) => InkWell(
            onTap: () {
              RouteMaps.navigateTo(context, TucaoPage.routeName,
                  params: {TucaoPage.paramItem: item.toJson()});
            },
            child: WuliaoCard(
              item: item,
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
