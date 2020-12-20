import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memix/providers/main_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void closeDrawer() => Navigator.of(context).pop();
    final mainScreenProvider = Provider.of<MainScreen>(context, listen: false);
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
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 2,
                thickness: 1,
              ),
              ListTile(
                title: Text("Add new meme",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700)),
                subtitle: Text("Export to gallery or share your own meme",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white54, fontSize: 14)),
                onTap: () {
                  closeDrawer();
                  mainScreenProvider.changeIndex(0);
                },
              ),
              Divider(
                height: 2,
                thickness: 1,
              ),
              ListTile(
                title: Text("Profile",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700)),
                subtitle: Text("Show data about your profile",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white54, fontSize: 14)),
                onTap: () {
                  closeDrawer();
                  mainScreenProvider.changeIndex(2);
                },
              ),
              Divider(
                height: 2,
                thickness: 1,
              ),
              ListTile(
                title: Text("Show All Memes",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700)),
                subtitle: Text("Show All memes by most popular",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white54, fontSize: 14)),
                onTap: () {
                  closeDrawer();
                  mainScreenProvider.changeIndex(1);
                },
              ),
              Divider(
                height: 2,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
