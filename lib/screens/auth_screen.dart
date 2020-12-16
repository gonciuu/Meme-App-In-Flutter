import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memix/widgets/consts.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final consts = Consts();
  var isLogin = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Welcome back!\nLogin to start",
                    maxLines: 2,
                    style: theme.textTheme.headline1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: theme.textTheme.headline6,
                    cursorColor: Colors.white24,
                    decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: theme.textTheme.headline6
                            .copyWith(color: Colors.white54),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        fillColor: theme.accentColor,
                        filled: true,
                        border: consts.filledBorder),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: theme.textTheme.headline6,
                    cursorColor: Colors.white24,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: theme.textTheme.headline6
                            .copyWith(color: Colors.white54),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        fillColor: theme.accentColor,
                        filled: true,
                        border: consts.filledBorder),
                  ),
                  SizedBox(height: 15),
                  if(!isLogin) TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: theme.textTheme.headline6,
                    cursorColor: Colors.white24,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: theme.textTheme.headline6
                            .copyWith(color: Colors.white54),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        fillColor: theme.accentColor,
                        filled: true,
                        border: consts.filledBorder),
                  ),
                  SizedBox( height: !isLogin ? 30:15),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Text( isLogin ? "Log in" : "Register",
                          style: theme.textTheme.headline6.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700)),
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Align(
                    child: GestureDetector(
                      onTap: () => setState(() => isLogin = !isLogin),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10,bottom: 10,left: 20),
                        child: Text(
                          isLogin ? "Sing Up" : "Sign In",
                          style: TextStyle(color: Colors.white, shadows: [
                            Shadow(
                                color: Colors.white38, offset: Offset(1.0, 1.0)),
                            Shadow(
                                color: Colors.white24, offset: Offset(2.0, 2.0))
                          ]),
                        ),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
