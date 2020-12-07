import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../widgets/meme_card.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Row(children: [
              IconButton(
                icon : Icon(OMIcons.menu,size: 32,color: Colors.white,),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal:20.0,vertical: 12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.favorite,color: Colors.white,),
                    SizedBox(width: 10.0,),
                    Text("222",style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16.0),)
                  ],
                ),
              ),
              SizedBox(width: 10.0,),
              IconButton(
                icon: Icon(OMIcons.search,size: 32,color: Colors.white), onPressed: () { },
              )
            ],),
            SizedBox(height: 40,),
            Row(
              children: [
                Text(
                  "Popular Memes",
                  style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 32),
                ),Spacer(),
                PopupMenuButton(
                  icon: Icon(OMIcons.filterList,size: 30,color: Colors.white,), itemBuilder: (BuildContext context) =>[
                    PopupMenuItem(child: Text("XD"),),
                    PopupMenuItem(child: Text("XD"),),
                    PopupMenuItem(child: Text("XD"),),
                    PopupMenuItem(child: Text("XD"),),
                    PopupMenuItem(child: Text("XD"),),
                ],
                )
              ],
            ),
            SizedBox(height: 10,),
            ListView.builder(itemBuilder: (context,index)=>MemeCard(),itemCount: 5,scrollDirection: Axis.vertical,
              shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)
          ],
        ),
      ),
    );
  }
}
