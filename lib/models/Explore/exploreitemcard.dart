import 'dart:ffi';

import 'package:flutter/material.dart';

class CardExplore extends StatefulWidget {
  CardExplore({Key? key}) : super(key: key);

  @override
  State<CardExplore> createState() => _CardExploreState();
}

class _CardExploreState extends State<CardExplore> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: ((context, index) => Card(
         
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Theme.of(context).shadowColor,
            child: Container(
              margin: EdgeInsets.all(8),
              width: 150,
              child: Column(
                children: [
                  cardData[0],
                  cardData[1],
                  cardData[2]
                ],
              ),
            ))));
  }
}

List cardData = [
  Padding(padding: EdgeInsets.all(8),child: Image.asset('lib/assets/cake.png'),),
  Text("Whatever Cake"),
  Text('32.99')

];
