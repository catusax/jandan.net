import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/http/jandan_api.dart';
import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../init/themes.dart';
import '../../models/wuliao/tucao.dart';
import '../text/blod_text.dart';

class TucaoCard extends StatefulWidget {
  const TucaoCard(
      {Key? key,
      required this.idx,
      required this.tucaoList,
      required this.textEditingController})
      : super(key: key);
  final int idx;
  final List<TuCaoContent> tucaoList;
  final TextEditingController textEditingController;

  @override
  _TucaoCardState createState() => _TucaoCardState();
}

class _TucaoCardState extends State<TucaoCard> {
  @override
  Widget build(BuildContext context) {
    final tucao = widget.tucaoList[widget.idx];
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text(tucao.author),
              children: [
                ListTile(
                  title: Text(locator<S>().reply),
                  onTap: () {
                    widget.textEditingController.text =
                        " #@[${tucao.author}]${tucao.post_id}# ";
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(locator<S>().copy_comment),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: tucao.content));
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
      child: Padding(
        padding: Styles.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleBlodText(tucao.author),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    try {
                      final res = await JandanApi.ooxxTucao(
                          true, tucao.post_id.toString());
                      if (res.error == 0) {
                        setState(() {
                          tucao.ooxx = true;
                          tucao.vote_positive++;
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(res.msg)));
                        setState(() {
                          tucao.ooxx = null;
                        });
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(locator<S>().failed_to_vote)));
                      setState(() {
                        tucao.ooxx = null;
                      });
                    }
                  },
                  child: Text("oo ${tucao.vote_positive}"),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    try {
                      final res = await JandanApi.ooxxTucao(
                          false, tucao.post_id.toString());
                      if (res.error == 0) {
                        setState(() {
                          tucao.ooxx = false;
                          tucao.vote_negative++;
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(res.msg)));
                        setState(() {
                          tucao.ooxx = null;
                        });
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(locator<S>().failed_to_vote)));
                      setState(() {
                        tucao.ooxx = null;
                      });
                    }
                  },
                  child: Text("xx ${tucao.vote_negative}"),
                )
              ],
            ),
            Html(data: tucao.date),
            Text(tucao.content),
          ],
        ),
      ),
    );
  }
}
