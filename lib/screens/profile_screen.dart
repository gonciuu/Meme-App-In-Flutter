import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:memix/models/alert_dialog_action.dart';
import '../widgets/consts.dart';
import '../providers/meme.dart';
import '../providers/memes.dart';
import '../widgets/meme_card.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class ProfileScreen extends StatelessWidget {
  final _auth = Auth();
  final _consts = Consts();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Meme> likedMemes = Provider.of<Memes>(context).likedMemes;
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
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 40),
                child: Text(
                  "Sign Out",
                  style: theme.textTheme.headline6
                      .copyWith(color: theme.primaryColor),
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _consts.getAlertDialog(
                        "Are you sure?",
                        "Are you sure to sign out from the app?",
                        [
                          AlertDialogAction(
                              () => Navigator.of(context).pop(), "Cancel"),
                          AlertDialogAction(
                              () {
                                _auth.signOut().catchError((e) => print(e));
                                Navigator.of(context).pop();
                              } ,
                              "Confirm")
                        ],
                        context)),
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
              ),
              const SizedBox(
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
