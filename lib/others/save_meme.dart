import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:memix/models/alert_dialog_action.dart';
import 'package:memix/widgets/consts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

class SaveMeme {
  final consts = Consts();

  Future requestPermission(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage].request();
    final info = statuses[Permission.storage];
    if (info == PermissionStatus.denied) {
      Scaffold.of(context).showSnackBar(
          consts.getSnackBar("You must accept the permission to save memes"));
    } else if (info == PermissionStatus.permanentlyDenied) {
      showDialog(
          context: context,
          builder: (context) => consts.getAlertDialog(
              'Permission',
              'Please Accept the storage permission to save the memes',
              [
                AlertDialogAction(() => Navigator.of(context).pop(), 'Cancel'),
                AlertDialogAction(() async {
                  await openAppSettings();
                  Navigator.of(context).pop();
                }, 'Confirm'),
              ],
              context));
    }
  }

  Future saveImage(GlobalKey globalKey, BuildContext context) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).primaryColor,
                content: Row(
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),SizedBox(width: 20),
                    Text(
                      'Saving image...',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontSize: 16.0),
                    )
                  ],
                ),
              ));
      final RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      final ui.Image image = await boundary.toImage(pixelRatio: 4.0);
      final ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData.buffer.asUint8List();

      final result = await ImageGallerySaver.saveImage(pngBytes, quality: 100);
      if (result['isSuccess']) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      throw e;
    }
  }
}
