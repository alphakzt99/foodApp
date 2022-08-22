import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/Explore/Tab1.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';

class CardExplore extends StatefulWidget {
  const CardExplore({Key? key}) : super(key: key);

  @override
  State<CardExplore> createState() => _CardExploreState();
}

class _CardExploreState extends State<CardExplore> {
  int index1 = 7;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    List cardData = [
      Container(
        width: 280,
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('lib/assets/cake.png'))),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              "Banh Mi",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColorLight),
            ),
          ),
          IconButton(
              padding: EdgeInsets.only(
                left: 120,
              ),
              onPressed: () {
                setState(() {
                  pressed = true;
                });
              },
              icon: pressed
                  ? Icon(
                      MyFlutterApp.favorite,
                      color: Theme.of(context).primaryColorLight,
                    )
                  : Icon(
                      MyFlutterApp.favorite_border,
                      color: Theme.of(context).primaryColorLight,
                    ))
        ],
      ),
      Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: RichText(
            textScaleFactor: 1.5,
            text: TextSpan(children: [
              TextSpan(text: "1.4 km, 20 min\n"),
              TextSpan(text: "\$3.55 delivery fee")
            ]),
          ))
    ];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: index1,
        itemBuilder: ((context, index) => Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      color: Theme.of(context).shadowColor)
                ],
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).primaryColor),
            child: Column(
              children: [
                cardData[0],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [cardData[1], cardData[2]],
                ),
              ],
            ))));
  }
}
