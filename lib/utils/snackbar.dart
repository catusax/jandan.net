import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../init/locator.dart';

class SnackBarUtil {
  static void showSnackbar(BuildContext context, Widget content,
      {int duration = 4000}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        action: SnackBarAction(
            label: locator<S>().dismiss,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
        duration: Duration(milliseconds: duration),
      ),
    );
  }
}
