import 'package:flutter/material.dart';

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
          headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
          headline2: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255,43, 39, 51),
        fontFamily: 'Lato',
        primaryColor: Color.fromARGB(255,25, 23, 32),
        accentColor: Color.fromARGB(255,43, 39, 51),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Text("XD",style: Theme.of(context).textTheme.headline1,),
    );
  }
}
