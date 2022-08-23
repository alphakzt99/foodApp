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
        width: 200,
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('lib/assets/cake.png'))),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 10),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'Walgreens\n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
            TextSpan(text: 'Fresh and tasty',style: TextStyle(fontSize: 12,color: Colors.white70))
          ]),
        )
      ),
      Row(
        children: [
          RichText(
            textScaleFactor: 1.2,
            text: TextSpan(children: [
              TextSpan(
                  text: "\$3.55", style: TextStyle(fontWeight: FontWeight.bold))
            ]),
          ),
          Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(left:90),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    pressed = true;
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                )),
          )
        ],
      )
    ];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: index1,
        itemBuilder: ((context, index) => Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(8, 8),
                      blurRadius: 5,
                      color: Theme.of(context).shadowColor)
                ],
                borderRadius: BorderRadius.circular(20),
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
