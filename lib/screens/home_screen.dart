import 'package:flutter/material.dart';
import '../widgets/meme_card.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:ListView.builder(itemBuilder: (context,index)=>MemeCard(),itemCount: 5,),
        )
      ],
    );
  }
}
