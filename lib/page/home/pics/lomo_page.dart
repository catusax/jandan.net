import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jandan/models/card_item.dart';
import 'package:jandan/utils/provider.dart';

import '../../../core/http/jandan_api.dart';
import '../../../widgets/card/wuliao_card.dart';
import 'tucao_page.dart';

class PicsPage extends StatefulWidget {
  const PicsPage({
    Key? key,
    required this.scrollController,
    required this.commentId,
  }) : super(key: key);
  // final RefreshController refreshController;
  final ScrollController scrollController;
  final String commentId;

  @override
  State<PicsPage> createState() => _PicsPageState();
}

class _PicsPageState extends State<PicsPage>
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
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (builder) {
                  return TucaoPage(item: item);
                }),
              );
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
