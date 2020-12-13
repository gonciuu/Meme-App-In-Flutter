import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/meme.dart';
import 'package:provider/provider.dart';

class MemeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meme = Provider.of<Meme>(context,listen:false);
    final screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: screenHeight / 2.2,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              meme.photo.url,
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
              child: Container(
                width: double.infinity,
                child: AutoSizeText(
                  meme.topText,
                  textAlign:  meme.memeTextStyle.align,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                      color:  meme.memeTextStyle.color,
                      fontSize:  meme.memeTextStyle.maxFontSize,
                      fontWeight:  meme.memeTextStyle.weight,
                      fontFamily:  meme.memeTextStyle.fontFamily),
                ),
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
              child: Container(
                width: double.infinity,
                child: AutoSizeText(
                  meme.bottomText,
                  textAlign: meme.memeTextStyle.align,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                      color: meme.memeTextStyle.color,
                      fontSize: meme.memeTextStyle.maxFontSize,
                      fontWeight: meme.memeTextStyle.weight,
                      fontFamily: meme.memeTextStyle.fontFamily),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
