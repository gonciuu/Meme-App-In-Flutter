import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Memes App',
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                headline2: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                headline3: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
          backgroundColor: Color.fromARGB(255, 43, 39, 51),
          fontFamily: 'Lato',
          primaryColor: Color.fromARGB(255, 25, 23, 32),
          accentColor: Color.fromARGB(255, 43, 39, 51),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {'/': (context) => HomePage()});
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 23, 19, 31).withOpacity(0.5) ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(OMIcons.image,color: Colors.white,),
              onPressed: () {},
              iconSize: 40.0,
            ),IconButton(
              icon: Icon(OMIcons.image,color: Colors.white),
              onPressed: () {},
              iconSize: 40.0,
            ),IconButton(
              icon: Icon(OMIcons.image,color: Colors.white),
              onPressed: () {},
              iconSize: 40.0,
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Text(
        "XD",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
