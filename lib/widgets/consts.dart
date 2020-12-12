import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memix/models/alert_dialog_action.dart';

class Consts {
  final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.white, width: 1.0));

  SnackBar getSnackBar(String content) => SnackBar(
        backgroundColor: Color.fromARGB(255, 25, 23, 32),
        duration: Duration(seconds: 3),
        content: Text(
          content,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      );

  AlertDialog getAlertDialog(String title, String content, List<AlertDialogAction> actionsBt,BuildContext context) =>
      AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
          title: Text(title,style: Theme.of(context).textTheme.headline3),
          content: Text(content,style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16.0),),
          actions: actionsBt
              .map((function) => FlatButton(
                    child: Text(function.text,style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 15.0),),
                    onPressed: function.function,
                  ))
              .toList());
}
