import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/auth_screen.dart';
import './providers/memes.dart';
import './providers/photos.dart';
import 'package:provider/provider.dart';
import './screens/loading_data_screen.dart';
import './screens/add_meme_screen.dart';
import './screens/home_screen.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> Photos()),
        ChangeNotifierProvider(create: (_)=> Memes())
      ],
      child: MaterialApp(
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
                  headline6: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
            backgroundColor: Color.fromARGB(255, 43, 39, 51),
            fontFamily: 'Lato',
            primaryColor: Color.fromARGB(255, 25, 23, 32),
            accentColor: Color.fromARGB(255, 43, 39, 51),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: LoadingDataScreen.routeName,
          routes: {
            '/': (context) => AuthScreen(),
            LoadingDataScreen.routeName: (context) => LoadingDataScreen()
          }),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _views = [
    AddMemeScreen(),
    HomeScreen(),
    Text("2", style: TextStyle(color: Colors.white))
  ];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        drawerEnableOpenDragGesture: true,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 23, 19, 31).withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(OMIcons.addBox,
                      color: _currentIndex == 0 ? Colors.white : Colors.white30),
                  onPressed: () => setState(() => _updateIndex(0)),
                  iconSize: 32.0,
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    OMIcons.image,
                    color: _currentIndex == 1 ? Colors.white : Colors.white30,
                  ),
                  onPressed: () => setState(() => _updateIndex(1)),
                  iconSize: 32.0,
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(OMIcons.favoriteBorder,
                      color: _currentIndex == 2 ? Colors.white : Colors.white30),
                  onPressed: () => setState(() => _updateIndex(2)),
                  iconSize: 32.0,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: _views.elementAt(_currentIndex)));
  }

  void _updateIndex(int index) => _currentIndex = index;
}
