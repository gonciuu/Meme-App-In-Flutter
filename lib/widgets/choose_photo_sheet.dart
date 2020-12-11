import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/photo.dart';
import '../providers/photos.dart';
import 'package:provider/provider.dart';

class ChoosePhotoSheet extends StatelessWidget {
  final Function handler;
  ChoosePhotoSheet(this.handler);
  @override
  Widget build(BuildContext context) {
    final List<Photo> photos = Provider.of<Photos>(context).photos;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("Choose image",style: Theme.of(context).textTheme.headline2,),
            SizedBox(height: 30,),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap : ()=> handler(photos[index]),
                          child: Container(
                              width: 100,
                              height: 100,
                              child: Image.network(photos[index].url,
                                  fit: BoxFit.fill, loadingBuilder: (_, Widget child,
                                      ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                }
                              })),
                        ),SizedBox(height: 7,),
                        Container(
                            width: 100,
                            child: Text(
                              photos[index].name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w700),
                            )),
                      ],
                    ),
                    SizedBox(width: 20,)
                  ],

                ),
                itemCount: photos.length,
              ),
            ),
          ],
        ));
  }
}
