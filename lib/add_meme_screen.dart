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

  int _chosenWeightButton = 0;

  final listOfFontFamilies = const [
    'Lato',
    'Coda',
    'Poppins',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Meme",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        'https://bingoland.pl/userdata/public/gfx/2652/tlo-fotograficzne-biale.jpg',
                        width: double.infinity,
                        fit: BoxFit.fill,
                        height: 300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: AutoSizeText(
                          t1.text,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 36,
                              fontWeight: t1.weight),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: AutoSizeText(
                          t2.text,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 36,
                              fontWeight: t2.weight),
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Text Style",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  _getFontWeightButton("Bold", () {
                    _setWeight(FontWeight.w900, 0);
                  }, 0),
                  SizedBox(
                    width: 20,
                  ),
                  _getFontWeightButton("Normal", () {
                    _setWeight(FontWeight.w500, 1);
                  }, 1),
                  SizedBox(
                    width: 20,
                  ),
                  _getFontWeightButton("Light", () {
                    _setWeight(FontWeight.w300, 2);
                  }, 2),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Font Family",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              PopupMenuButton(
                itemBuilder: [PopupMenuItem(child: Text("XD"))],
                child: Icon(Icons.list,),
              ),
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
      ),
    );
  }

  void _setWeight(FontWeight weight, int chosen) {
    setState(() {
      t1.weight = weight;
      t2.weight = weight;
      _chosenWeightButton = chosen;
    });
  }

  Widget _getFontWeightButton(String title, Function handler, int actual) =>
      Expanded(
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: AutoSizeText(
            title,
            maxLines: 1,
            maxFontSize: 18,
            style: Theme.of(context).textTheme.headline3.copyWith(
                color: actual == _chosenWeightButton
                    ? Theme.of(context).primaryColor
                    : Colors.white),
          ),
          onPressed: handler,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: actual == _chosenWeightButton
              ? Colors.white
              : Theme.of(context).primaryColor,
        ),
      );
}
