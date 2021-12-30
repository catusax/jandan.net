import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jandan/models/card_item.dart';

import '../../../core/http/jandan_api.dart';
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
      final wuliao = await JandanApi.wuliao(page: _page);
      final itemList =
          wuliao.comments.map<CardItem>((e) => e.toCardItem()).toList();
      if (_page == wuliao.page_count) {
        _pagingController.appendLastPage(itemList);
      } else {
        _pagingController.appendPage(itemList, wuliao.current_page + 1);
      }
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
        addAutomaticKeepAlives: true,
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CardItem>(
          itemBuilder: (context, item, index) => GestureDetector(
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
