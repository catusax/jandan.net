import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  bool voted = false;
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
                    onTap: () {
                      voted = true;
                    }, //TODO: ooxx
                    child: Text("oo ${widget.item.vote_positive}"),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      voted = true;
                    },
                    child: Text("oo ${widget.item.vote_negative}"),
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
        ));
  }
}
