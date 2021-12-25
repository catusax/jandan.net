import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../models/posts/news.dart';
import '../../../widgets/card/news_card.dart';

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
  final LoadMoreListSource source = LoadMoreListSource();
  List<Post> posts = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        try {
          final news = await JandanApi.news(page: 0);
          source.clear();
          setState(() {
            source.addAll(news.posts);
            // comments = wuliao.comments;
          });
        } catch (e) {
          Log.http.severe(e);
        }
      },
      child: LoadingMoreList<Post>(
        ListConfig<Post>(
          controller: widget.scrollController,
          sourceList: source,
          itemBuilder: (BuildContext c, Post item, int idx) {
            return InkWell(
              onTap: () {
                // RouteMaps.navigateTo(context, TucaoPage.routeName,
                //     params: {TucaoPage.paramItem: item.toJson()});
              },
              child: NewsCard(
                post: item,
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

class LoadMoreListSource extends LoadingMoreBase<Post> {
  int currenPage = 0;

  LoadMoreListSource();
  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    final news = await JandanApi.news(page: currenPage + 1);
    currenPage++;
    addAll(news.posts);
    if (currenPage == news.pages) return false;
    return true;
  }
}
