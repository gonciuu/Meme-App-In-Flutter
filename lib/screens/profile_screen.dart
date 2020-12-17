import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memix/providers/meme.dart';
import 'package:memix/providers/memes.dart';
import 'package:memix/widgets/meme_card.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class ProfileScreen extends StatelessWidget {
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Meme> likedMemes =
        Provider.of<Memes>(context).getLikedMemes(_auth.uid);
    likedMemes.add(Provider.of<Memes>(context).memes[0]);
    likedMemes.add(Provider.of<Memes>(context).memes[0]);
    likedMemes.add(Provider.of<Memes>(context).memes[0]);
    likedMemes.add(Provider.of<Memes>(context).memes[0]);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
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
              const SizedBox(
                height: 20,
              ),
              FlatButton(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 40),
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
              const SizedBox(
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
                  const SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    "Liked memes",
                    maxLines: 1,
                    style: theme.textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  child: MemeCard(),
                  value: likedMemes[index],
                ),
                itemCount: likedMemes.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
              )
            ],
          ),
        ),
      ),
    );
  }
}
