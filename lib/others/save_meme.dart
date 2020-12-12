import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:memix/widgets/consts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

class SaveMeme {
  Future requestPermission(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage].request();
    final info = statuses[Permission.storage];
    if (info == PermissionStatus.denied) {
      Scaffold.of(context).showSnackBar(
          Consts().getSnackBar("You must accept the permission to save memes"));
    } else if (info == PermissionStatus.permanentlyDenied) {
      Scaffold.of(context).showSnackBar(Consts().getSnackBar("Please enable the storage permission in app settings"));
      Future.delayed(Duration(seconds: 2), () => openAppSettings());
    }
  }

  Future saveImage(GlobalKey globalKey) async {
    try {
      final RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      final ui.Image image = await boundary.toImage(pixelRatio: 1.0);
      final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(pngBytes, quality: 100);
      if(result['isSuccess']){

      }else{

      }
    } catch (e) {
      throw e;
    }
  }
}
