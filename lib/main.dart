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
  final _views = [
    Text(
      "1",
      style: TextStyle(color: Colors.white),
    ),
    Text("2", style: TextStyle(color: Colors.white)),
    Text("3", style: TextStyle(color: Colors.white))
  ];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 23, 19, 31).withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(OMIcons.addBox,
                    color: _currentIndex == 0 ? Colors.white : Colors.white30),
                onPressed: () => setState(() => _updateIndex(0)),
                iconSize: 35.0,
              ),
              IconButton(
                icon: Icon(
                  OMIcons.image,
                  color: _currentIndex == 1 ? Colors.white : Colors.white30,
                ),
                onPressed: () => setState(() => _updateIndex(1)),
                iconSize: 35.0,
              ),
              IconButton(
                icon: Icon(OMIcons.favoriteBorder,
                    color: _currentIndex == 2 ? Colors.white : Colors.white30),
                onPressed: () => setState(() => _updateIndex(2)),
                iconSize: 35.0,
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: Center(child: _views.elementAt(_currentIndex))));
  }

  void _updateIndex(int index) => _currentIndex = index;
}
