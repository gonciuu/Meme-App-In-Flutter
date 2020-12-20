import 'package:flutter/material.dart';
import '../screens/add_meme_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class MainScreen with ChangeNotifier{

  final _views = [AddMemeScreen(), HomeScreen(), ProfileScreen()];
  int index = 1;

  Widget get currentView => _views.elementAt(index);
  int get currentIndex => index;

  void changeIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }


}