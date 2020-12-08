import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class MemeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              'https://thepsychologist.bps.org.uk/sites/thepsychologist.bps.org.uk/files/img_9685.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: screenHeight / 2.5,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(1),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: FittedBox(
                child: Icon(
                  OMIcons.favoriteBorder,
                  size: 32.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
