import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadingDataScreen extends StatelessWidget {
  static const routeName = 'loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(backgroundColor: Colors.white),
            SizedBox(
              height: 30,
            ),
            TypewriterAnimatedTextKit(
              repeatForever: true,
              speed: Duration(milliseconds: 100),
              text: [
                "Loading...",
              ],
              textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
