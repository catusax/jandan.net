import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../core/http/jandan_api.dart';
import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../models/card_item.dart';
import '../../page/image_viewer/image_viewer_page.dart';
import '../../router/router_map.dart';
import '../../utils/snackbar.dart';
import '../text/blod_text.dart';

class WuliaoCard extends StatefulWidget {
  const WuliaoCard({Key? key, required this.item}) : super(key: key);
  final CardItem item;

  @override
  State<WuliaoCard> createState() => _WuliaoCardState();
}

class _WuliaoCardState extends State<WuliaoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleBlodText(widget.item.comment_author),
            Text(
              timeago.format(
                DateTime.parse(widget.item.comment_date),
                locale: Localizations.localeOf(context).languageCode,
              ),
            ),
            Text(widget.item.text_content.trim()),
            _images(context),
            _actionRows(context)
          ],
        ),
      ),
    );
  }

  Widget _images(BuildContext context) {
    switch (widget.item.pics.length) {
      case 0:
        return const SizedBox.shrink();
      case 1:
        return _image(context, widget.item.pics.first, 0);
      default:
        return GridView.builder(
            itemCount: widget.item.pics.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, idx) {
              return _image(context, widget.item.pics[idx], idx);
            });
    }
  }

  Widget _image(BuildContext context, String url, int index, {double? size}) {
    return InkWell(
      child: Center(
          child: Hero(
        tag: url + index.toString(),
        child: ExtendedImage.network(
          url,
          height: size,
          width: size,
          cache: true,
          cacheMaxAge: const Duration(days: 30),
        ),
      )),
      onTap: () {
        RouteMaps.navigateTo(context, ImageViewerPage.routeName,
            params: {
              ImageViewerPage.paramImages: json.encode(widget.item.pics),
              ImageViewerPage.paramIndex: index.toString(),
            },
            transition: TransitionType.fadeIn);
      },
    );
  }

  Widget _actionRows(BuildContext context) {
    return Row(
      children: [
        InkWell(
          //oo按钮
          onTap: () async {
            if (widget.item.ooxx != null) return;
            try {
              final res =
                  await JandanApi.ooxxComment(true, widget.item.comment_ID);
              if (res.code == 0) {
                setState(() {
                  widget.item.ooxx =
                      true; // 暂时使用临时数据保存ooxx状态，刷新网页后不出现红色，与网页版一致，后续考虑数据库
                  widget.item.vote_positive++;
                });
              } else {
                SnackBarUtil.showSnackbar(context, Text(res.msg));
                setState(() {
                  widget.item.ooxx = null;
                });
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(locator<S>().failed_to_vote)));
              setState(() {
                widget.item.ooxx = null;
              });
            }
          },
          child: Text(
            "oo ${widget.item.vote_positive}",
            style: TextStyle(
                color: widget.item.ooxx == true
                    ? Theme.of(context).primaryColor
                    : null),
          ),
        ),
        const Spacer(),
        InkWell(
          //xx按钮
          onTap: () async {
            if (widget.item.ooxx != null) return;
            try {
              final res =
                  await JandanApi.ooxxComment(false, widget.item.comment_ID);
              if (res.code == 0) {
                setState(() {
                  widget.item.ooxx = false;
                  widget.item.vote_negative++;
                });
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(res.msg)));
                setState(() {
                  widget.item.ooxx = null;
                });
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(locator<S>().failed_to_vote)));
              setState(() {
                widget.item.ooxx = null;
              });
            }
          },
          child: Text(
            "xx ${widget.item.vote_negative}",
            style: TextStyle(
                color: widget.item.ooxx == false
                    ? Theme.of(context).primaryColor
                    : null),
          ),
        ),
        const Spacer(),
        Text("${locator<S>().comments} ${widget.item.sub_comment_count}"),
        const Spacer(flex: 10),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Share.share(
                            "https://jandan.net/t/${widget.item.comment_ID}");
                        Navigator.of(context).pop();
                      },
                      title: Text(locator<S>().share),
                    ),
                    ListTile(
                      onTap: () {
                        //TODO: 收藏夹
                        Navigator.of(context).pop();
                      },
                      title: Text(locator<S>().add_to_fav),
                    ),
                    ListTile(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(
                            text:
                                "${widget.item.text_content} https://jandan.net/t/${widget.item.comment_ID}",
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                      title: Text(locator<S>().copy_addr),
                    )
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.more_horiz_rounded),
        )
      ],
    );
  }
}
