import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  final PagingController<int, Comment> _pagingController =
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
      if (_page == wuliao.page_count) {
        _pagingController.appendLastPage(wuliao.comments);
      } else {
        _pagingController.appendPage(wuliao.comments, wuliao.current_page + 1);
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
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Comment>(
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
