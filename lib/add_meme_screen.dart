import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './meme_text.dart';
import './consts.dart';

class AddMemeScreen extends StatefulWidget {
  @override
  _AddMemeScreenState createState() => _AddMemeScreenState();
}

class _AddMemeScreenState extends State<AddMemeScreen> {
  MemeText t1 = MemeText();
  MemeText t2 = MemeText();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  Image.network(
                    'https://bingoland.pl/userdata/public/gfx/2652/tlo-fotograficzne-biale.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 300,
                  ),
                  Align(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: AutoSizeText(
                        t1.text,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(color: Colors.grey[900], fontSize: 36),
                      ),
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: AutoSizeText(
                        t2.text,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(color: Colors.grey[900], fontSize: 36),
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  hintText: 'Enter Top Text',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey),
                  focusedBorder: border,
                  enabledBorder: border.copyWith(
                      borderSide: BorderSide(color: Colors.grey[600]))),
              style: Theme.of(context).textTheme.headline6,
              onChanged: (val) => setState(() => t1.text = val),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  hintText: 'Enter Bottom Text',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey),
                  focusedBorder: border,
                  enabledBorder: border.copyWith(
                      borderSide: BorderSide(color: Colors.grey[600]))),
              style: Theme.of(context).textTheme.headline6,
              onChanged: (val) => setState(() => t2.text = val),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Create Meme",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
