import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memix/widgets/meme_card.dart';
import '../providers/auth.dart';

class ProfileScreen extends StatelessWidget {
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 70, left: 40, right: 40),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              "Are are logged as ${_auth.email}",
              maxLines: 2,
              style: theme.textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 40),
              child: Text(
                "Sign Out",
                style: theme.textTheme.headline6
                    .copyWith(color: theme.primaryColor),
              ),
              onPressed: () => _auth.signOut().catchError((e) => print(e)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  "Liked memes",
                  maxLines: 1,
                  style: theme.textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
            ListView.builder(
              itemBuilder: (context, index) => MemeCard(),
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            )
          ],
        ),
      ),
    );
  }
}
