import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './main.dart';
import 'screens/auth_screen.dart';
import 'providers/auth.dart';

class Wrapper extends StatelessWidget {
  static const routeName = '/wrapper';
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: _auth.user,
        builder: (context, snapshot) =>
            !snapshot.hasData || snapshot.data == null
                ? AuthScreen()
                : HomePage());
  }
}
