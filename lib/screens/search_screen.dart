import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/meme.dart';
import '../providers/memes.dart';
import '../widgets/meme_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Meme> memes, searchMemes;

  @override
  void initState() {
    super.initState();
    memes = Provider.of<Memes>(context, listen: false).memes;
    searchMemes = memes;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (val) => search(val),
          autofocus: true,
          cursorColor: Colors.white54,
          decoration: InputDecoration(
              hintText: "Search for meme 🔎",
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white38)),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: searchMemes[index], child: MemeCard()),
            itemCount: searchMemes.length,
          ),
        ),
      ),
    );
  }

  void search(String val) {
    setState(() {
      if (val == "")
        searchMemes = memes;
      else
        searchMemes = memes
            .where((meme) =>
        meme.topText.toLowerCase().contains(val.toLowerCase()) ||
            meme.bottomText.toLowerCase().contains(val.toLowerCase()) ||
            meme.photo.name.toLowerCase().contains(val.toLowerCase()))
            .toList();
    });
  }
}
