import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../models/identity.dart';
import '../../utils/sputils.dart';

void showidentityDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController nameController = TextEditingController();
      TextEditingController mailController = TextEditingController();

      return AlertDialog(
        title: Text(locator<S>().identity),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: locator<S>().nickname),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: locator<S>().email),
              controller: nameController,
            )
          ],
        ),
        actions: [
          TextButton(
            child: Text(locator<S>().cancle),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(locator<S>().confirm),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  mailController.text.isNotEmpty) {
                SPUtils.saveIdentity(Identity(
                    name: nameController.text, email: mailController.text));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      );
    },
  );
}
