import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../init/themes.dart';
import '../../models/posts/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: Styles.fontSizeMiddle),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        post.author.name + " " + post.date.substring(2, 10),
                        style: const TextStyle(fontSize: Styles.fontSizeSmall),
                      ),
                      Text(
                        post.comment_count.toString() +
                            " " +
                            locator<S>().comments,
                        style: const TextStyle(fontSize: Styles.fontSizeSmall),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 100,
                child: ExtendedImage.network(post.custom_fields.thumb_c[0]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
