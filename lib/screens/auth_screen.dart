import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/auth.dart';
import '../widgets/consts.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _consts = Consts();
  final _auth = Auth();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, String> _userData = {"email": "", "password": ""};

  var isLogin = true;

  void showLoadingDialog(String text) => showDialog(
      context: context,
      builder: (context) => _consts.getLoadingDialog(context, text));

  Future<void> _saveForm() async {
    if (!_form.currentState.validate()) return;
    _form.currentState.save();
    if (isLogin) {
      showLoadingDialog("Log in...");
      try {
        await _auth.signIn(_userData['email'], _userData['password']);
      } catch (e) {
        _scaffoldKey.currentState
            .showSnackBar(_consts.getSnackBar(e.toString()));
      }
      Navigator.of(context).pop();
    } else {
      showLoadingDialog("Registering...");
      try {
        await _auth.signUp(_userData['email'], _userData['password']);
      } catch (e) {
        _scaffoldKey.currentState
            .showSnackBar(_consts.getSnackBar(e.toString()));
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 70),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Welcome back!",
                    maxLines: 1,
                    style: theme.textTheme.headline1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AutoSizeText(
                    " ${isLogin ? "Login" : "Register"} to start 😎",
                    maxLines: 1,
                    style: theme.textTheme.headline1.copyWith(fontSize: 32.0),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                      validator: (val) =>
                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)
                              ? "Enter correct email"
                              : null,
                      keyboardType: TextInputType.emailAddress,
                      style: theme.textTheme.headline6,
                      cursorColor: Colors.white24,
                      decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: theme.textTheme.headline6
                              .copyWith(color: Colors.white54),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          fillColor: theme.accentColor,
                          filled: true,
                          border: _consts.filledBorder),
                      onSaved: (val) => _userData['email'] = val),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordController,
                    validator: (val) => val.length < 6
                        ? "Enter 6 character password at least"
                        : null,
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
                        border: _consts.filledBorder),
                    onSaved: (val) => _userData['password'] = val,
                  ),
                  SizedBox(height: 15),
                  if (!isLogin)
                    TextFormField(
                      validator: (val) => _passwordController.text != val
                          ? "Passwords don't match"
                          : null,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: theme.textTheme.headline6,
                      cursorColor: Colors.white24,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: theme.textTheme.headline6
                              .copyWith(color: Colors.white54),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          fillColor: theme.accentColor,
                          filled: true,
                          border: _consts.filledBorder),
                    ),
                  SizedBox(height: !isLogin ? 30 : 15),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Text(isLogin ? "Log in" : "Register",
                          style: theme.textTheme.headline6.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700)),
                      onPressed: _saveForm,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20, top: 10, bottom: 10, left: 20),
                    child: Align(
                      child: GestureDetector(
                        onTap: () => setState(() => isLogin = !isLogin),
                        child: Text(
                          isLogin ? "Sing Up" : "Sign In",
                          style: TextStyle(color: Colors.white, shadows: [
                            const Shadow(
                                color: Colors.white38,
                                offset: const Offset(1.0, 1.0)),
                            const Shadow(
                                color: Colors.white24,
                                offset: const Offset(2.0, 2.0))
                          ]),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),
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
