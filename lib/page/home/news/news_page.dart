import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/http/jandan_api.dart';
import '../../../models/posts/news.dart';
import '../../../router/router_map.dart';
import '../../../widgets/card/news_card.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  // final RefreshController refreshController;
  final ScrollController scrollController;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  final PagingController<int, Post> _pagingController =
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
      final news = await JandanApi.news(page: _page);

      if (_page == news.pages) {
        _pagingController.appendLastPage(news.posts);
      } else {
        _pagingController.appendPage(news.posts, _page + 1);
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
        builderDelegate: PagedChildBuilderDelegate<Post>(
          itemBuilder: (context, item, index) => InkWell(
            onTap: () {
              RouteMaps.navigateTo(context, NewsDetailPage.routeName,
                  params: {NewsDetailPage.paramPost: item.toJson()});
            },
            child: NewsCard(
              post: item,
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
