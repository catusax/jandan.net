import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../generated/l10n.dart';
import '../../../init/locator.dart';
import '../../../init/themes.dart';
import '../../../models/wuliao/hot.dart';
import '../../../models/wuliao/tucao.dart';
import '../../../utils/snackbar.dart';
import '../../../widgets/card/hot_card.dart';
import '../../../widgets/card/tucao_card.dart';

class HotTucaoPage extends StatefulWidget {
  const HotTucaoPage({Key? key, required this.item}) : super(key: key);
  static const routeName = "/hot_comment";
  static const paramItem = "item";
  final HotComment item;

  @override
  State<HotTucaoPage> createState() => _HotTucaoPageState();
}

class _HotTucaoPageState extends State<HotTucaoPage> {
  final textController = TextEditingController();

  TuCao? tucao;

  @override
  void initState() {
    super.initState();
    Log.log.fine("message");
    resresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locator<S>().comments),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextField(
                controller: textController,
                maxLines: 5,
                minLines: 1,
                scrollPadding: EdgeInsets.zero,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
            )),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send))
          ],
        ),
      ),
      body: ListView(
        children: [
          HotCard(item: widget.item),
          tucao == null || tucao!.data.list.isEmpty
              ? InkWell(
                  onTap: () {
                    resresh();
                  },
                  child: Center(
                    child: Text(
                      locator<S>().have_no_comment_refresh,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          ..._hotComment(context),
          ..._normalComment(context),
        ],
      ),
    );
  }

  List<Widget> _hotComment(BuildContext context) {
    if (tucao == null || tucao!.data.hot.isEmpty) {
      return [];
    } else {
      return [
        Padding(
          padding: Styles.padding,
          child: Text(
            locator<S>().hot_comment,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        ListView.builder(
          itemCount: tucao!.data.hot.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, idx) {
            return TucaoCard(
              idx: idx,
              tucaoList: tucao!.data.hot,
              textEditingController: textController,
            );
          },
        ),
      ];
    }
  }

  List<Widget> _normalComment(BuildContext context) {
    if (tucao == null || tucao!.data.list.isEmpty) {
      return [];
    } else {
      return [
        Padding(
          padding: Styles.padding,
          child: Text(
            locator<S>().latest_comment,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        ListView.builder(
          itemCount: tucao!.data.list.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, idx) {
            return TucaoCard(
              idx: idx,
              tucaoList: tucao!.data.list,
              textEditingController: textController,
            );
          },
        ),
      ];
    }
  }

  void resresh() {
    () async {
      try {
        final tucaon = await JandanApi.getTucao(widget.item.comment_ID);
        setState(() {
          tucao = tucaon;
        });
      } catch (e) {
        Log.http.severe(e);
        SnackBarUtil.showSnackbar(context, Text(locator<S>().network_error));
        rethrow;
      }
    }.call();
  }
}
