import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            children: [
              Image.network(
                'https://api.memegen.link/images/spongebob.jpg',
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Text(
                  "Welcome to memix",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(height: 30,),
              Divider(height: 2,thickness: 1,),
              ListTile(title: Text("Add new meme",style: Theme.of(context)
                  .textTheme
                  .headline6.copyWith(fontWeight: FontWeight.w700)),subtitle: Text("Export to gallery or share your own meme",style: Theme.of(context)
                  .textTheme
                  .headline6.copyWith(color: Colors.white54,fontSize: 14))),
              Divider(height: 2,thickness: 1,),
              ListTile(title: Text("Profile",style: Theme.of(context)
                  .textTheme
                  .headline6.copyWith(fontWeight: FontWeight.w700)),subtitle: Text("Show data about your profile",style: Theme.of(context)
                  .textTheme
                  .headline6.copyWith(color: Colors.white54,fontSize: 14))),
              Divider(height: 2,thickness: 1,),
              ListTile(title: Text("Create New Meme",style: Theme.of(context)
                  .textTheme
                  .headline6.copyWith(fontWeight: FontWeight.w700)),subtitle: Text("Create your own meme",style: Theme.of(context)
                  .textTheme
                  .headline6.copyWith(color: Colors.white54,fontSize: 14))),
              Divider(height: 2,thickness: 1,),

            ],
          ),
        ),
      ),
    );
  }
}
