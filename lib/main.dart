import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/search_screen.dart';
import './providers/main_screen.dart';
import './widgets/app_drawer.dart';
import './wrapper.dart';
import './screens/auth_screen.dart';
import './providers/memes.dart';
import './providers/photos.dart';
import 'package:provider/provider.dart';
import './screens/loading_data_screen.dart';
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
        ChangeNotifierProvider(create: (_) => Photos()),
        ChangeNotifierProvider(create: (_) => Memes()),
        ChangeNotifierProvider(create: (_) => MainScreen()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Memes App',
          theme: ThemeData(
            dividerColor: Color.fromARGB(255, 73, 69, 81),

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
              canvasColor: Color.fromARGB(255, 43, 39, 51),),
          initialRoute: LoadingDataScreen.routeName,
          routes: {
            '/': (context) => AuthScreen(),
            Wrapper.routeName: (context) => Wrapper(),
            LoadingDataScreen.routeName: (context) => LoadingDataScreen(),
            SearchScreen.routeName: (context) => SearchScreen()
          }),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final mainScreenProvider = Provider.of<MainScreen>(context);
    return Scaffold(
        drawer: AppDrawer(),
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
                      color:
                      mainScreenProvider.currentIndex == 0 ? Colors.white : Colors.white30),
                  onPressed: () => setState(() => mainScreenProvider.changeIndex(0)),
                  iconSize: 32.0,
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    OMIcons.image,
                    color: mainScreenProvider.currentIndex  == 1 ? Colors.white : Colors.white30,
                  ),
                  onPressed: () => setState(() => mainScreenProvider.changeIndex(1)),
                  iconSize: 32.0,
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(OMIcons.personOutline,
                      color:
                      mainScreenProvider.currentIndex == 2 ? Colors.white : Colors.white30),
                  onPressed: () => setState(() => mainScreenProvider.changeIndex(2)),
                  iconSize: 32.0,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: mainScreenProvider.currentView));
  }

}
