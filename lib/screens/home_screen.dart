import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memix/providers/auth.dart';
import '../providers/meme.dart';
import '../widgets/consts.dart';
import '../providers/memes.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';
import '../widgets/meme_card.dart';

enum FilterOptions { MostPopular, Latest, OnlyFavourites }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FilterOptions chooseFilter = FilterOptions.MostPopular;
  List<Meme> memes = [];
  @override
  void initState() {
    super.initState();
    memes = Provider.of<Memes>(context,listen : false).memes;
  }


  void switchMemes(FilterOptions val){
    final memesProvider = Provider.of<Memes>(context,listen: false);

    setState(() {
      chooseFilter = val;
      switch(chooseFilter){
        case FilterOptions.MostPopular : memes = memesProvider.memes;/*memesProvider.memes..sort((a,b)=>a.usersLiked.length.compareTo(b.usersLiked.length));*/break;
        case FilterOptions.Latest : memes = memesProvider.likedMemes;break;
        case FilterOptions.OnlyFavourites : memes = memesProvider.likedMemes;break;
        default : memes = memesProvider.memes;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final memesProvider = Provider.of<Memes>(context);

    return RefreshIndicator(
      displacement: 100.0,
      onRefresh: () async => memesProvider
          .fetchMemes()
          .catchError((e) => Scaffold.of(context).showSnackBar(Consts().getSnackBar("Error : $e"))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      OMIcons.menu,
                      size: 32,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${memesProvider.likedMemesCount}",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(OMIcons.search, size: 32, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Popular Memes",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 32),
                  ),
                  Spacer(),
                  PopupMenuButton(
                    onSelected: (val) => switchMemes(val),
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      OMIcons.filterList,
                      size: 30,
                      color: Colors.white,
                    ),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Most Popular",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        value: FilterOptions.MostPopular,
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.timer, color: Colors.white),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Latest",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        value: FilterOptions.Latest,
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.white),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Only favourites",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        value: FilterOptions.OnlyFavourites,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              memes.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                            value: memes[index],
                            child: MemeCard(),
                          ),
                      itemCount: memes.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics())
                  : SizedBox(
                      height: 150,
                      child: Center(
                          child: Text("No memes available already",
                              style: Theme.of(context).textTheme.headline3)))
            ],
          ),
        ),
      ),
    );
  }
}
