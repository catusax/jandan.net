import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/http/jandan_api.dart';
import '../../../core/utils/log.dart';
import '../../../generated/l10n.dart';
import '../../../init/locator.dart';
import '../../../init/themes.dart';
import '../../../models/wuliao/comment.dart';
import '../../../models/wuliao/tucao.dart';
import '../../../utils/snackbar.dart';
import '../../../widgets/card/tucao_card.dart';
import '../../../widgets/card/wuliao_card.dart';

class TucaoPage extends StatefulWidget {
  const TucaoPage({Key? key, required this.item}) : super(key: key);
  static const routeName = "/wuliao_comment";
  static const paramItem = "item";
  final Comment item;

  @override
  State<TucaoPage> createState() => _TucaoPageState();
}

class _TucaoPageState extends State<TucaoPage> {
  final textController = TextEditingController();

  TuCao? tucao;

  @override
  void initState() {
    super.initState();
    Log.log.fine("message");
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
          WuliaoCard(item: widget.item),
          tucao == null || tucao!.data.list.isEmpty
              ? InkWell(
                  child: Text(
                    locator<S>().have_no_comment_refresh,
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
}
