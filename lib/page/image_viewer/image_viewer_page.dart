import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/utils/log.dart';
import '../../generated/l10n.dart';
import '../../init/locator.dart';
import '../../utils/snackbar.dart';

class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage(
      {Key? key, required this.images, required this.currentIndex})
      : super(key: key);

  static const routeName = "/image_viewer";
  static const paramImages = "images";
  static const paramIndex = "currentIndex";

  final List<String> images;
  final int currentIndex;

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(children: [
        ExtendedImageGesturePageView.builder(
          itemBuilder: (BuildContext context, int index) {
            var item = widget.images[index];
            return ExtendedImage.network(
              item,
              fit: BoxFit.contain,
              mode: ExtendedImageMode.gesture,
            );
          },
          itemCount: widget.images.length,
          onPageChanged: (int index) {
            currentIndex = index;
          },
          controller: ExtendedPageController(
            initialPage: widget.currentIndex,
          ),
          scrollDirection: Axis.horizontal,
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Row(
            children: [
              IconButton(
                iconSize: 20,
                onPressed: () async {
                  // TODO: 安卓保存文件权限 https://pub.dev/packages/image_gallery_saver
                  final imageData =
                      await getNetworkImageData(widget.images[currentIndex]);
                  try {
                    Directory tempDir = await getTemporaryDirectory();
                    final suffix = widget.images[currentIndex].substring(
                        widget.images[currentIndex].length - 36); //hash+后缀 32+4
                    Log.log.fine("save image" + suffix);
                    final file = await File(tempDir.path + suffix)
                        .writeAsBytes(imageData!);
                    final permissionStatus =
                        await Permission.manageExternalStorage.request();
                    if (!permissionStatus.isGranted) {
                      throw Exception("no permission");
                    }
                    final result = await ImageGallerySaver.saveFile(file.path);
                    await file.delete();
                    if (result['isSuccess'] != true) {
                      throw Exception("");
                    }
                    SnackBarUtil.showSnackbar(
                        context, Text(locator<S>().save_success));
                    Log.log.fine(result);
                  } catch (e) {
                    SnackBarUtil.showSnackbar(
                        context, Text(locator<S>().failed_to_save));
                  }
                },
                icon: Icon(
                  Icons.download,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                iconSize: 20,
                onPressed: () async {
                  final imageData =
                      await getNetworkImageData(widget.images[currentIndex]);
                  try {
                    Directory tempDir = await getTemporaryDirectory();
                    final suffix = widget.images[currentIndex]
                        .substring(widget.images[currentIndex].length - 3);
                    final file = await File(tempDir.path + "share." + suffix)
                        .writeAsBytes(imageData!);
                    await Share.shareFiles(
                      [file.path],
                    );
                  } catch (e) {
                    SnackBarUtil.showSnackbar(
                        context, Text(locator<S>().failed_to_share));
                  }
                },
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
