import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jandan/core/http/jandan_api.dart';

import '../../models/wuliao/comment.dart';

class WuliaoCard extends StatefulWidget {
  const WuliaoCard({Key? key, required this.item, required this.idx})
      : super(key: key);
  final Comment item;
  final int idx;

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
            Text(
              widget.item.comment_author,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.item.text_content),
            CachedNetworkImage(
              imageUrl: widget.item.pics.first,
              placeholder: (context, url) => const SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    try {
                      final res = await JandanApi.ooxxComment(
                          true, widget.item.comment_ID);
                      if (res.code == 0) {
                        setState(() {
                          widget.item.ooxx =
                              true; // 暂时使用临时数据保存ooxx状态，刷新网页后不出现红色，与网页版一致，后续考虑数据库
                          widget.item.vote_positive =
                              (int.parse(widget.item.vote_positive) + 1)
                                  .toString();
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(res.msg)));
                        setState(() {
                          widget.item.ooxx = null;
                        });
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("投票失败")));
                      setState(() {
                        widget.item.ooxx = null;
                      });
                    }
                  },
                  child: Text(
                    "oo ${widget.item.vote_positive}",
                    style: TextStyle(
                        color: widget.item.ooxx == true ? Colors.red : null),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    try {
                      final res = await JandanApi.ooxxComment(
                          false, widget.item.comment_ID);
                      if (res.code == 0) {
                        setState(() {
                          widget.item.ooxx = false;
                          widget.item.vote_negative =
                              (int.parse(widget.item.vote_negative) + 1)
                                  .toString();
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(res.msg)));
                        setState(() {
                          widget.item.ooxx = null;
                        });
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("投票失败")));
                      setState(() {
                        widget.item.ooxx = null;
                      });
                    }
                  },
                  child: Text(
                    "xx ${widget.item.vote_negative}",
                    style: TextStyle(
                        color: widget.item.ooxx == false ? Colors.red : null),
                  ),
                ),
                const Spacer(),
                Text("吐槽 ${widget.item.sub_comment_count}"),
                const Spacer(flex: 10),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
